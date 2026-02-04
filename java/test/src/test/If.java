package test;

public class If {
	public static void main(String[] args) {
		double height,weight,weightAve,fat;
		
		height = 1.75;
		weight = 85.5;
		
		weightAve = 22 * Math.pow(height,2);
		fat       = (weight - weightAve) / weightAve * 100;

		System.out.println("あなたの肥満率は" + fat + "%です。");
		if (fat >=20) {
			System.out.println("Out");
		} else if (fat <=-10 ) {
			System.out.println("Safe");
		} else {
			System.out.println("Safe");			
		}
	}
}
