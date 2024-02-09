package test;

import java.net.ServerSocket;
import java.net.Socket;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Date;

public class SimpleServer {
	public static void main(String[] args) {
		try {
			ServerSocket server = new ServerSocket(1000);
			Socket       client = server.accept();
			PrintWriter  out    = new PrintWriter(client.getOutputStream(),true);
			out.println("Hello,Client");
			out.println(new Date().toString());
			out.println("Good Bye");
			client.close();
		} catch(IOException e) {
			System.err.println("Error" + e);
		}
	}
}