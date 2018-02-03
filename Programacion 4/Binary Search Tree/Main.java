public class Main{
	
	public static void main(String[] args){
		Tree<Integer> tree = new Tree<Integer>();
		tree.insert(23);
		tree.insert(8);
		tree.insert(40);
		tree.insert(4);
		tree.insert(15);
		tree.insert(30);
		tree.insert(45);
		tree.insert(7);
		tree.insert(10);
		tree.insert(17);
		tree.insert(32);
		tree.insert(42);
		tree.insert(52);
		tree.insert(31);
		tree.insert(32);
		tree.insert(43);
		System.out.println(tree.find(17));
		System.out.println(tree.find(13));
		System.out.println(tree.find(8));
		tree.print();
		tree.erase(30);
		tree.erase(23);
		tree.erase(45);
		tree.erase(4);
		tree.print();
	}
}