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
	out.open("Inputs/input_"+toString(n)+"_nmax5.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	out<<"int out;"<<endl;
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
		out<<"if b then return out; fi;"<<endl;
	}
	out<<"out = "<<n-1<<";"<<endl;
	out<<"return out;"<<endl;
	out.close();
}