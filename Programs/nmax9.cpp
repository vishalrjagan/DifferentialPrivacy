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
	cout<<"Number of Queries: ";
	cin>>n;
	cout<<"Range: ";
	int left, right;
	cin>>left>>right;
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_nmax9.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	for(int j=0;j<n;j++)
		out<<"int out"<<j<<";"<<endl;
	for(int j=-1;j<=1;j++)
		out<<"real cnst"<<(j+1)<<";"<<endl<<"cnst"<<(j+1)<<" = "<<j<<";"<<endl<<"int icnst"<<(j+1)<<";"<<endl<<"icnst"<<(j+1)<<" = "<<j<<";"<<endl;
	for(int j=0;j<n;j++)
	{
		out<<"real val"<<j<<";"<<endl;
		out<<"val"<<j<<" = Lap \"eps\" q"<<j<<";"<<endl;
		for(int k=-1;k<1;k++)
			out<<"bool d"<<(k+1)<<j<<";"<<endl<<"d"<<(k+1)<<j<<" = val"<<j<<" <= cnst"<<(k+1)<<";"<<endl<<"if d"<<(k+1)<<j<<" then out"<<j<<" = icnst"<<(k+1)<<";"<<endl<<"else "<<endl;
		out<<"out"<<j<<" = icnst"<<(1+1)<<";"<<endl;
		for(int k=-1;k<1;k++)
			out<<"fi;"<<endl;
	}
	out<<"return";
	for(int j=0;j<n;j++)
		out<<" out"<<j;
	out<<";"<<endl;
	out.close();
}