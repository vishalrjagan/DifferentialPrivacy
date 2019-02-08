#include<iostream>
#include<vector>
#include<fstream>
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
	int n;
	int d = 1;
	cout<<"Number of Queries: ";
	cin>>n;
	cout<<"Range: ";
	int left, right;
	cin>>left>>right;
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_nmax7_frac.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	out<<"int out;"<<endl;
	float vals[] = {-0.1, 0.1, 2};
	for(int j=-d;j<=d;j++)
		out<<"real cnst"<<(j+d)<<";"<<endl<<"cnst"<<(j+d)<<" = "<<vals[j+d]<<";"<<endl<<"int icnst"<<(j+d)<<";"<<endl<<"icnst"<<(j+d)<<" = "<<j<<";"<<endl;
	for(int j=0;j<n;j++)
	{
		out<<"real val"<<j<<";"<<endl;
		out<<"val"<<j<<" = Lap \"eps / 2\" q"<<j<<";"<<endl;
	}
	for(int i=0;i<n;i++)
		for(int j=0;j<n;j++)
		{
			if(i==j)
				continue;
			out<<"bool cmp"<<i<<"a"<<j<<";"<<endl;
			out<<"cmp"<<i<<"a"<<j<<" = val"<<i<<" >= val"<<j<<";"<<endl;
		}
	out<<"bool b;"<<endl;
	for(int i=0;i<n-1;i++)
	{
		out<<"b = true;"<<endl<<"out = "<<i<<";"<<endl;
		for(int j=0;j<n;j++)
		{
			if(i==j)
				continue;
			out<<"b = b && cmp"<<i<<"a"<<j<<";"<<endl;
		}
		for(int k=-d;k<d;k++)
			out<<"bool d"<<(k+d)<<i<<";"<<endl<<"d"<<(k+d)<<i<<" = val"<<i<<" <= cnst"<<(k+d)<<";"<<endl<<"if d"<<(k+d)<<i<<" then out"<<" = icnst"<<(k+d)<<";"<<endl<<"else "<<endl;
		out<<"out"<<" = icnst"<<(d+d)<<";"<<endl;
		for(int k=-d;k<d;k++)
			out<<"fi;"<<endl;
		out<<"if b then return out; fi;"<<endl;
	}
	for(int k=-d;k<d;k++)
		out<<"bool d"<<(k+d)<<n-1<<";"<<endl<<"d"<<(k+d)<<n-1<<" = val"<<n-1<<" <= cnst"<<(k+d)<<";"<<endl<<"if d"<<(k+d)<<n-1<<" then out"<<" = icnst"<<(k+d)<<";"<<endl<<"else "<<endl;
	out<<"out"<<" = icnst"<<(d+d)<<";"<<endl;
	for(int k=-d;k<d;k++)
		out<<"fi;"<<endl;
	out<<"return out;"<<endl;
	out.close();
}

