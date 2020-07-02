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

void weaved(ofstream& out, int k, int n) {
  assert((k <= n));
  if(k<n) {
    out<<"done_det = count_det >= c"<<";"<<endl;
    out<<"done_rand = count_rand >= c"<<";"<<endl;
    out<<"not_done_det = ! done_det"<<";"<<endl;
    out<<"not_done_rand = ! done_rand"<<";"<<endl;

    out<<"done_both = done_det && done_rand"<<";"<<endl;
    out<<"done_only_det = done_det && not_done_rand"<<";"<<endl;
    out<<"done_only_rand = not_done_det && done_rand"<<";"<<endl;
    out<<"done_one = done_only_det || done_only_rand"<<";"<<endl;
    out<<"done_none = not_done_det && not_done_rand"<<";"<<endl;

    // Both are done, all checks passed
    out<<"if done_both then"<<endl;
    out<<"return one"<<";"<<endl;
    out<<"fi"<<";"<<endl;

    // Neither is done, so continue

    // Det
    out<<"compare"<<k<<"_det = q"<<k<<" >= thresh"<<";"<<endl;
    out<<"if compare"<<k<<"_det"<<" then"<<endl;
    out<<"out"<<k<<"_det = q"<<k<<";"<<endl;
    out<<"out"<<k<<"_det_is_bot = false"<<";"<<endl;
    out<<"count_det = count_det + one"<<";"<<endl;
    out<<"fi"<<";"<<endl;

    // out<<"real noisy_thresh"<<k+1<<";"<<endl;
    out<<"real noisy_q"<<k<<";"<<endl;
    out<<"noisy_q"<<k<<" = "<<"Lap \"eps / ( 9 * c )\" q"<<k<<";"<<endl;

    // Getting around no real <- real assignments
    out<<"use_noisy_thresh0 = count_rand == zero"<<";"<<endl;

    out<<"real out"<<k<<"_rand"<<";"<<endl;
    out<<"if use_noisy_thresh0 then"<<endl;
    out<<"compare"<<k<<"_rand = noisy_q"<<k<<" >= noisy_thresh0"<<";"<<endl;
    out<<"if compare"<<k<<"_rand"<<" then"<<endl;
    out<<"out"<<k<<"_rand = noisy_q"<<k<<";"<<endl;
    out<<"out"<<k<<"_rand_is_bot = false"<<";"<<endl;
    out<<"count_rand = count_rand + one"<<";"<<endl;
    // out<<"noisy_thresh"<<k+1<<" = "<<"Lap \"( 4 * eps ) / ( 9 * c )\" thresh"<<";"<<endl;
    out<<"else"<<endl;
    out<<"out"<<k<<"_rand = 0"<<";"<<endl;
    // out<<"noisy_thresh"<<k+1<<" = noisy_thresh"<<k<<";"<<endl;
    out<<"fi"<<";"<<endl;
    out<<"else"<<endl;
    out<<"compare"<<k<<"_rand = noisy_q"<<k<<" >= noisy_thresh1"<<";"<<endl;
    out<<"if compare"<<k<<"_rand"<<" then"<<endl;
    out<<"out"<<k<<"_rand = noisy_q"<<k<<";"<<endl;
    out<<"out"<<k<<"_rand_is_bot = false"<<";"<<endl;
    out<<"count_rand = count_rand + one"<<";"<<endl;
    // out<<"noisy_thresh"<<k+1<<" = "<<"Lap \"( 4 * eps ) / ( 9 * c )\" thresh"<<";"<<endl;
    out<<"else"<<endl;
    out<<"out"<<k<<"_rand = 0"<<";"<<endl;
    // out<<"noisy_thresh"<<k+1<<" = noisy_thresh"<<k<<";"<<endl;
    out<<"fi"<<";"<<endl;
    out<<"fi"<<";"<<endl;
    // End: Getting around no real <- real assignments

    // out<<"compare"<<k<<"_rand = noisy_q"<<k<<" >= noisy_thresh"<<k<<";"<<endl;
    // out<<"real out"<<k<<"_rand"<<";"<<endl;
    // out<<"if compare"<<k<<"_rand"<<" then"<<endl;
    // out<<"out"<<k<<"_rand = noisy_q"<<k<<";"<<endl;
    // out<<"out"<<k<<"_rand_is_bot = false"<<";"<<endl;
    // out<<"count_rand = count_rand + one"<<";"<<endl;
    // out<<"noisy_thresh"<<k+1<<" = "<<"Lap \"( 4 * eps ) / ( 9 * c )\" thresh"<<";"<<endl;
    // out<<"else"<<endl;
    // out<<"out"<<k<<"_rand = 0"<<";"<<endl;
    // out<<"noisy_thresh"<<k+1<<" = noisy_thresh"<<k<<";"<<endl;
    // out<<"fi"<<";"<<endl;

    // Compare
    out<<"bool not_out"<<k<<"_det_is_bot"<<";"<<endl;
    out<<"bool not_out"<<k<<"_rand_is_bot"<<";"<<endl;
    out<<"not_out"<<k<<"_det_is_bot = ! out"<<k<<"_det_is_bot"<<";"<<endl;
    out<<"not_out"<<k<<"_rand_is_bot = ! out"<<k<<"_rand_is_bot"<<";"<<endl;

    // Check for the two possible ways to return zero. Using fresh
    // variables for each query because I do not understand the
    // implementation.

    // Only one of randomized and deterministic has a bottom query
    out<<"bool only_one_is_bot"<<k<<";"<<endl;
    out<<"bool only_det_is_bot"<<k<<";"<<endl;
    out<<"bool only_rand_is_bot"<<k<<";"<<endl;
    out<<"only_det_is_bot"<<k<<" = out"<<k<<"_det_is_bot && not_out"<<k<<"_rand_is_bot"<<";"<<endl;
    out<<"only_rand_is_bot"<<k<<" = out"<<k<<"_rand_is_bot && not_out"<<k<<"_det_is_bot"<<";"<<endl;
    out<<"only_one_is_bot"<<k<<" = only_det_is_bot"<<k<<" || only_rand_is_bot"<<k<<";"<<endl;

    out<<"if only_one_is_bot"<<k<<" then"<<endl;
    out<<"return zero"<<";"<<endl;
    out<<"fi"<<";"<<endl;

    // Both are not bot
    out<<"bool both_are_not_bot"<<k<<";"<<endl;
    out<<"both_are_not_bot"<<k<<" = not_out"<<k<<"_det_is_bot && not_out"<<k<<"_rand_is_bot"<<";"<<endl;


    // Ensure reals get exactly one value in each branch of execution
    out<<"real cast_minus"<<k<<";"<<endl;
    out<<"real cast_plus"<<k<<";"<<endl;

    out<<"if both_are_not_bot"<<k<<" then"<<endl;
    // Integer vs real-valued gamma
    out<<"int minus_gamma"<<k<<";"<<endl;
    out<<"minus_gamma"<<k<<" = out"<<k<<"_det - gamma"<<";"<<endl;
    out<<"int plus_gamma"<<k<<";"<<endl;
    out<<"plus_gamma"<<k<<" = out"<<k<<"_det + gamma"<<";"<<endl;
    out<<"cast_minus"<<k<<" = minus_gamma"<<k<<";"<<endl;
    out<<"cast_plus"<<k<<" = plus_gamma"<<k<<";"<<endl;
    out<<"conjunct1 = noisy_q"<<k<<" >= cast_minus"<<k<<";"<<endl;
    out<<"conjunct2 = noisy_q"<<k<<" <= cast_plus"<<k<<";"<<endl;

    out<<"conjunction = conjunct1 && conjunct2"<<";"<<endl;
    out<<"not_conjunction = ! conjunction"<<";"<<endl;
    out<<"if not_conjunction then"<<endl;
    out<<"return zero"<<";"<<endl;
    out<<"fi"<<";"<<endl;
    out<<"else"<<endl;
    out<<"cast_minus"<<k<<" = 0"<<";"<<endl;
    out<<"cast_plus"<<k<<" = 0"<<";"<<endl;
    out<<"fi"<<";"<<endl;

    // Generate next query's code
    weaved(out,k+1,n);
  }
  else {
    out<<"return one"<<";"<<endl;
  }
}

