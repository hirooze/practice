package test;
import java.net.*;
import java.io.*;

public class SimpleClient {
	public static void main(String[] args) {
		try {
			Socket            soc  = new Socket("localhost",1000);
			InputStreamReader sisr = new InputStreamReader(soc.getInputStream());
			BufferedReader    br   = new BufferedReader(sisr);
			
			while(true) {
				String inputLine = br.readLine();
				if(inputLine != null) {
					System.out.println("Server; " + inputLine);
					if(inputLine.equals("Good Bye")) {
						break;
					}
				}
			}
			soc.close();
		}catch(UnknownHostException e) {
			System.err.println("No Existed IP Address :" + e);
		}catch(IOException e) {
			System.err.println("Error." + e);
		}
	}
}