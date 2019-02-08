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
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_rr.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input bool q"<<i<<";"<<endl;
	for(int i=0;i<n;i++)
	{
		out<<"bool out"<<i<<";"<<endl;
		out<<"out"<<i<<" = q"<<i<<";"<<endl;
		out<<"Prob[(1-eps)/2] out"<<i<<" = ! q"<<i<<";"<<endl;
	}
	out<<"return";
	for(int i=0;i<n;i++)
		out<<" out"<<i;
	out<<";"<<endl;
	out.close();
}