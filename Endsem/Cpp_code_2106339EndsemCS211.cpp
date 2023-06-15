#include<bits/stdc++.h>
using namespace std;

#define int long long 
# define endl "\n"
// Function to check for branch always taken
void branch_always_taken(string s)
{
  double cnt=0,op=0; //op to store total  no of branch outcomes
  // count no of taken branches cnt
 for(int i=0;i<s.size();i++)
 {
    op++;
    if(s[i]=='1')cnt++;
 }
 double ans;
 ans=(cnt*100)/op; // divide total branch taken by no of operations and mutiply by 100 to convert in percentage
 cout<<"The accuracy of branch always taken predictor is "<<ans<<"%"<<endl;
}

void branch_always_not_taken(string s)
{
  double cnt=0,op=0; // count no of not taken branches cnt
for(int i=0;i<s.size();i++)
 {
    op++;
    if(s[i]=='0')cnt++; //if s[i] is 0 then branch not taken 
 }
 double ans;
 ans=(cnt*100)/op;  // divide total branch not taken by no of operations and mutiply by 100 to convert in percentage
 cout<<"The accuracy of branch always not taken predictor is "<<ans<<"%"<<endl;
}

void two_bit_predictor(string s,int z)
{
double cnt=0,op=0;
for(int i=0;i<s.size();i++)
 {
    op++;
    int t=s[i]-'0';
    if(t==0)
    {
        if(z==0){cnt++;}  // if NT  z==00 cnt++
        else if(z==1){cnt++;z=0;} // if NT  z==01 cnt++
        else if(z==2)z=1; // if NT and z==10 cnt++
        else if(z==3)z=2; // if NT and z==11 cnt++
        
    }
    else{
 
        if(z==0)z=1; // if T  z==00 
        else if(z==1)z=2;  // if T  z==01 
        else if(z==2){cnt++;z=3;}  // if T  z==10 
        else if(z==3)cnt++;  // if T  z==11
    }

 }
  double ans;
  ans=(cnt*100)/op;
 cout<<"The accuracy of  2 bit adder predictor is "<<ans<<"%"<<endl;
}

int32_t main(){ 
cout<<"Enter a string of outcomes  [1==Taken] [0==Not taken] :";
string s;
cin>>s;
int z;
branch_always_taken(s);
branch_always_not_taken(s);
cout<<"0==Definite predict not taken"<<endl;
cout<<"1==Probable predict not taken"<<endl;
cout<<"2==Probale predict taken"<<endl;
cout<<"3==Definite predict taken"<<endl;
cout<<"Enter a number (0,1,2,3) :";
cin>>z;
two_bit_predictor(s, z);

 
}
// Repeatition for sufficiently large times
/* int32_t main(){
string s; 
cout<<"Enter a string of outcomes  [1==Taken] [0==Not taken] :";
cin>>s;

string s1="";
cout<<"Enter number of times you want to repeat the string :";
int n;
cin>>n;

for(int i=0;i<n;i++)
{
    s1+=s;
}
int z;
cout<<"0==Definite predict not taken"<<endl;
cout<<"1==Probable predict not taken"<<endl;
cout<<"2==Probale predict taken"<<endl;
cout<<"3==Definite predict taken"<<endl;
cout<<"Enter a number (0,1,2,3) :";
cin>>z;
two_bit_predictor(s1, z);

 
}  */


        

        
 