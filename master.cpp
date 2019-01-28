#include <iostream>
#include <list>
#include <vector>
#include <map>
#include <set>
#include <fstream>
#include <string>
#include <cstring>
using namespace std;
int lineCount = 0;
void RevTopSorts(vector<set<string>>& adj, map<string,int>& encoding, vector<vector<string>>& result);
class Exp
{
public:
	string type;
	Exp(){}
	Exp(string s)
	{
		type = s;
	}
};
class IntExp: public Exp
{
public:
	int eval;
	static int rangeLeft;
	static int rangeRight;
	IntExp():Exp("int")
	{}
	IntExp(int a):Exp("int")
	{
		eval = a;
	}
	IntExp(IntExp* a):Exp("int")
	{
		eval = a->eval;
	}
};
int IntExp::rangeLeft=-1;
int IntExp::rangeRight=1;
class BoolExp: public Exp
{
public:
	bool eval;
	BoolExp():Exp("bool")
	{}
	BoolExp(int a):Exp("bool")
	{
		eval = (a!=0);
	}
	BoolExp(BoolExp* a):Exp("bool")
	{
		eval = a->eval;
	}
};
class RealExp: public Exp
{
public:
	double eval;
	RealExp():Exp("real")
	{}
	RealExp(float val):Exp("real")
	{
		eval = val;
	}
	RealExp(RealExp* a):Exp("real")
	{
		eval = a->eval;
	}
};
float to_float(string s)
{
	char tmp[s.size()+1];
	strcpy(tmp, s.c_str());
	return atof(tmp);
}
float to_int(string s)
{
	char tmp[s.size()+1];
	strcpy(tmp, s.c_str());
	return atoi(tmp);
}
string createMap(string s, map<string,string>& var_map)
{
	if(s[0]<=57)
		return s;
	if(var_map.find(s)==var_map.end())
		var_map[s]="A"+to_string(var_map.size());
	return var_map[s];
}
string getAssignment(string s, string& assgn, int& varNum)
{
	return s;
	// string part0 = s.substr(0,s.find('[')+1);
	// s=s.substr(s.find('[')+1);
	// string part1 = s.substr(0, s.find(','));
	// s=s.substr(s.find(',')+1);
	// string part2 = s.substr(0, s.find(']'));
	// if(assgn[assgn.size()-1]!='{')
	// 	assgn+=", ";
	// assgn+="X"+to_string(varNum++)+"->"+part1;
	// // assgn+=", X"+to_string(varNum++)+"->"+part2;
	// // return part0+"X"+to_string(varNum-2)+",X"+to_string(varNum-1)+"]";
	// return part0+"X"+to_string(varNum-1)+","+part2+"]";
}
class RealOrderAndTDLap
{
public:
	map<string,int> encoding;
	vector<set<string>> adj;
	vector<set<string>> adj_eq;
	multiset<string> tdl_values;
	map<string,string> real_values;
	void variable(string s)
	{
		encoding[s]=adj.size();
		adj.push_back(set<string>());
		adj_eq.push_back(set<string>());
	}
	void assign(string s, string val)
	{
		real_values[s]=val;
	}
	void assign(string s)
	{
		tdl_values.insert(s);
	}
	void remove(string s)
	{
		tdl_values.erase(tdl_values.find(s));
	}
	void remove(string s1, string s2)
	{
		adj[encoding[s1]].erase(s2);
		adj_eq[encoding[s1]].erase(s2);
		adj_eq[encoding[s1]].erase(s2);
	}
	bool add(string s1, string s2)
	{
		cout<<"ORD "<<s1<<" "<<s2<<endl;
		if(exp_val(s1)!=s1 && exp_val(s2)!=s2)
			if(!(to_float(exp_val(s1))<to_float(exp_val(s2))))
				return false;
		if(DFS(s2,s1) || (DFS(s1,s2,true) && !DFS(s1,s2,false)))
			return false;
		adj[encoding[s1]].insert(s2);
		return true;
	}
	bool add_eq(string s1, string s2)
	{
		cout<<"ORD_EQ "<<s1<<" "<<s2<<endl;
		if(exp_val(s1)!=s1 && exp_val(s2)!=s2)
			if(!(to_float(exp_val(s1))==to_float(exp_val(s2))))
				return false;
		if(DFS(s2,s1) || DFS(s1,s2))
			return false;
		adj_eq[encoding[s1]].insert(s2);
		adj_eq[encoding[s2]].insert(s1);
		return true;
	}
	bool DFS(string s1, string s2, bool unequal_path = false)
	{
		vector<bool> vis(encoding.size(), false);
		return DFSutil(encoding[s1], encoding[s2], vis, unequal_path);
	}
	bool DFSutil(int s1, int s2, vector<bool>& vis, bool unequal_path)
	{
		if(vis[s1])
			return false;
		vis[s1]=true;
		if(s1==s2)
			return unequal_path;
		for(set<string>::iterator i=adj[s1].begin();i!=adj[s1].end();i++)
			if(DFSutil(encoding[*i], s2, vis, true))
				return true;
		for(set<string>::iterator i=adj_eq[s1].begin();i!=adj_eq[s1].end();i++)
			if(DFSutil(encoding[*i], s2, vis, unequal_path))
				return true;
		return false;
	}
	string exp_val(string var)
	{
		if(real_values[var][0]>57)
			return var;
		return real_values[var];
	}
	string deprecated_print(map<string,string>& math_comp, map<string, string>& intgr_cmds) //NOTE: Not usable for Exponential Distribution programs
	{
		string res="Probability[";
		string comment="";
		map<string, string> var_map;
		for(map<string,int>::iterator i = encoding.begin();i!=encoding.end();i++)
		{
			int s1 = i->second;
			for(set<string>::iterator j=adj[s1].begin();j!=adj[s1].end();j++)
			{
				if(res[res.size()-1]!='[')
					res+=" \\[And] ";

				res += "("+createMap(exp_val(i->first), var_map)+"<"+createMap(exp_val(*j), var_map)+")";
				comment += "|"+exp_val(i->first)+"<"+exp_val(*j);
			}
			for(set<string>::iterator j=adj_eq[s1].begin();j!=adj_eq[s1].end();j++)
			{
				if(i->first<*j)
				{
					// if(res[res.size()-1]!='[')
					// res += " \\[And] ";
					// res += "("createMap(exp_val(i->first), var_map)+"=="+createMap(exp_val(*j), var_map)+")";
					return "";
				}
			}
		}
		string assgn = "/.{";
		if(res=="Probability[")
			res="1";
		else if(res!="0")
		{
			res+=", {";
			int varNum=0;
			for(map<string,string>::iterator i = real_values.begin();i!=real_values.end();i++)
			{
				if(exp_val(i->first)==i->first)
				{
					if(res[res.size()-1]!='{')
						res+=", ";
					res+=createMap(i->first, var_map)+" \\[Distributed] "+getAssignment(i->second, assgn, varNum);
				}
			}
			if(res[res.size()-1]=='{')
				res = "1";
			else
				res+="}]";
		}
		assgn+="}";
		if(assgn.size()==4)
			assgn="";
		if(math_comp.find(res)==math_comp.end())
		{
			string var = "assgn"+to_string(math_comp.size());
			intgr_cmds[var]=res+" (*"+comment+"*)";
			math_comp[res] = var;
		}
		string res1="";
		for(set<string>::iterator i = tdl_values.begin();i!=tdl_values.end();i++)
		{
			if(i!=tdl_values.begin())
				res1+="*";
			res1+=(*i);
		}
		if(res1=="")
			return "("+math_comp[res]+assgn+")";
		if(res=="1")
			return res1;
		return "("+math_comp[res]+assgn+")*("+res1+")";
	}
	string getAssignTotalOrder(vector<string> total_order, map<string,string>& math_comp, map<string,string>& intgr_cmds, string& upper, bool assign=true)
	{
		string cmd = "";
		if(total_order.size()==0)
		{
			cmd = "1";
			upper = "\\[Infinity]";
			if(math_comp.find(cmd)==math_comp.end())
			{
				string var = "assgn"+to_string(math_comp.size());
				intgr_cmds[var] = cmd;
				math_comp[cmd] = var;
			}
			return math_comp[cmd];
		}
		string last_var = total_order[total_order.size()-1];
		total_order.pop_back();
		string cmd1 = getAssignTotalOrder(total_order, math_comp, intgr_cmds, upper, false);
		total_order.push_back(last_var);
		if(exp_val(total_order[total_order.size()-1])==total_order[total_order.size()-1])
		{
			string tmp = real_values[total_order[total_order.size()-1]];
			string dist_type = tmp.substr(0,tmp.find('['));
			cout<<"DIST_TYPE: "<<dist_type<<endl;
			string arg1 = tmp.substr(tmp.find('[')+1, tmp.find(',')-tmp.find('[')-1);
			string arg2 = tmp.substr(tmp.find(',')+1, tmp.find(']')-tmp.find(',')-1);
			if(dist_type=="LaplaceDistribution")
				cmd = "Integrate[("+arg2+")/2*"+cmd1+"*Exp[-("+arg2+
					")*Abs[x - ("+arg1+")]], {x, x, "+upper+"}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && eps > 0]";
			else
				cmd = "Integrate[Piecewise[{{0, x<"+arg1+"},{("+arg2+")*"+cmd1+"*Exp[-("+arg2+
					")*Abs[x - ("+arg1+")]], True}}], {x, x, "+upper+"}, Assumptions -> Element[x, Reals] && Element[eps, Reals] && eps > 0]";
			if(math_comp.find(cmd)==math_comp.end())
			{
				string var = "assgnu"+to_string(math_comp.size());
				intgr_cmds[var]=cmd;
				intgr_cmds[var]+=" (*";
				for(int i=total_order.size()-1;i>=0;i--)
					intgr_cmds[var]+=total_order[i]+"="+real_values[total_order[i]]+":";
				intgr_cmds[var]+="*)";
				math_comp[cmd] = var;
			}
			string var = math_comp[cmd];
			if(assign)
			{
				string cmd2 = "Limit["+var+", {x -> -\\[Infinity]}, Assumptions -> Re[eps]>0]";
				if(math_comp.find(cmd2)==math_comp.end())
				{
					string var3 = "assgn"+to_string(math_comp.size());
					intgr_cmds[var3]=cmd2;
					intgr_cmds[var3]+=" (*";
					for(int i=total_order.size()-1;i>=0;i--)
						intgr_cmds[var3]+=total_order[i]+"="+real_values[total_order[i]]+":";
					intgr_cmds[var3]+="*)";
					math_comp[cmd2] = var3;
				}
				return math_comp[cmd2];
			}
			else
				return var;
		}
		else
		{
			string cmd2 = cmd1+"/.{x -> "+exp_val(total_order[total_order.size()-1])+"}";
			string var;
			upper = exp_val(total_order[total_order.size()-1]);
			if(cmd1[5]!='u')
				var = cmd1;
			else
			{
				if(math_comp.find(cmd2)==math_comp.end())
				{
					string var1 = "assgn"+to_string(math_comp.size());
					intgr_cmds[var1]=cmd2;
					math_comp[cmd2] = var1;
				}
				var = math_comp[cmd2];
			}
			return var;
		}
	}
	bool valid(vector<string> order)
	{
		string curr="";
		cout<<"\tTest";
		for(int i=order.size()-1;i>=0;i--)
			cout<<"|"<<order[i];
		cout<<endl;
		for(int i=order.size()-1;i>=0;i--)
		{
			if(exp_val(order[i])!=order[i])
			{
				if(curr!="")
				{
					if(to_int(curr)>to_int(exp_val(order[i])))
					{
						return false;
					}
				}
				curr=exp_val(order[i]);
			}
		}
		return true;
	}
	void connCompUtil(vector<set<string>>& adj_curr, map<string, int>& encoding_curr, vector<vector<set<string>>>& adj_all, vector<map<string, int>>& encoding_all, string curr, set<string>& done, vector<set<string>>& adj_und)
	{
		if(done.find(curr)!=done.end())
			return;
		done.insert(curr);
		encoding_all[encoding_all.size()-1][curr] = adj_all[adj_all.size()-1].size();
		adj_all[adj_all.size()-1].push_back(set<string>());
		int sz = adj_all[adj_all.size()-1].size();
		for(set<string>::iterator i=adj_curr[encoding_curr[curr]].begin();i!=adj_curr[encoding_curr[curr]].end();i++)
			adj_all[adj_all.size()-1][sz-1].insert(*i);
		for(set<string>::iterator i=adj_und[encoding_curr[curr]].begin();i!=adj_und[encoding_curr[curr]].end();i++)
			connCompUtil(adj_curr, encoding_curr, adj_all, encoding_all, *i, done, adj_und);
	}
	void connectedComponents(vector<set<string>>& adj_curr, map<string, int>& encoding_curr, vector<vector<set<string>>>& adj_all, vector<map<string, int>>& encoding_all)
	{
		set<string> done;
		vector<set<string>> adj_und(adj_curr);
		for(map<string,int>::iterator i = encoding_curr.begin();i!=encoding_curr.end();i++)
			for(set<string>::iterator j=adj_und[i->second].begin();j!=adj_und[i->second].end();j++)
				adj_und[encoding_curr[*j]].insert(i->first);
		for(map<string, int>::iterator i = encoding_curr.begin();i!=encoding_curr.end();i++)
			if(done.find(i->first)==done.end())
			{
				adj_all.push_back(vector<set<string>>());
				encoding_all.push_back(map<string, int>());
				connCompUtil(adj_curr, encoding_curr, adj_all, encoding_all, i->first, done, adj_und);
			}
	}
	string print(map<string,string>& math_comp, map<string,string>& intgr_cmds)
	{
		vector<vector<set<string>>> adj_all;
		vector<map<string, int>> encoding_all;
		cout<<"PartialOrder";
		for(map<string,int>::iterator i = encoding.begin();i!=encoding.end();i++)
		{
			int s1 = i->second;
			for(set<string>::iterator j=adj[s1].begin();j!=adj[s1].end();j++)
				cout<<"|"+exp_val(i->first)+"<"+exp_val(*j);
		}
		cout<<endl;
		connectedComponents(adj, encoding, adj_all, encoding_all);
		string res="";
		for(int q=0;q<adj_all.size();q++)
		{
			vector<set<string>> adj_curr = adj_all[q];
			map<string, int> encoding_curr = encoding_all[q];
			vector<vector<string>> total_orders;
			RevTopSorts(adj_curr, encoding_curr, total_orders);
			cout<<"SubsetPartialOrder";
			for(map<string,int>::iterator i = encoding_curr.begin();i!=encoding_curr.end();i++)
			{
				int s1 = i->second;
				for(set<string>::iterator j=adj_curr[s1].begin();j!=adj_curr[s1].end();j++)
					cout<<"|"+exp_val(i->first)+"<"+exp_val(*j);
			}
			cout<<endl;
			string res2 = "";
			if(encoding_curr.size()==0)
				res2="1";
			for(int i=0;i<total_orders.size();i++)
			{
				if(valid(total_orders[i]))
				{
					cout<<"TotalOrder";
					for(int j=total_orders[i].size()-1;j>=0;j--)
						cout<<"|"<<total_orders[i][j];
					cout<<endl;
					if(res2.size()!=0)
						res2+="+";
					string tmp_upper;
					res2+=getAssignTotalOrder(total_orders[i], math_comp, intgr_cmds, tmp_upper);
				}
			}
			if(res.size()>0)
				res+="*";
			res+="("+res2+")";
		}
		if(res=="")
			res="0";
		string res1="";
		for(set<string>::iterator i = tdl_values.begin();i!=tdl_values.end();i++)
		{
			if(i!=tdl_values.begin())
				res1+="*";
			res1+=(*i);
		}
		if(res1=="")
			return "("+res+")";
		if(res=="1")
			return res1;
		return "("+res+")*("+res1+")";
	}
};
list<string> tokenize(string& pgm)
{
	list<string> res;
	int pos=0;
	int depth=0;
	// Assuming that all the operators are separated by whitespace characters. i.e. "4*a" is written as "4 * a"
	while(pos<pgm.size())
	{
		if(pgm[pos]=='#')
		{
			while(pgm[++pos]!='#')
				continue;
			pos++;
		}
		while(pos<pgm.size() && (pgm[pos]==' ' || pgm[pos]=='\t'))
			pos++;
		int newPos = pgm.size();
		if(pgm.find(';', pos)<pgm.size())
			newPos = min(newPos, (int)pgm.find(';', pos));
		if(pgm.find(' ', pos)<pgm.size())
			newPos = min(newPos, (int)pgm.find(' ', pos));
		if(pgm.find('\t', pos)<pgm.size())
			newPos = min(newPos, (int)pgm.find('\t', pos));
		if(pgm[pos]=='\"')
			newPos = (int)pgm.find('\"', ++pos);
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
string convertToMathScript(string s, map<string,Exp*>& vars)
{
	int pos = 0;
	string res = "";
	while(pos<s.size())
	{
		int newPos = s.size();
		if(s.find(' ', pos)<s.size())
			newPos = min(newPos, (int)s.find(' ', pos));
		string var = s.substr(pos, newPos-pos);
		if(vars.find(var)!=vars.end())
			res+=to_string(static_cast<IntExp*>(vars[var])->eval);
		else
			res+=var;
		pos=newPos+1;
	}
	return res;
}
string getType(map<string,Exp*>& vars, string var)
{
	return vars[var]->type;
}
string TDLprob(string mean, int var, int left, int right, int x)
{
	if(x==left || x==right)
	{
		return "Exp["+mean+"*"+to_string(1-abs(x-var))+"]/(Exp["+mean+"]+1)";
		// return "TDL2("+mean+","+to_string(abs(x-var))+")";
		// return "TDL2("+mean+","+to_string(x)+","+to_string(var)+")";
	}
	else
	{
		return "Exp["+mean+"*"+to_string(-abs(x-var))+"]*(Exp["+mean+"]-1)/(Exp["+mean+"]+1)";
		// return "TDL1("+mean+","+to_string(abs(x-var))+")";
		// return "TDL1("+mean+","+to_string(x)+","+to_string(var)+")";
	}
	return "1";
}
int compute(int val1, string op, int val2)
{
	if(op=="+" || op=="||")
		return val1+val2;
	if(op=="*" || op=="&&")
		return val1*val2;
	if(op=="-")
		return val1-val2;
	if(op=="==")
		return val1==val2;
	if(op=="/")
		return val1/val2;
	if(op=="%")
		return val1%val2;
	if(op=="<")
		return val1<val2;
	if(op=="<=")
		return val1<=val2;
	if(op==">")
		return val1>val2;
	if(op==">=")
		return val1>=val2;
	cerr<<"ERROR: Unrecognised operator "<<op<<endl;	
	return 0;
}
bool assignment(map<string,Exp*>& vars, list<string> next, RealOrderAndTDLap& order)
{
	// Assuming that next[1] is always '=' and next[0] is always the target variable, i.e. the command is always of the form <var_name> = (Expression);
	if(next.size()==3) // The case of direct assignments, ***Syntax: <var_name> = const; or <var_name> = <var_name>;
	{
		cout<<"DIRECT_ASSGN"<<endl;
		string target = next.front();
		next.pop_front();
		next.pop_front();
		string type = getType(vars, target); // Assuming that the RHS is also the same type
		if(next.front()[0]>57 && next.front()!="true" && next.front()!="false") // Not part of a number, mostly a character, meaning it is the second type of direct assignment.
		{
			if(type=="bool")
				vars[target] = new BoolExp(static_cast<BoolExp*>(vars[next.front()]));
			if(type=="int")
				vars[target] = new IntExp(static_cast<IntExp*>(vars[next.front()]));
			if(type=="real" && getType(vars, next.front())=="real")
				vars[target] = new RealExp(static_cast<RealExp*>(vars[next.front()]));
			if(type=="real" && getType(vars, next.front())=="int")
			{
				vars[target] = new RealExp((float)(static_cast<IntExp*>(vars[next.front()])->eval));
				cout<<(float)(static_cast<IntExp*>(vars[next.front()])->eval)<<endl;
				order.assign(target,to_string(static_cast<IntExp*>(vars[next.front()])->eval));
			}
		}
		else
		{
			cout<<type<<" "<<target<<" "<<next.front()<<endl;
			if(type=="bool")
				vars[target] = new BoolExp(next.front()=="true");
			else
			{
	    		char tmp[next.front().size()+1];  
	    		strcpy(tmp, next.front().c_str());
				if(type=="int")
					vars[target] = new IntExp(atoi(tmp));
				if(type=="real")
				{
					vars[target] = new RealExp(atof(tmp)); // We don't need to do this, since all real variable operations only depend on the ordering
					order.assign(target,next.front());
				}
			}
		}
		cout<<"DIRECT_ASSGN_DONE"<<endl;
	}
	else // The case of operation assignments or Laplacian assignments, ***Syntax: <var_name> = <var_name> <op> <var_name>; or <real_var> = Lap "<lin in eps>" <int_var>;
	{
		string target = next.front();
		next.pop_front();
		next.pop_front();
		if(next.front()=="Lap")
		{
			cout<<"LAP_ASSGN"<<endl;
			next.pop_front();
			string mean = convertToMathScript(next.front(), vars);
			next.pop_front();
			order.assign(target, "LaplaceDistribution["+to_string(static_cast<IntExp*>(vars[next.front()])->eval)+","+mean+"]");
		}
		else if(next.front()=="Exp")
		{
			cout<<"EXP_ASSGN"<<endl;
			next.pop_front();
			string mean = convertToMathScript(next.front(), vars);
			next.pop_front();
			order.assign(target, "ExponentialDistribution["+to_string(static_cast<IntExp*>(vars[next.front()])->eval)+","+mean+"]");
		}
		else
		{
			if(getType(vars, target)=="int") // Arithmetic operations: +, -, *, /, %
			{
				cout<<"INT_OP_ASSGN"<<endl;
				string var1 = next.front();
				next.pop_front();
				string op = next.front();
				next.pop_front();
				string var2 = next.front();
				vars[target] = new IntExp(compute(static_cast<IntExp*>(vars[var1])->eval, op,
																			static_cast<IntExp*>(vars[var2])->eval));
			}
			else // Boolean operations
			{
				cout<<"BOOL_OP_ASSGN"<<endl;
				if(next.size()==2) // Case of negation
				{
					next.pop_front();
					string var = next.front();
					vars[target]=new BoolExp(1-static_cast<BoolExp*>(vars[var])->eval);
					return true;
				}
				string var1 = next.front();
				next.pop_front();
				string op = next.front();
				next.pop_front();
				string var2 = next.front();
				string type = getType(vars, var1);
				if(type=="bool")
					vars[target] = new BoolExp(compute(static_cast<BoolExp*>(vars[var1])->eval, op,
																			static_cast<BoolExp*>(vars[var2])->eval));
				else if(type=="int")
					vars[target] = new BoolExp(compute(static_cast<IntExp*>(vars[var1])->eval, op,
																			static_cast<IntExp*>(vars[var2])->eval));
				else if(type=="real")
					return false;
			}
		}
	}
	return true;
}
string evaluate(map<string,Exp*> vars, list<string> pgm, RealOrderAndTDLap order, map<string, string>& result, map<string,string>& math_comp, map<string, string>& intgr_cmds)
{
	if(pgm.size()==0)
	{
		cout<<"UNEXP_END"<<endl;
		cerr<<"ERROR: Missing Return Statement"<<endl;
		return "int";
	}
	// for(list<string>::iterator i=pgm.begin();i!=pgm.end();i++)
	// 	cout<<*i<<" ";
	// cout<<endl;
	list<string> next = nextCommand(pgm);
	for(list<string>::iterator i=next.begin();i!=next.end();i++)
		cout<<*i<<" ";
	cout<<endl;
	if(next.size()==0)
	{
		cout<<"EMPTY_LINE"<<endl;
		return evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
	}
	else if(next.front()=="int") // Int variable is being declared. Assuming declaration without initialisation. ***Syntax: int <var_name>;
	{
		cout<<"INT_DECL"<<endl;
		next.pop_front();
		if(vars.find(next.front())!=vars.end())
		{
			cerr<<"ERROR: Variable "+next.front()+" being redeclared"<<endl;
			return "int";
		}
		vars.insert(pair<string,Exp*>(next.front(), new IntExp()));
		cout<<"INT_DECL_DONE"<<endl;
	}
	else if(next.front()=="bool") // Bool variable is being declared. Assuming declaration without initialisation. ***Syntax: bool <var_name>;
	{
		cout<<"BOOL_DECL"<<endl;
		next.pop_front();
		if(vars.find(next.front())!=vars.end())
		{
			cerr<<"ERROR: Variable "+next.front()+" being redeclared"<<endl;
			return "int";
		}
		vars.insert(pair<string,Exp*>(next.front(), new BoolExp()));
		cout<<"BOOL_DECL_DONE"<<endl;
	}
	else if(next.front()=="real") // Real variable is being declared. Assuming declaration without initialisation. ***Syntax: real <var_name>;
	{
		cout<<"REAL_DECL"<<endl;
		next.pop_front();
		if(vars.find(next.front())!=vars.end())
		{
			cerr<<"ERROR: Variable "+next.front()+" being redeclared"<<endl;
			return "int";
		}
		vars.insert(pair<string,Exp*>(next.front(), new RealExp()));
		order.variable(next.front());
		cout<<"REAL_DECL_DONE"<<endl;
	}
	else if(next.front()=="return") // Return statement. ***Syntax: return <var_list>;
	{
		next.pop_front();
		if(vars[next.front()]->type=="int")
		{
			cout<<"INT_RETN"<<endl;
			// cout<<endl<<"["<<static_cast<IntExp*>(vars[next.front()])->eval<<"]"<<"*{"<<order.print(math_comp, intgr_cmds)<<"}+";
			string ret_val="";
			while(!next.empty())
			{
				if(static_cast<IntExp*>(vars[next.front()])->eval<IntExp::rangeLeft)
				{
					cerr<<"ERROR: Return value underflow at "<<static_cast<IntExp*>(vars[next.front()])->eval<<endl;
					return "int";
				}
				if(static_cast<IntExp*>(vars[next.front()])->eval>IntExp::rangeRight)
				{
					cerr<<"ERROR: Return value overflow at "<<static_cast<IntExp*>(vars[next.front()])->eval<<endl;
					return "int";
				}
				if(ret_val.size()>0)
					ret_val+=";";
				ret_val += to_string(static_cast<IntExp*>(vars[next.front()])->eval);
				next.pop_front();
			}
			if(result.find(ret_val)==result.end())
				result[ret_val]="";
			string tmp3 = order.print(math_comp, intgr_cmds);
			if(tmp3.size()*result[ret_val].size()>0)
				result[ret_val]+=" + ";
			result[ret_val]+=tmp3;
			return "int";
			cout<<"INT_RETN_DONE"<<endl;
		}
		else
		{
			cout<<"BOOL_RETN"<<endl;
			string ret_val="";
			while(!next.empty())
			{
				if(ret_val.size()>0)
					ret_val+=";";
				ret_val += to_string(static_cast<BoolExp*>(vars[next.front()])->eval);
				next.pop_front();
			}
			if(result.find(ret_val)==result.end())
				result[ret_val]="";
			string tmp3 = order.print(math_comp, intgr_cmds);
			if(tmp3.size()*result[ret_val].size()>0)
				result[ret_val]+=" + ";
			result[ret_val]+=tmp3;
			return "bool";
			cout<<"BOOL_RETN_DONE"<<endl;
		}
		// cerr<<"DONE"<<endl;
	}
	else if(next.front()=="if") // If-Else clause. ***Syntax: if <bool_var> then <pgm> else <pgm> fi;
	{
		next.pop_front();
		string var = next.front();
		next.pop_front();
		next.pop_front();
		int depth=0;
		list<string> newpgm;
		while(depth!=0 || (next.front()!="else" && next.front()!="fi"))
		{
			if(next.front()==";" && depth==0)
				newpgm.push_back("$");
			else
				newpgm.push_back(next.front());
			if(next.front()=="if")
				depth++;
			if(next.front()=="fi")
				depth--;
			next.pop_front();
		}
		if(static_cast<BoolExp*>(vars[var])->eval)
		{
			cout<<"IF_CASE1"<<endl;
			newpgm.pop_back();
			newpgm.push_back("$");
			newpgm.splice(newpgm.end(), pgm);
			return evaluate(vars, newpgm, order, result, math_comp, intgr_cmds);
		}
		newpgm.clear();
		if(next.front()=="fi")
			return evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
		next.pop_front();
		depth=0;
		while(depth!=0 || (next.front()!="fi"))
		{
			if(next.front()==";" && depth==0)
				newpgm.push_back("$");
			else
				newpgm.push_back(next.front());
			if(next.front()=="if")
				depth++;
			if(next.front()=="fi")
				depth--;
			next.pop_front();
		}
		cout<<"IF_CASE2"<<endl;
		newpgm.pop_back();
		newpgm.push_back("$");
		newpgm.splice(newpgm.end(), pgm);
		return evaluate(vars, newpgm, order, result, math_comp, intgr_cmds);
	}
	else // Assignment statements. Check assignment function for syntax.
	{
		if(next.size()>5) // TDLap assignment. ***Syntax: <var_name> = TDLap "<lin in eps>" <var2> <var3> <var4>;
		{
			cout<<"TDLAP_ASSGN"<<endl;
			string target = next.front();
			next.pop_front();
			next.pop_front();
			next.pop_front();
			string mean = convertToMathScript(next.front(), vars);
			next.pop_front();
			string variance = next.front();
			next.pop_front();
			string left = next.front();
			next.pop_front();
			string right = next.front();
			string ret_type = "";
			for(int i = static_cast<IntExp*>(vars[left])->eval;i<=static_cast<IntExp*>(vars[right])->eval;i++)
			{
				vars[target] = new IntExp(i);
				order.assign(TDLprob(mean, static_cast<IntExp*>(vars[variance])->eval,
											 static_cast<IntExp*>(vars[left])->eval,
											 static_cast<IntExp*>(vars[right])->eval, i));
				ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				order.remove(TDLprob(mean, static_cast<IntExp*>(vars[variance])->eval,
											 static_cast<IntExp*>(vars[left])->eval,
											 static_cast<IntExp*>(vars[right])->eval, i));
			}
			cout<<"TDLAP_ASSGN_DONE"<<endl;
			return ret_type;
		}
		bool b = assignment(vars, next, order);
		if(!b)
		{
			cout<<"REAL_ORDER"<<endl;
			string target = next.front();
			next.pop_front();
			next.pop_front();
			string var1 = next.front();
			next.pop_front();
			string op = next.front();
			next.pop_front();
			string var2 = next.front();
			string type = getType(vars, var1);
			string ret_type = "";
			if(op=="<")
			{
				if(order.add(var1,var2))
				{
					vars[target] = new BoolExp(1);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var1, var2);
				if(order.add(var2,var1))
				{
					vars[target] = new BoolExp(0);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var2, var1);
				// if(order.add_eq(var1,var2))
				// {
				// 	vars[target] = new BoolExp(0);
				// 	ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				// }
				// order.remove(var1, var2);
			}
			if(op=="<=")
			{
				if(order.add(var1,var2))
				{
					vars[target] = new BoolExp(1);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var1, var2);
				if(order.add(var2,var1))
				{
					vars[target] = new BoolExp(0);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var2, var1);
				// if(order.add_eq(var1,var2))
				// {
				// 	vars[target] = new BoolExp(1);
				// 	ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				// }
				// order.remove(var2, var1);
			}
			if(op==">")
			{
				if(order.add(var2,var1))
				{
					vars[target] = new BoolExp(1);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var2, var1);
				if(order.add(var1,var2))
				{
					vars[target] = new BoolExp(0);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var1, var2);
				// if(order.add_eq(var2,var1))
				// {
				// 	vars[target] = new BoolExp(0);
				// 	ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				// }
				// order.remove(var2, var1);
			}
			if(op==">=")
			{
				if(order.add(var2,var1))
				{
					vars[target] = new BoolExp(1);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var2, var1);
				if(order.add(var1,var2))
				{
					vars[target] = new BoolExp(0);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var1, var2);
				// if(order.add_eq(var2,var1))
				// {
				// 	vars[target] = new BoolExp(1);
				// 	ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				// }
				// order.remove(var2, var1);
			}
			if(op=="==")
			{
				if(order.add(var2,var1))
				{
					vars[target] = new BoolExp(0);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var2, var1);
				if(order.add(var1,var2))
				{
					vars[target] = new BoolExp(0);
					ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				}
				order.remove(var1, var2);
				// if(order.add_eq(var2,var1))
				// {
				// 	vars[target] = new BoolExp(1);
				// 	ret_type = evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
				// }
				// order.remove(var2, var1);
			}
			cout<<"REAL_ORDER_DONE"<<endl;
			return ret_type;
		}
	}
	return evaluate(vars, pgm, order, result, math_comp, intgr_cmds);
}
string evaluateWithInputs(set<string>& inputs, list<string>& pgm, RealOrderAndTDLap& order, map<string,string>& prob_map, set<string>& results, map<string, string>& intgr_cmds)
{
	map<string, string> math_comp;
	string ret_type = "";
	ofstream out;
	out.open("output.txt", ios::app);
	for(set<string>::iterator i = inputs.begin();i!=inputs.end();i++)
	{
		map<string,Exp*> vars;
		cout<<vars.size()<<endl;
		list<string> pgm1(pgm);
		string s = *i;
		while(s.size()>0)
		{
			list<string> next = nextCommand(pgm1);
			string input = s.substr(0,s.find(' '));
			if(input.size()==s.size())
				s="";
			else
				s = s.substr(input.size()+1);
			char tmp[input.size()+1];  
			strcpy(tmp, input.c_str());
			int val = atoi(tmp);
			if(next.front()!="input")
			{
				cerr<<"ERROR: adjacency and input program don't have same number of inputs"<<endl;
				return "int";
			}
			map<string, pair<int,int> > ranges;
			ranges["int"] = pair<int,int>(IntExp::rangeLeft, IntExp::rangeRight);
			ranges["bool"] = pair<int,int>(0,1);
			next.pop_front();
			string type = next.front();
			int left = ranges[type].first;
			int right = ranges[type].second;
			next.pop_front();
			string name = next.front();
			next.pop_front();
			if(!next.empty())
			{
				char tmp1[next.front().size()+1];  
				strcpy(tmp1, next.front().c_str());
				left = atoi(tmp1);
				next.pop_front();
				char tmp2[next.front().size()+1];  
				strcpy(tmp2, next.front().c_str());
				right = atoi(tmp2);
				if(val<left || val>right)
				{
					cerr<<"ERROR: Input value out of bounds"<<endl;
					return "int";
				}
			}
			if(type=="int")
				vars.insert(pair<string,Exp*>(name, new IntExp(val)));
			else
				vars.insert(pair<string,Exp*>(name, new BoolExp(val)));
		}
		map<string, string> result;
		ret_type = evaluate(vars, pgm1, order, result, math_comp, intgr_cmds);
		s = *i;
		for(map<string,string>::iterator j = result.begin();j!=result.end();j++)
		{
			string t = s+" "+j->first;
			out<<t<<"|\n"<<j->second<<endl;
			prob_map[t] = j->second;
			results.insert(j->first);
		}
	}
	out.close();
	return ret_type;
}
void generateInputList(set<string>& inputs, string file)
{
	ifstream in;
	in.open(file, ios::in);
	string s;
	while(getline(in,s))
	{
		string s1 = s.substr(0,s.find('~')-1);
		string s2 = s.substr(s.find('~')+2);
		inputs.insert(s1);
		inputs.insert(s2);
	}
	in.close();
}
void addIntgrCmds(string s, map<string, string>& intgr_cmds, set<string>& written_vars)
{
	while(s.size()>0)
	{
		int i = s.find("assgn");
		if(i<0 || i>=s.size())
			break;
		string var = "assgn";
		i+=5;
		while(i<s.size() && (s[i]=='u' || (48<=s[i] && s[i]<=57)))
		{
			var=var+s[i];
			cout<<"Variable: "<<var<<"|"<<s<<endl;
			i++;
		}
		if(written_vars.find(var)==written_vars.end())
		{
			ofstream out;
			addIntgrCmds(intgr_cmds[var], intgr_cmds, written_vars);
			out.open("math_script.wl", ios::app);
			out<<var<<" = "<<intgr_cmds[var]<<endl;
			out.close();
			written_vars.insert(var);
		}
		if(i==s.size())
			break;
		s = s.substr(i);
	}
}
void generateInequalities(string s, map<string,string>& prob_map, set<string>& seen, set<string>& results, map<string, string>& intgr_cmds, set<string>& written_vars, char* frac, bool eps_var)
{
	ofstream out;
	string fraction(frac);
	out.open("math_script.wl", ios::app);
	string s1 = s.substr(0,s.find('~')-1);
	string s2 = s.substr(s.find('~')+2);
	for(set<string>::iterator j = results.begin();j!=results.end(); j++)
	{
		if(prob_map.find(s1+" "+*j)==prob_map.end() && prob_map.find(s2+" "+*j)==prob_map.end())
			continue;
		if(prob_map.find(s1+" "+*j)==prob_map.end() || prob_map.find(s2+" "+*j)==prob_map.end())
		{
			cout<<"OOPSY "<<s1<<": "<<s2<<": "<<*j<<endl;
			out.close();
			out.open("math_script.wl", ios::out);
			out<<"Print[False]"<<endl;
			out.close();
			exit(0);
		}
		cout<<s<<endl;
		if(seen.find(prob_map[s1+" "+*j]+":"+prob_map[s2+" "+*j])==seen.end())
		{
			cout<<"COMPARE "<<s<<": "<<*j<<endl;
			addIntgrCmds(prob_map[s2+" "+*j], intgr_cmds, written_vars);
			addIntgrCmds(prob_map[s1+" "+*j], intgr_cmds, written_vars);
			out<<"If[Resolve[ForAll[eps, eps > 0, (";
			out<<"("+prob_map[s1+" "+*j]<<") \\[LessEqual] Exp["+fraction+" * eps] * ("<<prob_map[s2+" "+*j]<<"))], Reals]";
			out<<",Null,(Print[\"P("<<*j<<"|"<<s1<<")>Exp[eps]*P("<<*j<<"|"<<s2<<")\"];";
			if(eps_var)
				out<<" Print[FindInstance[(eps > 0 && ("+prob_map[s1+" "+*j]<<") > Exp["+fraction+" * eps] * ("<<prob_map[s2+" "+*j]<<")), eps, Reals]];";
			out<<" Exit[1])]"<<endl;
			seen.insert(prob_map[s1+" "+*j]+":"+prob_map[s2+" "+*j]);
		}
		if(seen.find(prob_map[s2+" "+*j]+":"+prob_map[s1+" "+*j])==seen.end())
		{
			cout<<"COMPARE "<<s<<": "<<*j<<endl;
			addIntgrCmds(prob_map[s2+" "+*j], intgr_cmds, written_vars);
			addIntgrCmds(prob_map[s1+" "+*j], intgr_cmds, written_vars);
			out<<"If[Resolve[ForAll[eps, eps > 0, (";
			out<<"("+prob_map[s2+" "+*j]<<") \\[LessEqual] Exp[eps] * ("<<prob_map[s1+" "+*j]<<"))], Reals]";
			out<<",Null,(Print[\"P("<<*j<<"|"<<s2<<")>Exp[eps]*P("<<*j<<"|"<<s1<<")\"];";
			if(eps_var)
				out<<" Print[FindInstance[(eps > 0 && ("+prob_map[s2+" "+*j]<<") > Exp[eps] * ("<<prob_map[s1+" "+*j]<<")), eps, Reals]];";
			out<<" Exit[1])]"<<endl;
			seen.insert(prob_map[s2+" "+*j]+":"+prob_map[s1+" "+*j]);
		}
	}
	out.close();
}
int main(int argc, char** argv)
{
	string s;
	string eps(argv[2]);
	string pgm;
	int t;
	cin>>t;
	IntExp::rangeLeft = t;
	cin>>t;
	IntExp::rangeRight = t;
	while(getline(cin,s))
		pgm+=" "+s;
	list<string> pgmTokens = tokenize(pgm);
	ofstream out;
	out.open("output.txt", ios::out);
	out.close();
	out.open("math_script.wl", ios::out);
	if(eps!="0")
		out<<"eps = "<<argv[2]<<endl;
	out.close();
	out.open("master.err", ios::out);
	out.close();
	out.open("master.log", ios::out);
	out.close();
	set<string> inputs;
	generateInputList(inputs, "adjacency");
	RealOrderAndTDLap order;
	map<string, string> prob_map;
	map<string, string> intgr_cmds;
	set<string> results;
	string ret_type = evaluateWithInputs(inputs, pgmTokens, order, prob_map, results, intgr_cmds);
	out.open("math_script.wl", ios::app);
	out<<"val = True"<<endl;
	if((++lineCount)%10==0)
		out<<"Print["<<lineCount<<"]"<<endl;
	out.close();
	set<string> seen;
	set<string> written_vars;
	ifstream in;
	in.open("adjacency", ios::in);
	while(getline(in,s))
		generateInequalities(s, prob_map, seen, results, intgr_cmds, written_vars, argv[1], eps=="0");
	in.close();
	out.open("math_script.wl", ios::app);
	out<<"Print[val]"<<endl;
	out<<"Exit[0]"<<endl;
	out.close();
}