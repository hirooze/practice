package test;

import java.io.FileReader;

public class PrintList1 {
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader(args[0]);
			
			int c;
			while ((c = fr.read()) != -1) {
				System.out.print((char)c);
			}
			fr.close();
		}catch(Exception e) {}
	}
}