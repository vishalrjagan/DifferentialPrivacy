#include <vector>
using namespace std;

vector<int> numeric_sparse(int c, vector<int> in) {
  // threshold T=0 in all experiments
  int T = 0;
  int count = 0;
  vector<int> out;
  for(vector<int>::iterator i=in.begin();i!=in.end();i++) {
    if (*i > T && count < c) {
      out.push_back(1);
      count++;
    } else {
      out.push_back(0);
    }
  }
  return out;
}

int noisy_max(vector<int> in) {
  int out=in.front();
  for(vector<int>::iterator i=in.begin();i!=in.end();i++) {
    if(*i > out) {
      out = *i;
    } else {continue;}
  }
  return out;
}

int noisy_hist(vector<int> in) {
  return 0;
}

vector<int> randomized_response(vector<int> in) {
  vector<int> out;
  return out;
}

int main() {
  return -1;
}