int main()
{
	int n, c, thresh, gamma;
	cout<<"Number of Queries: ";
	cin>>n;
	cout<<"c: ";
	cin>>c;
  if (c > 2 || c < 1) {
    cout<<"c > 2 and c < 1 not supported. Exiting."<<endl;
    return -1;
  }
	cout<<"Range: ";
	int left, right;
	cin>>left>>right;
  cout<<"Gamma: ";
  cin>>gamma;
  cout<<"Threshold: ";
  cin>>thresh;
  ofstream out;
  out.open("../Inputs/acc_"+toString(n)+"_numeric_sparse.txt", ios::out);
  // Preamble, initialize variables
  out<<"-10 10"<<endl;
  for(int j=0;j<n;j++) {
    out<<"input int q"<<j<<" "<<left<<" "<<right<<";"<<endl;
  }
  for(int i=0;i<n;i++) {
    out<<"int out"<<i<<"_det"<<";"<<endl;
    out<<"out"<<i<<"_det = 0"<<";"<<endl;
    out<<"bool out"<<i<<"_det_is_bot"<<";"<<endl;
    out<<"out"<<i<<"_det_is_bot = true"<<";"<<endl;
    out<<"bool out"<<i<<"_rand_is_bot"<<";"<<endl;
    out<<"out"<<i<<"_rand_is_bot = true"<<";"<<endl;
    out<<"bool compare"<<i<<"_det"<<";"<<endl;
    out<<"bool compare"<<i<<"_rand"<<";"<<endl;
  }
  out<<endl;
  out<<"int one"<<";"<<endl;
  out<<"one = 1"<<";"<<endl;
  out<<"int zero"<<";"<<endl;
  out<<"zero = 0"<<";"<<endl;
  out<<"int c"<<";"<<endl;
  out<<"c = "<<c<<";"<<endl;
  out<<"int count_det"<<";"<<endl;
  out<<"count_det = 0"<<";"<<endl;
  out<<"int count_rand"<<";"<<endl;
  out<<"count_rand = 0"<<";"<<endl;
  out<<"bool done_det"<<";"<<endl;
  out<<"bool done_rand"<<";"<<endl;
  out<<"bool not_done_det"<<";"<<endl;
  out<<"bool not_done_rand"<<";"<<endl;
  out<<"bool done_both"<<";"<<endl;
  out<<"bool done_only_det"<<";"<<endl;
  out<<"bool done_only_rand"<<";"<<endl;
  out<<"bool done_one"<<";"<<endl;
  out<<"bool done_none"<<";"<<endl;
  out<<"bool conjunct1"<<";"<<endl;
  out<<"bool conjunct2"<<";"<<endl;
  out<<"bool conjunction"<<";"<<endl;
  out<<"bool not_conjunction"<<";"<<endl;
  out<<"int thresh"<<";"<<endl;
  out<<"thresh = "<<thresh<<";"<<endl;
  out<<"int gamma"<<";"<<endl;
  out<<"gamma = "<<gamma<<";"<<endl;
  out<<"real noisy_thresh0"<<";"<<endl;
  out<<"noisy_thresh0 = "<<"Lap \"( 4 * eps ) / ( 9 * c )\" thresh"<<";"<<endl;
  out<<"bool use_noisy_thresh0"<<";"<<endl;
  out<<"use_noisy_thresh0 = true"<<";"<<endl;
  out<<"real noisy_thresh1"<<";"<<endl;
  out<<"noisy_thresh1 = "<<"Lap \"( 4 * eps ) / ( 9 * c )\" thresh"<<";"<<endl;
  weaved(out,0,n);
  out.close();
}




