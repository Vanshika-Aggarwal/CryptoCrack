#include<iostream>
#include<fstream>
#include<string>
using namespace std;

    int invrfp[8][8]= {
 57,49,41,33,25,17,9,1,
 59,51,43,35,27,19,11,3,
 61,53,45,37,29,21,13,5,
 63,55,47,39,31,23,15,7,
 58,50,42,34,26,18,10,2,
 60,52,44,36,28,20,12,4,
 62,54,46,38,30,22,14,6,
 64,56,48,40,32,24,16,8
};

int ex[8][6] = {
  32, 1, 2, 3, 4, 5,
  4, 5,6, 7, 8, 9,
  8, 9, 10, 11, 12, 13,
  12, 13, 14, 15, 16, 17,
  16, 17, 18, 19, 20, 21,
  20, 21, 22, 23, 24, 25,
  24, 25, 26, 27, 28, 29,
  28, 29, 30, 31, 32, 1
};

int invp[8][4] = {
    9, 17, 23, 31,
	13, 28, 2, 18,
	24, 16, 30, 6,
	26, 20, 10, 1,
	8, 14, 25, 3,
	4, 29, 11, 19,
	32, 12, 22, 7,
	5, 27, 15, 21,};

int main(){
    ifstream fi1;
    ofstream fo1,fo2,fo3;
    int k,i,j,l;
    int a[8][8],b[8][8],c[8][8],d[8][8],e[8][8],f[8][6],g[8][4],h,m,n,o;

    fi1.open("output.txt");
    fo1.open("bxor.txt");
    fo2.open("yxor.txt");
    fo3.open("finrevperm.txt");
    string line1,line2;
    while ( getline (fi1,line1) ){
        getline (fi1,line2);

        // get first line and fit in matrix
        for(int i=0,k=0;i<8;i++){
            for(j=0;j<8;j++){
                a[i][j]=line1[k]-48;
                k++;
            }
        }

        // get second line and fit in matrix
        for(i=0;i<8;i++){
            for(j=0;j<8;j++){
                b[i][j]=line2[k]-48;
                k++;
            }
        }

        //multiply with reverse permutation matrix to get
        // output of last round sboxes 
        for(i=0;i<8;i++){
            for(j=0;j<8;j++){
                l=(invrfp[i][j]-1)%8; k=(invrfp[i][j]-1)/8;
                c[i][j]=a[k][l];
                fo3<<c[i][j];
            }
        }

        fo3<<'\n';
        for(i=0;i<8;i++){
            for(j=0;j<8;j++){
                l=(invrfp[i][j]-1)%8; k=(invrfp[i][j]-1)/8;
                d[i][j]=b[k][l];
                fo3<<d[i][j];
            }
        }
        fo3<<'\n';
        for(i=0;i<8;i++){
            for(j=0;j<8;j++) e[i][j]=c[i][j]^d[i][j];
        }

        // beta xor = alpha xor = xor of left half of next round
        for(i=0;i<8;i++){
            for(j=0;j<6;j++){
                l=(ex[i][j]-1)%8; k=(ex[i][j]-1)/8;
                h=e[k][l];
                fo1<<h;
            }
        }

        // bit reversal
        e[4][5]=e[4][5]^1;
        fo1<<'\n';

        // with a probability
        for(i=0;i<8;i++)
            for(j=0;j<4;j++){
                l=(invp[i][j]-1)%8; k=(invp[i][j]-1)/8;
                g[i][j]=e[4+k][l];
                fo2<<g[i][j];
            }
        fo2<<'\n';
    }
    fi1.close(); fo1.close(); fo2.close(); fo3.close();
    return 0;
}
