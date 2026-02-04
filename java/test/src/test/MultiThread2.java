package test;

class MultiThread2 extends Thread {
	int time;
	
	MultiThread2(String str,int time){
		super(str);
		this.time = time;
	}
	public void run() {
		for (int i=0;i<5;i++) {
			System.out.println("No." + i + ":" + Thread.currentThread().getName());
			try {
				Thread.sleep(time);
			}catch(InterruptedException e) {}
		}
	}
}