// ------------------------------------Branching Version----------------------------------------

// void write_final_check(ofstream& out, int k, int n) {
//   assert((k <= n));
//   if(k<n) {
//     out<<"if out"<<k<<"_det_is_bot then"<<endl;
//     out<<"if out"<<k<<"_rand_is_bot then"<<endl;
//     // Both are bot, so continue to next query
//     write_final_check(out,k+1,n);

//     out<<"else"<<endl;
//     out<<"return zero"<<";"<<endl;
//     out<<"fi"<<";"<<endl;

//     out<<"else"<<endl;
//     out<<"if out"<<k<<"_rand_is_bot then"<<endl;
//     out<<"return zero"<<";"<<endl;
//     out<<"else"<<endl;
//     // Neither is bot, so perform check, then continue to next query
//     out<<"real cast_q"<<k<<";"<<endl;
//     out<<"cast_q"<<k<<" = out"<<k<<"_det"<<";"<<endl;
//     out<<"real minus_gamma"<<k<<";"<<endl;
//     out<<"minus_gamma"<<k<<" = cast_q"<<k<<" - gamma"<<";"<<endl;
//     out<<"real plus_gamma"<<k<<";"<<endl;
//     out<<"plus_gamma"<<k<<" = cast_q"<<k<<" + gamma"<<";"<<endl;
//     out<<"bool conjunct1"<<";"<<endl;
//     out<<"conjunct1 = noisy_q"<<k<<" > minus_gamma"<<";"<<endl;
//     out<<"conjunct2 = noisy_q"<<k<<" < plus_gamma"<<";"<<endl;
//     out<<"bool conjunction"<<";"<<endl;
//     out<<"conjunction = conjunct1 && conjunct2"<<";"<<endl;

