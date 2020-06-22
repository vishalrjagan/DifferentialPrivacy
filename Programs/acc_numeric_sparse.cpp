#include<iostream>
#include<vector>
#include<fstream>
#include<cassert>
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
	int n, c, gamma, thresh;
	vector<int> t;
	cout<<"Number of Queries: ";
	cin>>n;
	cout<<"c: ";
	cin>>c;
	cout<<"Range: ";
	int left, right;
	cin>>left>>right;
  cout<<"Gamma: ";
  cin>>gamma;
  cout<<"Threshold: ";
  cin>>thresh;
  // Preamble, initialize variables
  for(int i=0;i<n;i++) {
    out<<"input int q"<<i<<" "<<left<<right<<";"<<endl;
    out<<"int out"<<i<<"_det"<<";"<<endl;
    out<<"out"<<i<<"_det = zero"<<";"<<endl;
    out<<"int out"<<i<<"_rand"<<";"<<endl;
    out<<"out"<<i<<"_rand = zero"<<";"<<endl;
    out<<"bool out"<<i<<"_det_is_bot"<<";"<<endl;
    out<<"out"<<i<<"_det_is_bot = true"<<";"<<endl;
    out<<"bool out"<<i<<"_rand_is_bot"<<";"<<endl;
    out<<"out"<<i<<"_rand_is_bot = true"<<";"<<endl;
    out<<"bool compare"<<i<<"_det"<<";"<<endl;
    out<<"bool compare"<<i<<"_rand"<<";"<<endl;
    out<<"real noisy_thresh"<<i<<";"<<endl;
    out<<"real noisy_q"<<i<<";"<<endl;
  }
  out<<endl;
  out<<"int one"<<";"<<endl;
  out<<"one = 1"<<";"<<endl;
  out<<"int zero"<<";"<<endl;
  out<<"zero = 0"<<";"<<endl;
  out<<"int count_det"<<";"<<endl;
  out<<"count_det = 0"<<";"<<endl;
  out<<"int count_rand"<<";"<<endl;
  out<<"count_rand = 0"<<";"<<endl;
  out<<"bool done_det"<<";"<<endl;
  out<<"bool done_rand"<<";"<<endl;
  out<<"int thresh"<<";"<<endl;
  out<<"thresh = "<<thresh<<";"<<endl;
  out<<"real noisy_thresh0"<<";"<<endl;
  out<<"noisy_thresh0 = "<<"Lap \"( 9 * c ) / ( 4 * eps )\" thresh"<<";"<<endl;
  // Write deterministic numeric sparse
  write_numeric_sparse_det(0,n);
  // Write randomized numeric sparse
  // write_numeric_sparse_rand(n,c,gamma,thresh);
  // Check conditions
  out.close();
}

void write_numeric_sparse_det(int k, int n) {
  assert((k <= n));
  if(k<n) {
    // Check for c
    out<<"done_det = count_det >= c"<<";"<<endl;
    out<<"if done_det then"<<endl;
      write_numeric_sparse_rand(0,n);
    out<<"else"<<endl;
    // Compare current query
    out<<"compare"<<k<<"_det = q"<<k<<" >= thresh"<<";"<<endl;
    out<<"if compare"<<k<<"_det"<<" then"<<endl;
      out<<"out"<<k<<"_det = q"<<k<<";"<<endl;
      out<<"out"<<k<<"_det_is_bot = false"<<";"<<endl;
      out<<"count_det = count_det + one"<<";"<<endl;
    out<<"fi"<<";"<<endl;
    // End compare current query
    write_numeric_sparse_det(k+1,n);
    out<<"fi"<<";"<<endl;
  }
  else {
    write_numeric_sparse_rand(0,n);
  }
}
void write_numeric_sparse_rand(int k, int n) {
  assert((k <= n));
  if(k<n) {
    // Check for c
    out<<"done_rand = count_rand >= c"<<";"<<endl;
    out<<"if done_rand then"<<endl;
      write_final_check(n);
    out<<"else"<<endl;
    // Compare current query
    out<<"noisy_q"<<k<<" = "<<"Lap \"( 9 * c ) / ( 2 * eps )\" q"<<k<<";"<<endl;
    out<<"compare"<<k<<"_rand = noisy_q"<<k<<" >= noisy_thresh"<<k<<";"<<endl;
    out<<"if compare"<<k<<"_rand"<<" then"<<endl;
      out<<"out"<<k<<"_rand = noisy_q"<<k<<";"<<endl;
      out<<"out"<<k<<"_rand_is_bot = false"<<";"<<endl;
      out<<"count_rand = count_rand + one"<<";"<<endl;
      out<<"real noisy_thresh"<<k+1<<";"<<endl;
      out<<"noisy_thresh"<<k+1<<" = "<<"Lap \"( 9 * c ) / ( 4 * eps )\" thresh"<<";"<<endl;
    out<<"fi"<<";"<<endl;
    // End compare current query
    write_numeric_sparse_rand(k+1,n);
    out<<"fi"<<";"<<endl;
  }
  else {
    write_final_check(n);
  }
}

