#include <iostream>
#include <list>
#include <vector>
#include <map>
#include <set>
#include <fstream>
#include <string>
#include <cstring>
using namespace std;

void RevTopSortsUtil(map<string, int> rev_degree, vector<set<string>>& adj, map<string,int>& encoding, vector<string>& curr, vector<vector<string>>& result)
{
	for(map<string, int>::iterator i = encoding.begin(); i!=encoding.end(); i++)
	{
		string var = i->first;
		int ind = i->second;
		if(rev_degree[var]!=0)
			continue;
		curr.push_back(var);
		for(set<string>::iterator j=adj[ind].begin();j!=adj[ind].end();j++)
			rev_degree[*j]-=1;
		rev_degree[var]-=1;
		if(curr.size()<encoding.size())
			RevTopSortsUtil(rev_degree, adj, encoding, curr, result);
		else
			result.push_back(curr);
		rev_degree[var]+=1;
		for(set<string>::iterator j=adj[ind].begin();j!=adj[ind].end();j++)
			rev_degree[*j]+=1;
		curr.pop_back();
	}
}

void RevTopSorts(vector<set<string>>& adj_orig, map<string,int>& encoding, vector<vector<string>>& result)
{
	if(encoding.size()==0)
		return;
	map<string, int> rev_degree;
	vector<set<string>> adj(adj_orig.size(), set<string>());
	for(map<string, int>::iterator i=encoding.begin();i!=encoding.end();i++)
		for(set<string>::iterator j=adj_orig[i->second].begin();j!=adj_orig[i->second].end();j++)
			adj[encoding[*j]].insert(i->first);
	for(int i=0;i<adj.size();i++)
		for(set<string>::iterator j = adj[i].begin();j!=adj[i].end();j++)
		{
			if(rev_degree.find(*j)==rev_degree.end())
				rev_degree[*j]=0;
			rev_degree[*j]++;
		}
	vector<bool> vis(encoding.size(), false);
	vector<string> curr;
	RevTopSortsUtil(rev_degree, adj, encoding, curr, result);
}

// int main()
// {
// 	map<string,int> encoding;
// 	encoding["a"]=0;
// 	encoding["b"]=1;
// 	encoding["c"]=2;
// 	encoding["d"]=3;
// 	encoding["e"]=4;
// 	encoding["f"]=5;
// 	vector<set<string>> adj;
// 	for(int i=0;i<encoding.size();i++)
// 		adj.push_back(set<string>());
// 	adj[encoding["a"]].insert("b");
// 	adj[encoding["a"]].insert("c");
// 	adj[encoding["b"]].insert("d");
// 	adj[encoding["c"]].insert("e");
// 	adj[encoding["d"]].insert("f");
// 	adj[encoding["e"]].insert("f");
// 	vector<vector<string>> result;
// 	RevTopSorts(adj, encoding, result);
// 	cout<<result.size()<<endl;
// 	for(int i=0;i<result.size();i++)
// 	{
// 		for(int j=0;j<result[i].size();j++)
// 			cout<<result[i][j]<<" ";
// 		cout<<endl;
// 	}
// }