//     out<<"if conjunction then"<<endl;
//     write_final_check(out,k+1,n);
//     out<<"else"<<endl;
//     out<<"return zero"<<";"<<endl;
//     out<<"fi"<<";"<<endl;

//     out<<"fi"<<";"<<endl;
//     out<<"fi"<<";"<<endl;
//   }
//   else {
//     out<<"return one"<<";"<<endl;
//   }
// }

// void write_numeric_sparse_rand(ofstream& out, int k, int n) {
//   assert((k <= n));
//   if(k<n) {
//     // Check for c
//     out<<"done_rand = count_rand >= c"<<";"<<endl;
//     out<<"if done_rand then"<<endl;
//       write_final_check(out,0,n);
//     out<<"else"<<endl;
//     // Compare current query
//     out<<"noisy_q"<<k<<" = "<<"Lap \"( 9 * c ) / ( 2 * eps )\" q"<<k<<";"<<endl;
//     out<<"compare"<<k<<"_rand = noisy_q"<<k<<" >= noisy_thresh"<<k<<";"<<endl;
//     out<<"if compare"<<k<<"_rand"<<" then"<<endl;
//       out<<"out"<<k<<"_rand = noisy_q"<<k<<";"<<endl;
//       out<<"out"<<k<<"_rand_is_bot = false"<<";"<<endl;
//       out<<"count_rand = count_rand + one"<<";"<<endl;
//       out<<"real noisy_thresh"<<k+1<<";"<<endl;
//       out<<"noisy_thresh"<<k+1<<" = "<<"Lap \"( 9 * c ) / ( 4 * eps )\" thresh"<<";"<<endl;
//     out<<"fi"<<";"<<endl;
//     // End compare current query
//     write_numeric_sparse_rand(out,k+1,n);
//     out<<"fi"<<";"<<endl;
//   }
//   else {
//     write_final_check(out,0,n);
//   }
// }

