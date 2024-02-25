package test;
public class HelloLoop {
	public static void main(String[] args) {
		//for(初期化式;条件式;更新式)「,」で複数指定が可能
		for(int i=0,j=10; i<5;i++,j--) {
			System.out.println("For\tLoop : Hello " + (i*j));
			int n = 0;
			//while(条件式)
			while(n<5) {
				System.out.println("While\tLoop : Hello " + n);
				n++;
			}
		}
		//while(条件式)後判断
		int t = 0;
		do {
			System.out.println("While\tLoop : Hello " + t);
			t++;
		}while(t<5);
		outer_loop://ラベル
		for(int x=1;x<10;x++) {
			for(int y=1;y<10;y++) {
				System.out.print(x*y);
				System.out.print("\t");
				if(x>=5&&y>=6)break outer_loop;//ラベルの付いた外側のループが強制終了
			}
			System.out.println();
		}
		
		int[] data = {5,3,7,-1,4,2,9};
		for(int i=0;i<data.length;i++) {
			//0未満になったときループ終了
			if(data[i] < 0) {
				break;
			}
			System.out.println(data[i]);
		}
	}
}