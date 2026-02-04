package test;
public class Array {
	public static void main(String[] args) {
		double[] root;
		
		root = new double[3];

		root[0] = 0.0;
		root[1] = 1.0;
		root[2] = 2.0;
		
		System.out.println(root[0]);
		System.out.println(root[1]);
		System.out.println(root[2]);
		
		int[] a = {0,1,2};
		System.out.println(a[0]);
		System.out.println(a[1]);
		System.out.println(a[2]);
		System.out.println("配列の長さ\t： " + a.length);
		
		int mtable[][];
		mtable = new int[3][3];
        mtable[0][0] = 1;
        mtable[0][1] = 2;
        mtable[0][2] = 3;
        mtable[1][0] = 4;
        mtable[1][1] = 5;
        mtable[1][2] = 6;
        mtable[2][0] = 7;
        mtable[2][1] = 8;
        mtable[2][2] = 9;
		System.out.println("配列[0][0]: " + mtable[0][0]);
		System.out.println("配列[0][1]： " + mtable[0][1]);
		System.out.println("配列[0][2]： " + mtable[0][2]);
		System.out.println("配列[1][0]： " + mtable[1][0]);
		System.out.println("配列[1][1]： " + mtable[1][1]);
		System.out.println("配列[1][2]： " + mtable[1][2]);
		System.out.println("配列[2][0]： " + mtable[2][0]);
		System.out.println("配列[2][1]： " + mtable[2][1]);
		System.out.println("配列[2][2]： " + mtable[2][2]);
        
	}
}
