import java.util.ArrayList;

public class Parser {


	private String REFile, VHDLFile;

	public Parser(String ref, String vhdlf){
		REFile = ref;
		VHDLFile = vhdlf;
	}

	public boolean isCharacter(char c){
		if(!isOperation(c) && c!='(' && c!=')'){
			return true;
		}else{
			return false;
		}
	}

	//Por el momento, sólo reconoce los operadores *,+,|
	public boolean isOperation(char c){
		boolean output = false;
		if(c=='*' || c=='|' || c=='+' || c=='·'){
			output = true;
		}
		return output;
	}

	public boolean leftParenthesis(String s){
		if(s.equals("(")){
			return true;
		}else{
			return false;
		}
	}

	public boolean rightParenthesis(String s){
		if(s.equals(")")){
			return true;
		}else{
			return false;
		}
	}

	
	public String toPostfix (String er){
		String post = "";
		ArrayList<String> list = new ArrayList<String>();
		Stack<String> s= new Stack<String>();
		String aux = "";
		for (int i=0; i<er.length(); i++){
			list.add(""+er.charAt(i));
		}
		while (!list.isEmpty()){
			aux = list.get(0);
			list.remove(0);
			//Si es un caracter (ni operador ni paréntesis)
			if(!isOperation(aux.charAt(0)) && !leftParenthesis(aux) && !rightParenthesis(aux)) {
				post = post+aux;
				//Si es paréntesis izquierdo
			}else if (leftParenthesis(aux)){
				s.push(aux);
				//Si es paréntesis derecho
			}else if (rightParenthesis(aux)){
				//Mientras la pila no esté vacía y la cima no sea un paréntesis izquierdo
				while(!s.empty() && !s.peek().equals("(")){
					post = post+s.pop();
				}
				if(s.peek().equals("(")){
					s.pop();
				}
				//Si es un operador
			}else{
				while(!s.empty() && isOperation(s.peek().charAt(0)) && precedence(s.peek(),aux)){
					post = post+s.pop();
				}
				s.push(aux);
			}
		}
		while(!s.empty()){
			post = post+s.pop();
		}

		return post;
	}

	public int precedenceValue(String op){
		if(op.equals("*") || op.equals("+")){
			return 2;
		}else if(op.equals("|") || op.equals("·")){
			return 1;
		}else{
			return 0;
		}
	}

	public String preProcessRE(String in){
		String output = "";
		String re = ""+eliminatePlusOperator(in);
		char cur, next;
		for(int i=0; i<re.length(); i++){
			cur = re.charAt(i);
			if(i < re.length()-1){
				next = re.charAt(i+1);
				//if((isCharacter(cur)&&isCharacter(next)) || ((isCharacter(cur) || cur=='+' || cur=='*')&&rightParenthesis(""+next)) || 
				//		(leftParenthesis(""+cur)&&isCharacter(next)) || ()){
				if((isCharacter(cur)&&isCharacter(next)) || (rightParenthesis(""+cur) && leftParenthesis(""+next)) ||
						(rightParenthesis(""+cur)&&isCharacter(next)) || (isCharacter(cur)&&leftParenthesis(""+next))){
					output = output+cur+"·";
				}else{
					output = output+cur;
				}
			}
			if(i==re.length()-1){
				output = output+cur;
			}
		}
		
		return output;
	}
	
	//Elimina el operador +
	public String eliminatePlusOperator(String re){
		String output = "";
		int i=0;
		while (i<re.length()){
			if(re.charAt(i)!= '+'){
				output = output+re.charAt(i);
			}else{
				output = output + output+"*)";
			}
			i++;
		}
		return output;
	}

	// op1 tiene precedencia igual o mayor sobre op2?
	public boolean precedence(String op1, String op2){
		if(precedenceValue(op1) >= precedenceValue(op2)){
			return true;
		}else{
			return false;
		}
	}

	public int numberOfChar(String s){
		int n=0;
		for (int i=0; i<s.length(); i++){
			if (isCharacter(s.charAt(i))){
				n++;
			}
		}
		return n;
	}
	
	public ArrayList<String> separateREs(String s){
		ArrayList<String> output = new ArrayList<String>();
		int j=0;
		output.add("");
		for(int i=0; i<s.length();i++){
			if(s.charAt(i)!=';'){
				output.set(j, output.get(j)+s.charAt(i));
			}else{
				j++;
				if(i<s.length()-1){
					output.add("");
				}
			}
		}
		return output;
	}
	
	//Encuentra la subcadena común a s1 y s2 más larga posible, con un tamaño mínimo scope. Si existe dicha subcadena, devuelve
	//un array cuyos dos primeros componentes son los índicesde s1 y s2, respectivametne
	//en los que empieza y el terero es su longitud. Si los índices son -1 y la longitud
	//0 quiere decir que no se ha encontrado ninguna subcadena que cumpla las condiciones
	public int[] longestMatch(String s1, String s2, int scope){
		int[] subchain= new int[3];
		subchain[0]=-1;
		subchain[1]=-1;
		subchain[2]=0;
		int l=scope;
		for(int i=0; i<s1.length(); i++){
			while(i+l<=s1.length() && s2.contains((s1.substring(i,i+l)))){
				if(l>subchain[2]){
					subchain[0]=i;
					subchain[1]= s2.indexOf(s1.substring(i,i+l));
					subchain[2]=l;
				}
				l++;
			}
			l=scope;
		}
		return subchain;
	}
	
	
	public boolean validSubchain(String s){
		int r=0;
		int l=0;
		for (int i=0; i<s.length(); i++){
			if(leftParenthesis(""+s.charAt(i))){
				l++;
			}
			if(rightParenthesis(""+s.charAt(i))){
				r++;
			}
		}
		if(r==l){
			return true;
		}else{
			return false;
		}
	}
	
