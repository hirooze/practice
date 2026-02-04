package test;

class MultiThread3 implements Runnable {
	int time;
	MultiThread3(int time){
		this.time = time;
	}
	
	public void run() {
		for(int i=0;i<5;i++) {
			System.out.println("No." + i + ":" + Thread.currentThread().getName());
			try {
				Thread.sleep(time);
			} catch(InterruptedException e) {}
		}
	}
}