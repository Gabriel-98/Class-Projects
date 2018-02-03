#include<bits/stdc++.h>
using namespace std;

typedef vector<int> BigInt;

BigInt Integer(string num){
	if(num!=""){
		int i;
		BigInt n;
		i=0;
		n.push_back(1);
		if(num[0]=='-'){
			n[0]=-1;
			i++;
		}
		for(i; i<num.size(); i++){
			n.push_back(num[i]-'0');
		}
		return(n);
	}
	exit(-1);
}

BigInt Integer(long long num){
	int i,j;
	BigInt n;
	n.push_back(1);
	if(num<0){
		n[0]= -1;
		num*=(-1);
	}
	while(num>0){
		n.push_back(num%10);
		num/=10;
	}
	for(i=1,j=n.size()-1; i<j; i++,j--){
		swap(n[i],n[j]);
	}
	return(n);
}

bool operator == (BigInt a, BigInt b){
	if(a[0]>b[0])
	return(0);
	else if(a[0]<b[0])
	return(0);
	else{
		if(a.size()*a[0] > b.size()*b[0])
		return(0);
		else{
			if(a.size()*a[0] < b.size()*b[0])
			return(0);
			else{
				for(int i=1; i<a.size(); i++){
					if(a[i]*a[0]>b[i]*b[0])
					return(0);
					if(a[i]*a[0]<b[i]*b[0])
					return(0);
				}
				return(1);
			}
		}
	}
}

bool operator >= (BigInt a, BigInt b){
	if(a[0]>b[0])
	return(1);
	else if(a[0]<b[0])
	return(0);
	else{
		if(a.size()*a[0] > b.size()*b[0])
		return(1);
		else{
			if(a.size()*a[0] < b.size()*b[0])
			return(0);
			else{
				for(int i=1; i<a.size(); i++){
					if(a[i]*a[0]>b[i]*b[0])
					return(1);
					if(a[i]*a[0]<b[i]*b[0])
					return(0);
				}
				return(1);
			}
		}
	}
}

bool operator > (BigInt a, BigInt b){
	if(a[0]>b[0])
	return(1);
	else if(a[0]<b[0])
	return(0);
	else{
		if(a.size()*a[0] > b.size()*b[0])
		return(1);
		else{
			if(a.size()*a[0] < b.size()*b[0])
			return(0);
			else{
				for(int i=1; i<a.size(); i++){
					if(a[i]*a[0]>b[i]*b[0])
					return(1);
					if(a[i]*a[0]<b[i]*b[0])
					return(0);
				}
				return(0);
			}
		}
	}
}

bool operator <= (BigInt a, BigInt b){
	if(a[0]<b[0])
	return(1);
	else if(a[0]>b[0])
	return(0);
	else{
		if(a.size()*a[0] < b.size()*b[0])
		return(1);
		else{
			if(a.size()*a[0] > b.size()*b[0])
			return(0);
			else{
				for(int i=1; i<a.size(); i++){
					if(a[i]*a[0]<b[i]*b[0])
					return(1);
					if(a[i]*a[0]>b[i]*b[0])
					return(0);
				}
				return(1);
			}
		}
	}
}

bool operator < (BigInt a, BigInt b){
	if(a[0]<b[0])
	return(1);
	else if(a[0]>b[0])
	return(0);
	else{
		if(a.size()*a[0] < b.size()*b[0])
		return(1);
		else{
			if(a.size()*a[0] > b.size()*b[0])
			return(0);
			else{
				for(int i=1; i<a.size(); i++){
					if(a[i]*a[0]<b[i]*b[0])
					return(1);
					if(a[i]*a[0]>b[i]*b[0])
					return(0);
				}
				return(0);
			}
		}
	}
}

BigInt deleteZeros(BigInt num){
	int i;
	BigInt n;
	n.push_back(num[0]);
	for(i=1; i<num.size()-1; i++){
		if(num[i]!=0)
		break;
	}
	for(i; i<num.size(); i++){
		n.push_back(num[i]);
	}
	return(n);
}

void Print(BigInt num){
	if(num[0]==-1)
	cout<<"-";
	for(int i=1; i<num.size(); i++){
		cout<<num[i];
	}
	cout<<endl;
}

