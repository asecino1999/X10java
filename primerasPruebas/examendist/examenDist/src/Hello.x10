/**
 * The canonical "Hello, World" demo class expressed in X10
 */

public class Hello {

    //sin paralelisar 
	public static def divisores (var x:Long):Rail[Long]{
		val v=new Rail[Long](18);
		var c2:Long=2;
		var aux:Long=x;
		v(1)=x;
		for(var j:Long=2;j<Math.sqrt(aux) && j <=x ;j++){
			//Console.OUT.println("j="+j);
			//Console.OUT.println("x%j="+x%j);
			while(x%j==0){
				v(c2)=j;
				x=x/j;
				c2++;
			}
		}
		if (x!=1){
			v(c2)=x;
			v(0)=c2;
		}else{
			
			v(0)=c2-1;
		}
		
		return v;
	}
	public static def factorisar1(x:Long):Rail[Long]{
		// el primero elemto de v es el numero y lo demas son los vectores
		// toamos a 2 como el meonor divisor
		// es improbable que el numero de divisores sea enor que 16 pues 100000<2^17
		var v1:Rail[Long];
		var v2:Rail[Long]; 
		v1=divisores(x);
		
		for (var i:Long=x-1;i>0;i--){
			v2=divisores(i);
			if (v2(0)>v1(0))
				v1=v2;
		}
			
		return v1;
	}
	public static def imprimir(v:Rail[Long]){
		Console.OUT.println("el numero es :"+v(1));
		Console.OUT.println("tiene  :"+(v(0)-1)+" divisiores propios");
		for (var i:Long=2;i<18 && v(i)!=0 ;i++)
		Console.OUT.print(v(i)+" x ");
		Console.OUT.println();
	}
	// paralisando 
	//sin paralelisar 
	public static def divisores2 (var x:Long):Rail[Long]{
		val v=new Rail[Long](18);
		var c2:Long=2;
		var aux:Long=x;
		v(1)=x;
		for(var j:Long=2;j<Math.sqrt(aux) && j <=x ;j++){
			//Console.OUT.println("j="+j);
			//Console.OUT.println("x%j="+x%j);
			while(x%j==0){
				v(c2)=j;
				x=x/j;
				c2++;
			}
		}
		if (x!=1){
			v(c2)=x;
			v(0)=c2;
		}else{
			
			v(0)=c2-1;
		}
		
		return v;
	}
	public static def factorisar2(x:Long):Rail[Long]{
		// el primero elemto de v es el numero y lo demas son los vectores
		// toamos a 2 como el meonor divisor
		// es improbable que el numero de divisores sea enor que 16 pues 100000<2^17
		// para guardar 
		var v1:Rail[Long]=divisores(x);;
		var v2:Rail[Long]=divisores(x);;
		var v3:Rail[Long]=divisores(x);
		var v4:Rail[Long]=divisores(x);
		var v5:Rail[Long]=divisores(x);
		var v6:Rail[Long]=divisores(x);
		var v7:Rail[Long]=divisores(x);
		var v8:Rail[Long]=divisores(x);
		var v9:Rail[Long]=divisores(x);
		var v10:Rail[Long]=divisores(x);
		// para comparar 
		var vv1:Rail[Long];
		var vv2:Rail[Long];
		var vv3:Rail[Long];
		var vv4:Rail[Long];
		var vv5:Rail[Long];
		var vv6:Rail[Long];
		var vv7:Rail[Long];
		var vv8:Rail[Long];
		var vv9:Rail[Long];
		var vv10:Rail[Long];
		var vv:Rail[Long];
		
		//finish for (var i:Long=1;;)
		//v1=divisores(x);
		
		finish{
			async for (var i:Long=x-1;i>9*x/10;i--){
				vv1=divisores2(i);
				if (vv1(0)>v1(0)){
					 v1=vv1;
					//imprimir(v1);
				}	
			}
			async for (var i:Long=9*x/10;i>8*x/10;i--){
				vv2=divisores2(i);
				if (vv2(0)>v2(0)){
					 v2=vv2;
					//imprimir(v1);
				}	
			}
			async for (var i:Long=8*x/10;i>7*x/10;i--){
				vv3=divisores2(i);
				if (vv3(0)>v3(0)){
					v3=vv3;
					//imprimir(v1);
				}	
			}
			async for (var i:Long=7*x/10;i>6*x/10;i--){
				vv4=divisores2(i);
				if (vv4(0)>v4(0)){
					v4=vv4;
					//imprimir(v1);
				}	
			}
			async for (var i:Long=6*x/10;i>5*x/10;i--){
				vv5=divisores2(i);
				if (vv5(0)>v5(0)){
					v5=vv5;
					//imprimir(v1);
				}	
			}
			async for (var i:Long=5*x/10;i>4*x/10;i--){
				vv6=divisores2(i);
				if (vv6(0)>v6(0)){
					v6=vv6;
					//imprimir(v1);
				}
			}
			async for (var i:Long=3*x/10;i>3*x/10;i--){
				vv7=divisores2(i);
				if (vv7(0)>v7(0)){
					v7=vv7;
					//imprimir(v1);
				}
			}
			async for (var i:Long=2*x/10;i>2*x/10;i--){
				vv8=divisores2(i);
				if (vv8(0)>v8(0)){
					v8=vv8;
					//imprimir(v1);
				}
			}
			async for (var i:Long=1*x/10;i>1*x/10;i--){
				vv9=divisores2(i);
				if (vv9(0)>v9(0)){
					v9=vv9;
					//imprimir(v1);
				}
			}
			async for (var i:Long=1*x/10;i>2;i--){
				vv10=divisores2(i);
				if (vv10(0)>v10(0)){
					v10=vv10;
					//imprimir(v1);
				}
			}
		}
		
		if (v1(0)>v2(0))
			vv=v1;
		else
			vv=v2;
		finish{
			async if (vv(0)<v3(0))
				atomic vv=v3;
			async if (vv(0)<v4(0))
				atomic vv=v4;
			async if (vv(0)<v5(0))
				atomic vv=v5;
			async if (vv(0)<v6(0))
				atomic vv=v6;
			async if (vv(0)<v7(0))
				atomic vv=v7;
			async if (vv(0)<v8(0))
				atomic vv=v8;
			async if (vv(0)<v9(0))
				atomic vv=v9;
			async if (vv(0)<v10(0))
				atomic vv=v10;
			}
		return vv;
	}

	/**
     * The main method for the Hello class
     */
    public static def main(Rail[String]) {
        /*finish for (p in Place.places()) {
            at (p) async Console.OUT.println("Hello World from place "+p.id);
        }*/
    	//Console.OUT.println(divisores(30)+" "+ 7%5);
    	Console.OUT.println();
    	Console.OUT.println("-----------");
    	Console.OUT.println("sin paralelisar");
    	imprimir(factorisar1(100000));
    	Console.OUT.println();
    	Console.OUT.println("-----------");
    	Console.OUT.println();
    	Console.OUT.println(" paralelisando");
    	imprimir(factorisar2(100000));
    	Console.OUT.println();
    	Console.OUT.println("-----------");
    }

}