#include <cmath>
using namespace std;

// alpha = ((8*c) / epsilon) * (log(k) + log((2*c) / beta));
double beta_numeric_sparse(double alpha, int c, double eps, int k) {
  return ((2*c) / exp((eps * alpha / (8 * c)) - log(k)));
}

int main() {
  return -1;
}
