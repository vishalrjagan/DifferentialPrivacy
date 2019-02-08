#include <iostream>
#include <list>
#include <vector>
#include <map>
#include <set>
#include <fstream>
#include <string>
#include <cstring>
using namespace std;

bool other_compare(vector<int> v1, vector<int> v2)
{
	int diff = 0;
	for(int i=0;i<v1.size();i++)
		if(abs(v1[i]-v2[i])>1)
			return false;
	return true;
}

bool compare(vector<int> v1, vector<int> v2)
{
	int diff = 0;
	for(int i=0;i<v1.size();i++)
	{
		diff+=abs(v1[i]-v2[i]);
		if(abs(v1[i]-v2[i])>1)
			return false;
	}
	return diff<=1;
}