// void write_numeric_sparse_det(ofstream& out, int k, int n) {
//   assert((k <= n));
//   if(k<n) {
//     // Check for c
//     out<<"done_det = count_det >= c"<<";"<<endl;
//     out<<"if done_det then"<<endl;
//       write_numeric_sparse_rand(out,0,n);
//     out<<"else"<<endl;
//     // Compare current query
//     out<<"compare"<<k<<"_det = q"<<k<<" >= thresh"<<";"<<endl;
//     out<<"if compare"<<k<<"_det"<<" then"<<endl;
//       out<<"out"<<k<<"_det = q"<<k<<";"<<endl;
//       out<<"out"<<k<<"_det_is_bot = false"<<";"<<endl;
//       out<<"count_det = count_det + one"<<";"<<endl;
//     out<<"fi"<<";"<<endl;
//     // End compare current query
//     write_numeric_sparse_det(out,k+1,n);
//     out<<"fi"<<";"<<endl;
//   }
//   else {
//     write_numeric_sparse_rand(out,0,n);
//   }
// }

// int main()
// {
// 	int n, c, gamma, thresh;
// 	vector<int> t;
// 	cout<<"Number of Queries: ";
// 	cin>>n;
// 	cout<<"c: ";
// 	cin>>c;
// 	cout<<"Range: ";
// 	int left, right;
// 	cin>>left>>right;
//   cout<<"Gamma: ";
//   cin>>gamma;
//   cout<<"Threshold: ";
//   cin>>thresh;
//   ofstream out;
//   out.open("../Inputs/acc_"+toString(n)+"_numeric_sparse.txt", ios::out);
//   // Preamble, initialize variables
//   out<<"-10 10"<<endl;
//   for(int i=0;i<n;i++) {
//     out<<"input int q"<<i<<" "<<left<<" "<<right<<";"<<endl;
//     out<<"int out"<<i<<"_det"<<";"<<endl;
//     out<<"out"<<i<<"_det = 0"<<";"<<endl;
//     out<<"real out"<<i<<"_rand"<<";"<<endl;
//     // out<<"out"<<i<<"_rand = 0"<<";"<<endl;
//     out<<"bool out"<<i<<"_det_is_bot"<<";"<<endl;
//     out<<"out"<<i<<"_det_is_bot = true"<<";"<<endl;
//     out<<"bool out"<<i<<"_rand_is_bot"<<";"<<endl;
//     out<<"out"<<i<<"_rand_is_bot = true"<<";"<<endl;
//     out<<"bool compare"<<i<<"_det"<<";"<<endl;
//     out<<"bool compare"<<i<<"_rand"<<";"<<endl;
//     out<<"real noisy_thresh"<<i<<";"<<endl;
//     out<<"real noisy_q"<<i<<";"<<endl;
//   }
//   out<<endl;
//   out<<"int one"<<";"<<endl;
//   out<<"one = 1"<<";"<<endl;
//   out<<"int zero"<<";"<<endl;
//   out<<"zero = 0"<<";"<<endl;
//   out<<"int c"<<";"<<endl;
//   out<<"c = "<<c<<";"<<endl;
//   out<<"int count_det"<<";"<<endl;
//   out<<"count_det = 0"<<";"<<endl;
//   out<<"int count_rand"<<";"<<endl;
//   out<<"count_rand = 0"<<";"<<endl;
//   out<<"bool done_det"<<";"<<endl;
//   out<<"bool done_rand"<<";"<<endl;
//   out<<"int thresh"<<";"<<endl;
//   out<<"thresh = "<<thresh<<";"<<endl;
//   out<<"real gamma"<<";"<<endl;
//   out<<"gamma = "<<gamma<<";"<<endl;
//   // out<<"real noisy_thresh0"<<";"<<endl;
//   out<<"noisy_thresh0 = "<<"Lap \"( 9 * c ) / ( 4 * eps )\" thresh"<<";"<<endl;
//   // Write deterministic numeric sparse
//   write_numeric_sparse_det(out,0,n);
//   // Write randomized numeric sparse
//   // write_numeric_sparse_rand(n,c,gamma,thresh);
//   // Check conditions
//   out.close();
// }
