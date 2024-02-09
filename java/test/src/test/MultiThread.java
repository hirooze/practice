package test;

class MultiThread extends Thread {
	String str;
	int time;
	
	MultiThread(String str,int time){
		this.str = str;
		this.time = time;
	}
	public void run() {
		for (int i=0; i<5; i++) {
			System.out.println("No." + i + ":" + str);
			try {
				sleep(time);
			}catch(InterruptedException e){}
		}
	}
}