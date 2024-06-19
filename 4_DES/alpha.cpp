#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int E[] = {
  32, 1, 2, 3, 4, 5,
  4, 5,6, 7, 8, 9,
  8, 9, 10, 11, 12, 13,
  12, 13, 14, 15, 16, 17, 
  16, 17, 18, 19, 20, 21, 
  20, 21, 22, 23, 24, 25, 
  24, 25, 26, 27, 28, 29,
  28, 29, 30, 31, 32, 1
};

// Performing expansion of the final reverse permutation of the
// last round to produce alpha
int main(){
    FILE*fi,*fw;
    fi = fopen("finrevperm.txt","r");
    fw = fopen("alphafirst.txt","w");

    string str1,str2;
    for(int i=0;i<=99999;i++){
        fscanf(fi,"%s",str1);
        fscanf(fi,"%s",str2);
        for (int i=0;i<=47;i++)
            fprintf(fw,"%c",str1[E[i]-1]);
        fprintf(fw,"\n");}
    return 0;
}
