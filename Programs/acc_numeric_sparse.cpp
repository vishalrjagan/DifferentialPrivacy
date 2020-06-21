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
	int n, del, c;
	vector<int> t;
	cout<<"Number of Queries: ";
	cin>>n;
	cout<<"del: ";
	cin>>del;
	cout<<"c: ";
	cin>>c;
	cout<<"Range: ";
	int left, right;
	cin>>left>>right;
	cout<<"t: ";
	for(int i=0;i<n;i++)
	{
		int tmp;
		cin>>tmp;
		t.push_back(tmp);
	}
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_svt3.txt", ios::out);
	out<<"-10 10"<<endl;
	int dl = -1;
	int dr = 1;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	for(int i=0;i<n;i++)
		out<<"int t"<<i<<";"<<endl<<"t"<<i<<" = "<<t[i]<<";"<<endl;
	out<<"int c;\nc = "<<c<<";\nint del;\ndel = "<<del<<";"<<endl;
	for(int i=0;i<n;i++)
	{
		out<<"int out"<<i<<";"<<endl;
		out<<"out"<<i<<" = "<<dl-1<<";"<<endl;
	}
	out<<"int one;"<<endl<<"one = 1;"<<endl;
	out<<"int zero;"<<endl<<"zero = 0;"<<endl;
	out<<"int count;"<<endl;
	out<<"count = 0;"<<endl;
	for(int j=dl;j<=dr;j++)
		out<<"real cnst"<<(j-dl)<<";"<<endl<<"cnst"<<(j-dl)<<" = "<<j<<";"<<endl<<"int icnst"<<(j-dl)<<";"<<endl<<"icnst"<<(j-dl)<<" = "<<j<<";"<<endl;
	out<<"real rhs"<<0<<";"<<endl;
	out<<"rhs"<<0<<" = Lap \"eps / ( 2 * del )\" zero;"<<endl;
	for(int j=0;j<n;j++)
	{
		out<<"real lhs"<<j<<";"<<endl;
		out<<"q"<<j<<" = q"<<j<<" - t"<<j<<";"<<endl;
		out<<"lhs"<<j<<" = Lap \"eps / ( 4 * c * del )\" q"<<j<<";"<<endl;
		out<<"bool c"<<j<<";"<<endl<<"c"<<j<<" = lhs"<<j<<" >= rhs"<<0<<";"<<endl;
		out<<"if c"<<j<<" then "<<endl;
		for(int k=dl;k<dr;k++)
			out<<"bool d"<<(k-dl)<<j<<";"<<endl<<"d"<<(k-dl)<<j<<" = lhs"<<j<<" <= cnst"<<(k-dl)<<";"<<endl<<"if d"<<(k-dl)<<j<<" then out"<<j<<" = icnst"<<(k-dl)<<";"<<endl<<"else "<<endl;
		out<<"out"<<j<<" = icnst"<<(dr-dl)<<";"<<endl;
		for(int k=dl;k<dr;k++)
			out<<"fi;"<<endl;
		out<<"count = count + one; fi;"<<endl;
		out<<"bool b"<<j<<";"<<endl<<"b"<<j<<" = count >= c;"<<endl;
		out<<"if b"<<j<<" then return";
		for(int i=0;i<n;i++)
			out<<" out"<<i;
		out<<"; fi ;"<<endl;
	}
	out<<"return";
	for(int i=0;i<n;i++)
		out<<" out"<<i;
	out<<";"<<endl;
	out.close();
}
