/**
 * The canonical "Hello, World" demo class expressed in X10
 */
import x10.lang.Char;
import x10.lang.Int;
import x10.io.File;
//import x10.util.StringUtil;
import x10.lang.String;
public class Hello {

    /**
     * primero leer , encrptar escribir y desencriptar
     */
    public static def ascii(c:Char):Long{
    	val s :String="abcdefghijklmnñopqrstuvwxyz ";
    	val s1:String="ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    	val sn:String="0123456789";
    	var n :Long=s.indexOf(c);
    	var n1:Long=s1.indexOf(c);
    	var nn:Long=sn.indexOf(c);
    	if (n!=-1){
    		return n;
    	}else if(n1!=-1){
    			return n1+s.length();
    		}else if(nn!=-1){
    				return nn+s.length()+s1.length();
    			}
    	return s.length()-1;
    }
    public static def toChar(n:Long):Char{
    	val s :String="abcdefghijklmnñopqrstuvwxyz ";
    	val s1:String="ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    	val sn:String="0123456789";
    	var n1:Long=n;
    	if (n>=s.length()){
    		n1=n1-s.length();
    		//if (1==1){
    		//	return ' ';
    		//}
    		if(n1>=s1.length()){
    			n1=n1-s1.length();
    			if(n1>sn.length()){
    				return ' ';
    			} else{
    				return sn.charAt(Int.operator_as(n1));
    			}
    		}else{
    			return s1.charAt(Int.operator_as(n1));
    		}
    	}else{
    		return s.charAt(Int.operator_as(n1));
    	}
    	//return ' ';
    }
    public static def  encriChar(c:Char):Char{
    	val s :String="abcdefghijklmnñopqrstuvwxyz ";
    	val s1:String="ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    	val sn:String="0123456789";
    	var n:Long=ascii(c);
    	var n1:Long=ascii(c);
    	if (n<s.length()){
    		if (n+3<s.length()){
    			return toChar(n1+3);
    		}else{
    			return toChar(n1+3-s.length());
    		}
    	}
    	n-=s.length();
    	if (n<s1.length()){
    		if (n+3<s1.length()){
    			return toChar(n1+3);
    		}else{
    			return toChar(n1+3-s1.length());
    		}
    	}
    	n-=s1.length();
    	if (n<sn.length()){
    		if (n+3<sn.length()){
    			return toChar(n1+3);
    		}else{
    			return toChar(n1+3-sn.length());
    		}
    	}
    	
    	return c;
    }
    public static def  desencriChar(c:Char):Char{
    	val s :String="abcdefghijklmnñopqrstuvwxyz ";
    	val s1:String="ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    	val sn:String="0123456789";
    	var n:Long=ascii(c);
    	var n1:Long=ascii(c);
    	if (n<s.length()){
    		if (n-3>=0){
    			return toChar(n1-3);
    		}else{
    			return toChar(n1-3+s.length());
    		}
    	}
    	n-=s.length();
    	
    	if (n<s1.length()){
    		if (n-3>=0){
    			return toChar(n1-3);
    		}else{
    			return toChar(n1-3+s1.length());
    		}
    	}
    	n-=s1.length();
    	
    	if (n<sn.length()){
    		if (n-3>=0){
    			return toChar(n1-3);
    		}else{
    			return toChar(n1-3+sn.length());
    		}
    	}
    	
    	return c;
    }
    public static def encriptar(s:String):String{
    	var pal:String="";
    	for (var i:Int=Int.operator_as(0);i<s.length();i++){
    		pal=pal+encriChar(s.charAt(i));
    	}
    	return pal;
    }
    public static def desencriptar(s:String):String{
    	var pal:String="";
    	for (var i:Int=Int.operator_as(0);i<s.length();i++){
    		pal=pal+desencriChar(s.charAt(i));
    	}
    	return pal;
    }
    public static def impln(s:String){
    	Console.OUT.println(s);
    }
    public static def imp(s:String){
    	Console.OUT.print(s);
    }
    public static def impRail(ra:Rail[String],total:Long){
    	for (var i:Long=1;i<total;i++){
    		impln(ra(i));
    	}
    }
    public static def leer(f:File,total:Long):Rail[String]{
    	val ra= new Rail[String](total,"");
    	val lines=f.lines();
    	var cont:Long=1;
    	while(lines.hasNext()) {
    		ra(cont)=lines.next();
    		cont++;
    	}
    	ra(0)=(cont)+"";
    	return ra;
    }
    public static def escribir(ubi:String,ra:Rail[String],total:Long){
    	val f=new File(ubi);
    	val escritor=f.printer();
    	for (var j:Long=1; j<total;j++) {
    		escritor.println(ra(j));
    	}
    	escritor.flush();
    }
    public static def encripRail(ra:Rail[String],total:Long):Rail[String]{
    	val ra2=new Rail[String](total+1);
    	for(var i:Long=1;i<total;i++){
    		ra2(i)=encriptar(ra(i));
    	}
    	return ra2;
    }
    public static def desencripRail(ra:Rail[String],total:Long):Rail[String]{
    	val ra2=new Rail[String](total+1);
    	for(var i:Long=1;i<total;i++){
    		ra2(i)=desencriptar(ra(i));
    	}
    	return ra2;
    }
    public static def probarEncri(){
    	val raiz="//home//gerald//x10//proyectos//X10git//X10java//solExamen";
    	val s :String="abcdefghijklmnñopqrstuvwxyz ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789";
    	for (var i:Int=Int.operator_as(0);i<s.length();i++){
    		var c:Char=s.charAt(i);
    		//impln(c+" as int "+ascii(c) +" retorno "+toChar(ascii(c)));
    		impln(c+" encri "+encriChar(c)+" desencri "+desencriChar(encriChar(c)));
    		
    	}
    	impln(encriptar(" 0123456789"));
    	impln(desencriptar(encriptar(" a A z YXZ 0123456789")));
    	val se:String=encriptar(s);
    	val ra2=new Rail[String](s.length()+1);
    	var cont:Long=1;
    	for (var i:Int=Int.operator_as(0);i<s.length();i++ ,cont++){
    		ra2(cont)=s.charAt(i)+" "+se.charAt(i);
    		
    	}
    	escribir(raiz+"//salida0.txt",ra2,s.length());
    }
	public static def main(Rail[String]) {
		probarEncri();
		val raiz="//home//gerald//x10//proyectos//X10git//X10java//solExamen";
		val orig=new File(raiz+"//original.txt");
		val max:Long=200;
		val ra=leer(orig,max);
        val total:Long=Long.parse(ra(0));
        //impRail(ra,total);
        val raen=encripRail(ra,total);
        //impRail(raen,total);
        val rade=desencripRail(raen,total);
        //impRail(rade,total);
        escribir(raiz+"//salida.txt",raen,total);
        val sal=new File(raiz+"//salida.txt");
        val rasa=leer(sal,max);
        val rasade=desencripRail(rasa,total);
        impRail(rasade,total);
        escribir(raiz+"//salida2.txt",rasade,total);
    }

}