void write_final_check(int n) {

}


// int main() {
// 	int n, del, c;
// 	vector<int> t;
// 	cout<<"Number of Queries: ";
// 	cin>>n;
// 	cout<<"del: ";
// 	cin>>del;
// 	cout<<"c: ";
// 	cin>>c;
// 	cout<<"Range: ";
// 	int left, right;
// 	cin>>left>>right;
// 	cout<<"t: ";
// 	for(int i=0;i<n;i++)
// 	{
// 		int tmp;
// 		cin>>tmp;
// 		t.push_back(tmp);
// 	}
// 	ofstream out;
// 	out.open("Inputs/input_"+toString(n)+"_svt3.txt", ios::out);
// 	out<<"-10 10"<<endl;
// 	int dl = -1;
// 	int dr = 1;
// 	for(int i=0;i<n;i++)
// 		out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
// 	for(int i=0;i<n;i++)
// 		out<<"int t"<<i<<";"<<endl<<"t"<<i<<" = "<<t[i]<<";"<<endl;
// 	out<<"int c;\nc = "<<c<<";\nint del;\ndel = "<<del<<";"<<endl;
// 	for(int i=0;i<n;i++)
// 	{
// 		out<<"int out"<<i<<";"<<endl;
// 		out<<"out"<<i<<" = "<<dl-1<<";"<<endl;
// 	}
// 	out<<"int one;"<<endl<<"one = 1;"<<endl;
// 	out<<"int zero;"<<endl<<"zero = 0;"<<endl;
// 	out<<"int count;"<<endl;
// 	out<<"count = 0;"<<endl;
// 	for(int j=dl;j<=dr;j++)
// 		out<<"real cnst"<<(j-dl)<<";"<<endl<<"cnst"<<(j-dl)<<" = "<<j<<";"<<endl<<"int icnst"<<(j-dl)<<";"<<endl<<"icnst"<<(j-dl)<<" = "<<j<<";"<<endl;
// 	out<<"real rhs"<<0<<";"<<endl;
// 	out<<"rhs"<<0<<" = Lap \"eps / ( 2 * del )\" zero;"<<endl;
// 	for(int j=0;j<n;j++)
// 	{
// 		out<<"real lhs"<<j<<";"<<endl;
// 		out<<"q"<<j<<" = q"<<j<<" - t"<<j<<";"<<endl;
// 		out<<"lhs"<<j<<" = Lap \"eps / ( 4 * c * del )\" q"<<j<<";"<<endl;
// 		out<<"bool c"<<j<<";"<<endl<<"c"<<j<<" = lhs"<<j<<" >= rhs"<<0<<";"<<endl;
// 		out<<"if c"<<j<<" then "<<endl;
// 		for(int k=dl;k<dr;k++)
// 			out<<"bool d"<<(k-dl)<<j<<";"<<endl<<"d"<<(k-dl)<<j<<" = lhs"<<j<<" <= cnst"<<(k-dl)<<";"<<endl<<"if d"<<(k-dl)<<j<<" then out"<<j<<" = icnst"<<(k-dl)<<";"<<endl<<"else "<<endl;
// 		out<<"out"<<j<<" = icnst"<<(dr-dl)<<";"<<endl;
// 		for(int k=dl;k<dr;k++)
// 			out<<"fi;"<<endl;
// 		out<<"count = count + one; fi;"<<endl;
// 		out<<"bool b"<<j<<";"<<endl<<"b"<<j<<" = count >= c;"<<endl;
// 		out<<"if b"<<j<<" then return";
// 		for(int i=0;i<n;i++)
// 			out<<" out"<<i;
// 		out<<"; fi ;"<<endl;
// 	}
// 	out<<"return";
// 	for(int i=0;i<n;i++)
// 		out<<" out"<<i;
// 	out<<";"<<endl;
// 	out.close();
// }
