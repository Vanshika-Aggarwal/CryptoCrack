#include <bits/stdc++.h>
using namespace std;

vector <int> strtolist(string str){

    vector<int> numbers;
    int y;
    string word = "";
    for (auto x : str) 
    {
        if (x == ' '){
            // cout<<word<<endl;
            stringstream num(word);
            num >> y;
            // cout<<y<<endl;
            numbers.push_back(y);
            word = "";
        }
        else {
            word = word + x;
        }
    }
    stringstream num(word);
    num >> y;
    numbers.push_back(y);

    return numbers;
}

vector<int> get_encoding(vector<int> p){
    vector<int> curr;
    for(int t=1;t<=32;t++){
        int val = 0;
        for(int i=0;i<p.size();i++){
            val = (val + (int)pow(p[i],t)) % 128;
        }
        curr.push_back(val);
    }
    return curr;
}

int main(){
    string hash = "24 60 29 21 47 109 18 105 66 27 52 97 52 12 8 73 43 126 90 24 117 86 116 76 59 44 48 43 55 30 96 34";
    vector <int> list = strtolist(hash);

    vector<int> pass(list[0],1);
    // for( auto i:pass) cout<<i<<" ";

    int stat = 23;
    while(pass[0]!=16){
        if(pass[stat]!=16){
            pass[stat]++;
            for(int i=stat+1;i<24;i++){
                pass[i] = pass[stat];
            }
            stat = 23;
            // if(get_encoding(pass) == list){
            //     cout<<"Password Found! : ";
            //     for( auto i:pass) cout<<i<<" ";
            // }
            for( auto i:pass) cout<<i<<" ";
            cout<<"\n";
        }
        else{
            stat--;
        }
    }

}