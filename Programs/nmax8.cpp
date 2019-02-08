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
	int dl = -1;
	int dr = 1;
	cout<<"Number of Queries: ";
	cin>>n;
	cout<<"Range: ";
	int left, right;
	cin>>left>>right;
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_nmax8.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	out<<"int out;"<<endl;
	for(int j=dl;j<=dr;j++)
		out<<"real cnst"<<(j-dl)<<";"<<endl<<"cnst"<<(j-dl)<<" = "<<j<<";"<<endl<<"int icnst"<<(j-dl)<<";"<<endl<<"icnst"<<(j-dl)<<" = "<<j<<";"<<endl;
	for(int j=0;j<n;j++)
	{
		out<<"real val"<<j<<";"<<endl;
		out<<"val"<<j<<" = Exp \"eps / 2\" q"<<j<<";"<<endl;
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
		for(int k=dl;k<dr;k++)
			out<<"bool d"<<(k-dl)<<i<<";"<<endl<<"d"<<(k-dl)<<i<<" = val"<<i<<" <= cnst"<<(k-dl)<<";"<<endl<<"if d"<<(k-dl)<<i<<" then out"<<" = icnst"<<(k-dl)<<";"<<endl<<"else "<<endl;
		out<<"out"<<" = icnst"<<(dr-dl)<<";"<<endl;
		for(int k=dl;k<dr;k++)
			out<<"fi;"<<endl;
		out<<"if b then return out; fi;"<<endl;
	}
	for(int k=dl;k<dr;k++)
		out<<"bool d"<<(k-dl)<<n-1<<";"<<endl<<"d"<<(k-dl)<<n-1<<" = val"<<n-1<<" <= cnst"<<(k-dl)<<";"<<endl<<"if d"<<(k-dl)<<n-1<<" then out"<<" = icnst"<<(k-dl)<<";"<<endl<<"else "<<endl;
	out<<"out"<<" = icnst"<<(dr-dl)<<";"<<endl;
	for(int k=dl;k<dr;k++)
		out<<"fi;"<<endl;
	out<<"return out;"<<endl;
	out.close();
}

