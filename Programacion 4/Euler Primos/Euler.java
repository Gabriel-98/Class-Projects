import java.util.*;
import java.math.*;

public class Euler{
	public static BigDecimal calculoeEuler(){
		BigDecimal numE = new BigDecimal(2);
		BigDecimal f = new BigDecimal(1);
		for(int i=2; i<1000; i++){
			f = f.multiply(new BigDecimal(i));
			BigDecimal k = (new BigDecimal(1)).divide(f, 2000, RoundingMode.HALF_DOWN);
			numE = numE.add(k);
		}
		return(numE);
	}

	public static void Eratostenes(int lim, int[] sieve){
		int i,j;
		sieve[0]=0; sieve[1]=0;
		for(i=2; i<lim; i++){
			sieve[i]=1;
		}
		for(i=2; i<lim; i++){
			if(sieve[i]==1){
				for(j=2*i; j<lim; j+=i){
					sieve[j]=0;
				}
			}
		}
	}

	public static void main(String[] args){
		int x,i,j,lim = 1000000, mayor, first = 0;
		int sieve[] = new int[1000000];
		Eratostenes(lim, sieve);
		BigDecimal numE = calculoeEuler();
		String cad = numE.toPlainString();
		cad = cad.replace(".","");
		cad = cad.substring(0,1000);
		for(i=0,mayor=0; i<=994; i++){
			x=0;
			for(j=0; j<6; j++){
				x+= (cad.charAt(i+j)-'0')* Math.pow(10,6-j-1);
			}
			if(sieve[x]==1){
				if(first==0)
				first= x;
				if(x>mayor)
				mayor=x;
			}
		}
		System.out.println("primero = " + first);
		System.out.println("mayor = " + mayor);
	}
}