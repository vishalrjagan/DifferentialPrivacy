#include <iostream>
#include <list>
#include <vector>
#include <map>
#include <set>
#include <fstream>
#include <string>
#include <cstring>
using namespace std;

string toString(int x)
{
	string res="";
	while(x>0)
	{
		res = (char)(x%10 + 48) + res;
		x = x/10;
	}
	return res;
}

int main()
{
	string arr[]={"svt", "nmax", "rr"};
	ofstream out2;
	bool script = true;
	out2.open("generateInputs.sh", ios::out);
	for(int i=1;i<=5;i++)
	{
		for(int j=3;j>0;j--)
		{
			for(int k=0;k>-2;k--)
			{
				for(int l=0;l<3;l++)
				{
					ofstream out1;
					out1.open("./ProgramInputs/"+toString(i)+"_"+toString(j)+"_"+toString(k+2)+"_"+arr[l]+".in", ios::out);
					if(l==0)
					{
						out1<<i<<endl<<1<<endl<<j<<endl<<k<<" "<<1<<endl<<0;
						for(int t=1;t<i;t++)
							out1<<" 0";
						out1<<endl;
					}
					if(l==1)
					{
						out1<<i<<endl<<k<<" "<<1<<endl;
					}
					if(l==2)
					{
						out1<<i<<endl;
					}
					out1.close();
					if(script)
					{
						if(l==0)
						{
							for(int m=1;m<=8;m++)
							{
								if(m==8)
									out2<<"g++ Programs/svt3_01.cpp"<<endl;
								else
									out2<<"g++ Programs/svt"<<m<<".cpp"<<endl;
								out2<<"./a.out <ProgramInputs/"+toString(i)+"_"+toString(j)+"_"+toString(k+2)+"_"+arr[l]+".in"<<endl;
								if(m==8)
									continue;
								if(j>1 && k<0)
									out2<<"mv Inputs/input_"<<i<<"_"<<arr[l]<<m<<".txt Inputs/input_"<<i<<"_"<<arr[l]<<m<<"_c"<<j<<".txt"<<endl;
								if(j<=1 && k>=0)
									out2<<"mv Inputs/input_"<<i<<"_"<<arr[l]<<m<<".txt Inputs/input_"<<i<<"_"<<arr[l]<<m<<"_d"<<k<<".txt"<<endl;
								if(j>1 && k>=0)
									out2<<"mv Inputs/input_"<<i<<"_"<<arr[l]<<m<<".txt Inputs/input_"<<i<<"_"<<arr[l]<<m<<"_c"<<j<<"_d"<<k<<".txt"<<endl;
							}
						}
						if(l==1)
						{
							if(j>1)
								continue;
							for(int m=5;m<11;m++)
							{
								out2<<"g++ Programs/nmax"<<m<<".cpp"<<endl;
								out2<<"./a.out <ProgramInputs/"+toString(i)+"_"+toString(j)+"_"+toString(k+2)+"_"+arr[l]+".in"<<endl;
							}
						}
						if(l==2)
						{
							if(j>1 || k>-1)
								continue;
							// for(int m=5;m<11;m++)
							{
								out2<<"g++ Programs/rr"<<".cpp"<<endl;
								out2<<"./a.out <ProgramInputs/"+toString(i)+"_"+toString(j)+"_"+toString(k+2)+"_"+arr[l]+".in"<<endl;
								out2<<"g++ Programs/rr_correct"<<".cpp"<<endl;
								out2<<"./a.out <ProgramInputs/"+toString(i)+"_"+toString(j)+"_"+toString(k+2)+"_"+arr[l]+".in"<<endl;
							}
						}
					}
				}
			}
		}
	}
	out2.close();
}