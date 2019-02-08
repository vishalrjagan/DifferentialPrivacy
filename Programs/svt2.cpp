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
void generateCode(int j, int n, int k)
{
	ofstream out;
	out.open("Inputs/input_"+toString(n)+"_svt2.txt", ios::app);
	out<<"real lhs"<<j<<";"<<endl<<"lhs"<<j<<" = Lap \"eps / ( 4 * c * del )\" q"<<j<<";"<<endl;
	out<<"out"<<j<<" = lhs"<<j<<" >= rhs"<<k<<";"<<endl;
	out<<"if out"<<j<<" then"<<endl;
	out<<"count = count + one;"<<endl;
	out<<"b = count >= c;"<<endl;
	out<<"if b then return";
	for(int l=0;l<n;l++)
		out<<" out"<<l;
	out<<"; fi;"<<endl;
	out.close();
	if(j<n-1)
	{
		out.open("Inputs/input_"+toString(n)+"_svt2.txt", ios::app);
		out<<"real rhs"<<(k+1)<<";"<<endl;
		out<<"rhs"<<(k+1)<<" = Lap \"eps / ( 2 * c * del )\" zero;"<<endl;
		out.close();
		generateCode(j+1, n, k+1);
		out.open("Inputs/input_"+toString(n)+"_svt2.txt", ios::app);
		out<<"else "<<endl;
		out.close();
		generateCode(j+1, n, k);
	}
	out.open("Inputs/input_"+toString(n)+"_svt2.txt", ios::app);
	out<<"fi;"<<endl;
	out.close();
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
	out.open("Inputs/input_"+toString(n)+"_svt2.txt", ios::out);
	out<<"-5 5"<<endl;
	for(int i=0;i<n;i++)
		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
	for(int i=0;i<n;i++)
		out<<"int t"<<i<<";"<<endl<<"t"<<i<<" = "<<t[i]<<";"<<endl;
	out<<"int c;\nc = "<<c<<";\nint del;\ndel = "<<del<<";"<<endl;
	out<<"bool b;"<<endl;
	for(int i=0;i<n;i++)
	{
		out<<"bool out"<<i<<";"<<endl;
		out<<"out"<<i<<" = false;"<<endl;
		out<<"q"<<i<<" = q"<<i<<" - t"<<i<<";"<<endl;
	}
	out<<"int one;"<<endl<<"one = 1;"<<endl;
	out<<"int zero;"<<endl<<"zero = 0;"<<endl;
	out<<"int count;"<<endl;
	out<<"count = 0;"<<endl;
	out<<"real rhs"<<0<<";"<<endl;
	out<<"rhs"<<0<<" = Lap \"eps / ( 2 * c * del )\" zero;"<<endl;
	out.close();
	generateCode(0, n, 0);
	out.open("Inputs/input_"+toString(n)+"_svt2.txt", ios::app);
	out<<"return";
	for(int l=0;l<n;l++)
		out<<" out"<<l;
	out<<"; fi;"<<endl;
	out.close();
}