package test;

class MultiThreadTest {
	public static void main(String[] args) {
		MultiThread a = new MultiThread("A",500);
		MultiThread b = new MultiThread("\tB",700);
		MultiThread c = new MultiThread("\t\tC",900);
		
		a.start();
		b.start();
		c.start();
	}
}