BigInt operator + (BigInt a, BigInt b){
	int x,x1,x2,c,sizeA,sizeB,i,j;
	BigInt n;
	sizeA= a.size();
	sizeB= b.size();
	if(a[0]==b[0]){
		n.push_back(a[0]);
		for(i=sizeA-1, j=sizeB-1,c=0; i>=1 || j>=1; i--,j--){
			x1=0; x2=0;
			if(i>=1)
			x1=a[i];
			if(j>=1)
			x2=b[j];
			n.push_back((x1+x2+c)%10);
			c= (x1+x2+c)/10;
		}
		if(c!=0)
		n.push_back(c);
	}
	else{
		BigInt A,B;
		A=a; B=b;
		A[0]=1; B[0]=1;
		if(A < B){
			BigInt k=a;
			a=b;
			b=k;
		}
		n.push_back(a[0]);
		a[0]=1;
		b[0]=-1;
		for(i=sizeA-1, j=sizeB-1,c=0; i>=1 || j>=1; i--,j--){
			x1=0; x2=0;
			if(i>=1)
			x1=a[i]*a[0];
			if(j>=1)
			x2=b[j]*b[0];
			x= x1+x2+c;
			if(x<0){
				c=-1;
				x= 10+x;
			}
			else
			c=0;
			n.push_back(x);
		}
	}
	for(i=1, j=n.size()-1; i<j; i++,j--){
		swap(n[i],n[j]);
	}
	return(n);
}

BigInt operator - (BigInt a, BigInt b){
	int i;
	BigInt n;
	b[0]= b[0]*(-1);
	n= a+b;
	n= deleteZeros(n);
	return(n);
}

BigInt operator * (BigInt a, BigInt b){
	int tam,c,i,j,l;
	tam= a.size()+b.size()-1;
	BigInt n;
	n.push_back(a[0]*b[0]);
	n.push_back(0);
	for(i=a.size()-1; i>=1; i--){
		BigInt x;
		x.assign(b.size()+a.size()-i, 0);
		x[0]= a[0]*b[0];
		c=0;
		for(j=b.size()-1; j>=1; j--){
			x[j+1]= ((a[i]*b[j])+c)%10;
			c = ((a[i]*b[j])+c)/10;
		}
		if(c!=0)
		x[1]= c;
		n = n + x;
	}
	n= deleteZeros(n);
	return(n);
}

BigInt operator / (BigInt a, int b){
	int x,i,j;
	x=1;
	if(b<0)
	x=-1;
	BigInt n(a.size());
	n[0]= a[0]*x;
	a[0]=1;
	x= a[1];
	for(i=2; i <= a.size(); i++){
		if(x>=b){
			n[i-1]= x/b;
			x-= b*n[i-1];
		}
		else
		n[i-1]=0;
		if(i<a.size()){
			x= x*10;
			x= x+a[i];
		}
	}
	n= deleteZeros(n);
	return(n);
}

BigInt calcularEuler(){
	int i;
	BigInt e,x,y;
	x= Integer("10");
	y=x;
	for(i=1; i<=1010; i++){
		x= y*x;
	}
	e=x;
	for(i=1; i<=1000; i++){
		x= x/i;
		e= e+x;
	}
	return(e);
}

const int Q=1000000;
vector<int> sieve(Q);

void Eratostenes(){
	int raiz,i,j;
	for(i=2; i<Q; i++){
		sieve[i]=1;
	}
	raiz= sqrt(Q);
	for(i=2; i<Q; i++){
		if(sieve[i]==1){
			for(j=i*2; j<=Q; j+=i){
				sieve[j]=0;
			}
		}
	}
}

int main(){
	Eratostenes();
	BigInt e= calcularEuler();
	int first,mayor,x,i,j;
	first=0;
	mayor=0;
	for(i=1; i<=995; i++){
		x=0;
		for(j=0; j<6; j++){
			x+= e[i+j]*pow(10,6-j-1);
		}
		if(x>=100000 && sieve[x]==1){
			if(first==0)
			first=x;
			if(x>mayor)
			mayor=x;
		}
	}
	cout<<"primero = "<<first<<endl;
	cout<<"mayor = "<<mayor<<endl;
}
