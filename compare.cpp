#include <iostream>
#include <list>
#include <vector>
#include <map>
#include <set>
#include <fstream>
#include <string>
#include <cstring>
#include <algorithm>
// #include "input.cpp"
using namespace std;

bool compare(vector<int> v1, vector<int> v2);

list<string> tokenize(string& pgm)
{
	list<string> res;
	int pos=0;
	int depth=0;
	// Assuming that all the operators are separated by whitespace characters. i.e. "4*a" is written as "4 * a"
	while(pos<pgm.size())
	{
		while(pos<pgm.size() && (pgm[pos]==' ' || pgm[pos]=='\t'))
			pos++;
		int newPos = pgm.size();
		if(pgm.find(';', pos)<pgm.size())
			newPos = min(newPos, (int)pgm.find(';', pos));
		if(pgm.find(' ', pos)<pgm.size())
			newPos = min(newPos, (int)pgm.find(' ', pos));
		if(pgm.find('\t', pos)<pgm.size())
			newPos = min(newPos, (int)pgm.find('\t', pos));
		string token = pgm.substr(pos, newPos-pos);
		res.push_back(token);
		if(token=="if")
			depth++;
		else if(token=="fi")
			depth--;
		if(newPos == (int)pgm.find(";", pos))
			if(depth>0)
				res.push_back(";");
			else
				res.push_back("$");
		pos=newPos+1;
	}
	return res;
}
list<string> nextCommand(list<string>& pgm)
{
	list<string> next;
	while(!pgm.empty() && pgm.front()!="$")
	{
		next.push_back(pgm.front());
		// cerr<<pgm.front()<<":";
		pgm.pop_front();
	}
	// cerr<<endl;
	if(!pgm.empty())
		pgm.pop_front();
	return next;
}
void evaluateInputs(list<string> pgm, vector<vector<int>>& inp_set, vector<int> cur_set, int& left, int& right, int count)
{
	list<string> next = nextCommand(pgm);
	if(pgm.size()==0 || next.size()<=0 || next.front()!="input")
	{
		inp_set.push_back(cur_set);
		return;
	}
	map<string, pair<int,int> > ranges;
	ranges["int"] = pair<int,int>(left, right);
	ranges["bool"] = pair<int,int>(0,1);
	next.pop_front();
	string type = next.front();
	int left1 = ranges[type].first;
	int right1 = ranges[type].second;
	next.pop_front();
	next.pop_front();
	if(next.size()>0)
	{
		char tmp1[next.front().size()+1];  
		strcpy(tmp1, next.front().c_str());
		left1 = atoi(tmp1);
		next.pop_front();
		char tmp2[next.front().size()+1];  
		strcpy(tmp2, next.front().c_str());
		right1 = atoi(tmp2);
	}
	for(int i=left1;i<=right1;i++)
	{
		if(cur_set.size()<=count)
			cur_set.push_back(i);
		cur_set[count]=i;
		evaluateInputs(pgm, inp_set, cur_set, left, right, count+1);
	}
}
string print(vector<int> v)
{
	string res="";
	for (int i = 0; i < v.size(); ++i)
	{
		res+=to_string(v[i]);
		if(i!=v.size()-1)
			res+=" ";
	}
	return res;
}
int main(int argc, char** argv)
{
	string rnd(argv[1]);
	string s;
	string pgm;
	int left, right;
	cin>>left;
	cin>>right;
	while(getline(cin,s))
		pgm+=" "+s;
	list<string> pgmTokens = tokenize(pgm);
	vector<vector<int>> inp_set;
	evaluateInputs(pgmTokens, inp_set, vector<int>(), left, right, 0);
	if(rnd!="0")
		random_shuffle(inp_set.begin(), inp_set.end());
	ofstream out;
	out.open("adjacency", ios::out);
	for(int i=0;i<inp_set.size();i++)
	{
		for(int j=0;j<inp_set.size();j++)
		{
			if(i==j)
				continue;
			if(compare(inp_set[i], inp_set[j]))
				out<<print(inp_set[i])<<" ~ "<<print(inp_set[j])<<endl;
		}
	}
	out.close();
}