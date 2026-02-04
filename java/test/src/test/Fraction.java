package test;

class Fraction {
	int bunsi,bunbo;
	
	Fraction(){
		bunsi = 0;
		bunbo = 1;
	}
	
	Fraction(int n){
		bunsi = n;
		bunbo = 1;		
	}
	Fraction(int n,int d){
		bunsi = n;
		bunbo = d;		
	}
	
	Fraction add(int num) {
		Fraction tmpF = new Fraction();
		
		tmpF.bunbo = this.bunbo;
		tmpF.bunsi = this.bunsi + tmpF.bunbo * num;
		
		return tmpF;
		//戻り値はfraction型
	}
}
