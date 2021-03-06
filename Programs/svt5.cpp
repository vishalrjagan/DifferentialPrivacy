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
	int tmp;
	cin>>tmp;
	for(int i=0;i<n;i++)
	{
		t.push_back(tmp);
	}
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_svt5.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	for(int i=0;i<n;i++)
		out<<"int t"<<i<<";"<<endl<<"t"<<i<<" = "<<t[i]<<";"<<endl;
	out<<"int c;\nc = "<<c<<";\nint del;\ndel = "<<del<<";"<<endl; 
	for(int i=0;i<n;i++)
	{
		out<<"bool out"<<i<<";"<<endl;
		out<<"out"<<i<<" = false;"<<endl;
	}
	out<<"int one;"<<endl<<"one = 1;"<<endl;
	out<<"int zero;"<<endl<<"zero = 0;"<<endl;
	out<<"real rhs"<<0<<";"<<endl;
	out<<"rhs"<<0<<" = Lap \"eps / ( 2 * del )\" zero;"<<endl;
	for(int j=0;j<n;j++)
	{
		out<<"real lhs"<<j<<";"<<endl;
		out<<"q"<<j<<" = q"<<j<<" - t"<<j<<";"<<endl;
		out<<"lhs"<<j<<" = q"<<j<<";"<<endl;
		out<<"out"<<j<<" = lhs"<<j<<" >= rhs"<<0<<";"<<endl;
	}
	out<<"return";
	for(int i=0;i<n;i++)
		out<<" out"<<i;
	out<<";"<<endl;
	out.close();
}