package estructuras;

import java.lang.reflect.*;

public class PriQueue<T extends Comparable<? super T>>{
	private int size,maxsize;
    public T[] vector;
    
    public PriQueue(Class<T> clase, int m) {
    	maxsize = m;
    	size = 0;
    	vector = (T[]) Array.newInstance(clase, maxsize); 
    }
    
    public boolean empty(){
    	return(size==0);
    }
    
    public void push(T val){
    	int i,j;
    	vector[size] = val;
    	i = size;
    	while(i>0){
    		j = (i-1)/2;
    		if(vector[i].compareTo(vector[j]) < 0){
    			swap(i,j);
    			i = j;
    		}
    		else
    		break;
    	}
    	size++;
    }
    
    public T front(){
    	return(vector[0]);
    }
    
    public void pop(){
    	int i,left,right;
    	size--;
    	vector[0]= vector[size];
    	for(i=0; i<size;){
    		left = (2*i) + 1;
    		right = (2*i) + 2;
    		if(right < size){
    			if(vector[left].compareTo(vector[right]) < 0){
    				if(vector[left].compareTo(vector[i]) < 0){
    					swap(i,left);
    					i = left;
    				}
    				else
    				break;
    			}
    			else{
    				if(vector[right].compareTo(vector[i]) < 0){
    					swap(i,right);
    					i = right;
    				}
    				else
    				break;
    			}
    		}
    		else if(left < size){
    			if(vector[left].compareTo(vector[i]) < 0){
    				swap(i,left);
    				i = left;
    			}
    			else
    			break;
    		}
    		else
    		break;
    	}
    }
    
    private void swap(int pos1, int pos2){
    	T temp = vector[pos1];
    	vector[pos1] = vector[pos2];
    	vector[pos2] = temp;
    }
}