	public ArrayList<String> optimizeRE(String res, int scope){
		ArrayList<String> s=new ArrayList<String>();
		ArrayList<String> output=new ArrayList<String>();
		s=separateREs(res);
		int[] aux = new int[3];
		String t="";
		for(int i=0; i<s.size()-1; i++){
			for(int j=1; j<s.size(); j++){
				aux=longestMatch(s.get(i), s.get(j), scope);
				if(aux[0]!=-1){
					
					//Falta incluír la posiblidad que la parte común esté al final de una cadena y al comienzo de otra
					if(aux[0]==0 && aux[1]==0){
						t="("+s.get(i).substring(0,aux[2])+")(("+s.get(i).substring(aux[2],s.get(i).length())+")|("+
						s.get(j).substring(aux[2],s.get(j).length())+"))";
					}else if(aux[0]+aux[2]==s.get(i).length() && aux[1]+aux[2]==s.get(j).length()){
						t= "(("+s.get(i).substring(0, s.get(i).length()-aux[2])+")|("+s.get(j).substring(0, s.get(j).length()-aux[2])+"))"+
						"("+s.get(i).substring(aux[0], aux[0]+aux[2])+");";
					}
					output.add(t);
					
					/*					
					t=s.get(i).substring(aux[0], aux[0]+aux[2]);
					//Controlar que los índices no se salgan de rango
					if(validSubchain(t)){
						t="("+s.get(i).substring(0, aux[0])+"|"+s.get(j).substring(0, aux[1])+")"+t+"(";

						if(aux[0]+aux[2] < s.get(i).length() && aux[1]+aux[2] < s.get(j).length()){
							t=t+s.get(i).substring(aux[0]+aux[2],s.get(i).length()-1)+"|"+s.get(j).substring(aux[1]+aux[2], s.get(j).length()-1);
						}else if(aux[0]+aux[2]+1 < s.get(i).length()){
							t=t+s.get(i).substring(aux[0]+aux[2]+1,s.get(i).length()-1);
						}else if(aux[1]+aux[2]+1 < s.get(j).length()){
							t=t+s.get(j).substring(aux[1]+aux[2]+1,s.get(i).length()-1);
						}
					t=t+")";
					*/
				}
			}
		}
		return output;
	}

	/**
	 * Procesa los literales de la ER y genera el código VHDL correspondiente
	 * @param REClass1
	 * @param REClass2
	 * @throws Exception
	 */
	public void process(String REClass1, String REClass2) throws Exception{
		FileHandler fh = new FileHandler(REFile, VHDLFile);
		String str = fh.getREClass(REClass1);
		
		Cadenas cadenas = new Cadenas();
		
		String er = "";
		String erpp;
		String erp;
		VHDLGenerator gen = new VHDLGenerator(cadenas);
		int m=0;
		int engineCounter=0;
		gen.basicBlockDescription();
		gen.andDescription();
		gen.orDescription();
		gen.starDescription();
		
		/**
		 * Llenamos las cadenas de cada conjunto para luego poder saber los puertos
		 * de cada engine
		 */
		System.out.println(("--------------------CONJUNTO 0-----------------------"));
		int numERS1 = 0;
		while(m<str.length()){
			if(str.charAt(m)!=';'){
				er = er+str.charAt(m);
			}else{
				erpp = preProcessRE(er);
				erp = toPostfix(erpp);
				System.out.println(("La expresion " + erp + " del conjunto 0 ha sido procesada"));
				cadenas.addCadena(erp);
				engineCounter++;
				erp=erp+";";
				er="";
			}
			m++;
		}
		numERS1 = engineCounter;
		
		m = 0;
		er = "";
		
		
		//AHORA PROCESAMOS EL SEGUNDO CONJUNTO DE EXPRESIONES REGULARES
		str = fh.getREClass(REClass2);
		m=0;
		int numERS2 = 0;
		
		System.out.println(("--------------------CONJUNTO 1-----------------------"));
		while(m<str.length()){
			if(str.charAt(m)!=';'){
				er = er+str.charAt(m);
			}else{
				erpp = preProcessRE(er);
				erp = toPostfix(erpp);
				System.out.println(("La expresion " + erp + " del conjunto 1 ha sido procesada"));
				cadenas.addCadena(erp);
				engineCounter++;
				erp=erp+";";
				er="";
			}
			m++;
		}
		m = 0;
		er = "";
		numERS2 = engineCounter-numERS1;

		//Por último generamos los componentes de cada engine
		System.out.println("******* COMPONENTES DE LOS ENGINES *******");
		System.out.println();
		int k = 0;
		for (String cad : cadenas.dameERSFormaPostfija()){
			if (k < numERS1) System.out.println("*** ENGINE " + k + " del conjunto 0***");
			else System.out.println("*** ENGINE " + k + " del conjunto 1***");
			System.out.println("EXPRESIÓN: " + cad);
			gen.engineDescription(k,cad+";");
			k++;
		}
		
		
		gen.generateRegExpMatching(engineCounter,numERS1,numERS2);
		//gen.generateBenchmarkRegExp(in, initialDelay, delay);
		fh.writeVHDFile(gen.getCode());
		}
}
