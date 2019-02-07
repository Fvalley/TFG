import java.util.ArrayList;

public class VHDLGenerator {
	
	private ArrayList<String> code;
	private Cadenas cadenas;
	
	public VHDLGenerator(Cadenas cadenas){
		this.cadenas = cadenas;
		code = new ArrayList<String>();
	}
	
	
	public void basicBlockDescription(){
		leaveEmptyLine();
		leaveEmptyLine();
		importLibraries();
		leaveEmptyLine();
		String line = "";
		line = "ENTITY basic_block IS";
		code.add(line);
		line = "PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); " +
				"char_in: IN std_logic_vector (7 downto 0); c_in: IN std_logic; c_out: OUT std_logic);";
		code.add(line);
		line = "END;";
		code.add(line);
		line = "";
		code.add(line);
		line = "ARCHITECTURE behavior OF basic_block IS";
		code.add(line);
		line = "SIGNAL state: std_logic;";
		code.add(line);
		line = "SIGNAL matching: std_logic;";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "PROCESS (state, matching)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "IF (matching ='1' AND state='1') THEN";
		code.add(line);
		line = "c_out <= '1';";// AFTER 5ns;";
		code.add(line);
		line = "ELSE";
		code.add(line);
		line = "c_out <= '0';";// AFTER 5ns;";
		code.add(line);
		line = "END IF;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		line = "PROCESS(clk, c_in)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "IF (clk'EVENT AND clk='1') THEN";
		code.add(line);
		line = "state <= c_in;";// AFTER 5ns;";
		code.add(line);
		line = "END IF;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		line = "PROCESS(char_in, matching_char)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "IF (matching_char = char_in) THEN";
		code.add(line);
		line = "matching <= '1';";// AFTER 5ns;";
		code.add(line);
		line = "ELSE";
		code.add(line);
		line = "matching <= '0';";// AFTER 5ns;";
		code.add(line);
		line = "END IF;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		line = "END behavior;";
		code.add(line);
		leaveEmptyLine();
	
	}
	
	public void andDescription(){
		leaveEmptyLine();
		leaveEmptyLine();
		importLibraries();
		leaveEmptyLine();
		String line = "";
		line = "ENTITY andBlock IS";
		code.add(line);
		line = "PORT (i: IN std_logic; i1: IN std_logic; i2: IN std_logic; " +
				"o: OUT std_logic; o1: OUT std_logic; o2: OUT std_logic);";
		code.add(line);
		line = "END;";
		code.add(line);
		leaveEmptyLine();
		line = "ARCHITECTURE structuralAnd OF andBlock IS";
		code.add(line);
		line = "BEGIN";
		code.add(line);
//		line = "SIGNAL s0: std_logic;";
//		code.add(line);
//		line = "SIGNAL s1: std_logic;";
//		code.add(line);
//		line = "SIGNAL s2: std_logic;";
//		code.add(line);
		leaveEmptyLine();
		line = "PROCESS(i, i1, i2)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "o1 <= i;";
		code.add(line);
		line = "o2 <= i1;";
		code.add(line);
		line = "o <= i2;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		leaveEmptyLine();
		line = "END structuralAnd;";
		code.add(line);
		
	}
	
	public void orDescription(){
		leaveEmptyLine();
		leaveEmptyLine();
		importLibraries();
		String line = "";
		line = "ENTITY orBlock IS";
		code.add(line);
		line = "PORT (i: IN std_logic; i1: IN std_logic; i2: IN std_logic; " +
		"o: OUT std_logic; o1: OUT std_logic; o2: OUT std_logic);";
		code.add(line);
		line = "END;";
		code.add(line);
		leaveEmptyLine();
		line = "ARCHITECTURE structuralOr OF orBlock IS";
		code.add(line);
		line = "BEGIN";
		code.add(line);
//		line = "SIGNAL s0: std_logic;";
//		code.add(line);
//		line = "SIGNAL s1: std_logic;";
//		code.add(line);
//		line = "SIGNAL s2: std_logic;";
//		code.add(line);
		leaveEmptyLine();
		line = "PROCESS(i, i1, i2)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "o1 <= i;";
		code.add(line);
		line = "o2 <= i;";
		code.add(line);
		line = "o <= i1 OR i2;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		leaveEmptyLine();
		line = "END structuralOr;";
		code.add(line);

		
	}
	
	
	
	public void starDescription(){
		leaveEmptyLine();
		leaveEmptyLine();
		importLibraries();
		String line = "";
		line = "ENTITY starBlock IS";
		code.add(line);
		line = "PORT (i: IN std_logic; i1: IN std_logic; " +
		"o: OUT std_logic; o1: OUT std_logic);";
		code.add(line);
		line = "END;";
		code.add(line);
		leaveEmptyLine();
		line = "ARCHITECTURE structuralStar OF starBlock IS";
		code.add(line);
		line = "BEGIN";
		code.add(line);
//		line = "SIGNAL s0: std_logic;";
//		code.add(line);
//		line = "SIGNAL s1: std_logic;";
//		code.add(line);
//		line = "SIGNAL s2: std_logic;";
//		code.add(line);
		leaveEmptyLine();
		line = "PROCESS(i, i1)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "o1 <= i OR i1;";
		code.add(line);
		line = "o <= i1 OR i;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		leaveEmptyLine();
		line = "END structuralStar;";
		code.add(line);
		leaveEmptyLine();
		leaveEmptyLine();
		
	}
	
	public void importLibraries(){
		String line = "library ieee;";
		code.add(line);
		line = "use ieee.std_logic_1164.all;";
		code.add(line);
		line = "";
		code.add(line);
		
		//Comienza la descripción del engine
				
	}
	
	public void initializeEngineCode (String entityName, String architectureName, int id){
		importLibraries();
		leaveEmptyLine();
		String line = "ENTITY "+ entityName +" IS";
		code.add(line);
		
		line ="PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); ";
		
		//Puertos de entrada del engine id (ojo no las señales)
		ArrayList<String> puertos_ER_in = cadenas.dameSignalsEntradasEngine(id);
		int i = 0;
		for (String puerto_ER_in : puertos_ER_in){
			if (puerto_ER_in.length() != 0) line += "i_" + puerto_ER_in + ": IN std_logic; ";
			i++;
		}
		//if (puerto_ER_in.length() != 0) line += puerto_ER_in + ": IN std_logic; ";
		
		//Puertos de salida del engine id
		ArrayList<String> puertos_ERs_out = cadenas.dameSignalsSalidaEngine(id);
		i = 0;
		for (String puerto_ER_out : puertos_ERs_out){
			if (puerto_ER_out.length() != 0) line += "o_subExp" + i + ": OUT std_logic; ";
			i++;
		}
		
		line+="output: OUT std_logic);";
		code.add(line);
		
		line = "END;";
		code.add(line);
		line = "";
		code.add(line);
		line = "ARCHITECTURE "+ architectureName +" OF "+ entityName +" IS";
		code.add(line);
		line = "";
		code.add(line);
		//Declaración de componentes
		line = "COMPONENT basic_block";
		code.add(line);
		line = "PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); char_in : IN std_logic_vector(7 downto 0); " +
				"c_in: IN std_logic; c_out: OUT std_logic);";
		code.add(line);
		line = "END COMPONENT;";
		code.add(line);
		line = "COMPONENT andBlock";
		code.add(line);
		line = "PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; " +
				"o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);";
		code.add(line);
		line = "END COMPONENT;";
		code.add(line);
		line = "COMPONENT orBlock";
		code.add(line);
		line = "PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; " +
		"o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);";
		code.add(line);
		line = "END COMPONENT;";
		code.add(line);
		line = "COMPONENT starBlock";
		code.add(line);
		line = "PORT (i: INOUT std_logic; i1: INOUT std_logic; " +
		"o: INOUT std_logic; o1: INOUT std_logic);";
		code.add(line);
		line = "END COMPONENT;";
		code.add(line);
		
		leaveEmptyLine();
		
	}
	
	public void lastModuleConnections(int i){
		String line = "PROCESS(id"+i+"_o)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "id"+i+"_i <= '1';";
		code.add(line);
		line = "output <= "+"id"+i+"_o;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
	}
	
	public void finishEngineCode (String architectureName){
		String line = "END "+ architectureName +";";
		code.add(line);
		line = "";
		code.add(line);
	}
	
	
	//MODIFICAR ESTE MÉTODO PARA QUE SE ADAPTE AL NUEVO ESTÁNDAR!!!
	public void generateSignal (String signal_name, String signal_type, int number_of_positions){
		String line = "";
		if (number_of_positions <= 0){
			line = "SIGNAL "+signal_name+": "+signal_type+";";
		} else{
			line = "SIGNAL "+signal_name+": "+signal_type+"["+number_of_positions+" downto 0];";
		}
		code.add(line);
	}

	
	public ArrayList<String> getCode(){
		return code;
	}
	
	public void leaveEmptyLine(){
		String line = "";
		code.add(line);
	}
	
	
	//Tiempo entre flancos, expresado en ns
	public void generateClock(int cicle){
		String line = "PROCESS";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "CLOCK_LOOP: LOOP";
		code.add(line);
		line = "clock <= transport '0';";
		code.add(line);
		line = "WAIT FOR "+cicle+" ns;";
		code.add(line);
		line = "clock <= transport '1';";
		code.add(line);
		line = "WAIT FOR "+cicle+" ns;";
		code.add(line);
		line = "END LOOP CLOCK_LOOP;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		
	}
	
	//Retardo de 5ns en la transmisión de la señal
	public void route1(int p, int q){
		leaveEmptyLine();
		String line = "";
		leaveEmptyLine();
		line = "PROCESS(id"+q+"_o, id"+p+"_o1)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "id"+p+"_i1 <= id"+q+"_o;";
		code.add(line);
		line = "id"+q+"_i <= id"+p+"_o1;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
	}
	
//	//Retardo de 5ns en la transmisión de la señal
//	public void route1Port(int p, String puertoEntradaER){
//		leaveEmptyLine();
//		String line = "";
//		leaveEmptyLine();
//		line = "PROCESS(" + puertoEntradaER + ", id"+p+"_o1)";
//		code.add(line);
//		line = "BEGIN";
//		code.add(line);
//		line = "id"+p+"_i1 <= " + puertoEntradaER + ";";
//		code.add(line);
//		line = "END PROCESS;";
//		code.add(line);
//	}
	
	//Retardo de 5ns en la transmisión de la señal
	public void route1Port(int p, String puertoEntradaER){
		leaveEmptyLine();
		String line = "";
		line = "id"+p+"_i1 <= " + puertoEntradaER + ";";
		code.add(line);
	}
	
	//Retardo de 5ns en la transmisión de la señal
	public void route2(int p, int q){
		leaveEmptyLine();
		String line = "";
		leaveEmptyLine();
		line = "PROCESS(id"+q+"_o, id"+p+"_o2)";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "id"+p+"_i2 <= id"+q+"_o;";
		code.add(line);
		line = "id"+q+"_i <= id"+p+"_o2;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
	}
	
	
	public String toBinary(int n){
		String s = "";
		int i = n;
		while (i>=1){
			s = i%2+s;
			i = i/2;
		}
		int l = s.length();
		for (int j=0; j<8-l;j++){
			s = "0"+s;
		}
		return s;
	}
	
	/**
	 * Genera los port-maps necesarios para el Bloque Básico dado por parametro
	 * @param id
	 * @param matchingChar
	 * 
	 */
	public void generateBB(int id, String matchingChar) {
		String line = "";
//		//La entrada del primer bloque es distinta
//		if (id==0){
//			line = "BEGIN";
//			code.add(line);
//		}
		//	line = "id"+id + ": basic_block PORT MAP (clock, \""+matchingChar+"\", \""+ charIn+"\", c_out_"+(id-1)+", c_out_"+id+");";
		//}
		line = "id"+id + ": basic_block PORT MAP (clock, \""+matchingChar+"\", charIn, id"+id+"_i, id"+id+"_o);";
		code.add(line);
		//line = "END COMPONENT;";
		//code.add(line);
		leaveEmptyLine();
		
	}
	
	/**
	 * Genera los port-maps necesarios para el Bloque AND dado por parametro
	 * @param id
	 */
	public void generateAndBlock(int id){
		String line = "";
//		line = "BEGIN";
//		code.add(line);
		if (id==0){
			line = "BEGIN";
			code.add(line);
		}
		line = "id"+id+": andBlock PORT MAP(id"+id+"_i, id"+id+"_i1, id"+id+"_i2, " +
				"id"+id+"_o, id"+id+"_o1, id"+id+"_o2);";
		code.add(line);
		leaveEmptyLine();
	}
	
	/**
	 * Genera los port-maps necesarios para el Bloque OR dado por parametro
	 * @param id
	 */
	public void generateOrBlock(int id){
		String line = "";
		if (id==0){
			line = "BEGIN";
			code.add(line);
		}
		line = "id"+id+": orBlock PORT MAP(id"+id+"_i, id"+id+"_i1, id"+id+"_i2, " +
				"id"+id+"_o, id"+id+"_o1, id"+id+"_o2);";
		code.add(line);
		leaveEmptyLine();
	}
	
	
	/**
	 * Genera los port-maps necesarios para el Bloque STAR dado por parametro
	 * @param id
	 */
	public void generateStarBlock(int id){
		String line = "";
		if (id==0){
			line = "BEGIN";
			code.add(line);
		}
		line = "id"+id+": starBlock PORT MAP(id"+id+"_i, id"+id+"_i1, "+
				"id"+id+"_o, id"+id+"_o1);";
		code.add(line);
		leaveEmptyLine();
	}
	

	/**
	 * @param engines
	 * @param salidas
	 * @param numERS1
	 * @param numERS2
	 */
	public void generateRegExpMatching(int engines, int numERS1, int numERS2){
		leaveEmptyLine();
		importLibraries();
		leaveEmptyLine();
		String line = "ENTITY regExpMatching IS";
		code.add(line);
		line = "PORT(clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output1: OUT std_logic; output2: OUT std_logic);";
		code.add(line);
		line = "END;";
		code.add(line);
		leaveEmptyLine();
		line = "ARCHITECTURE structuralRegExpMatching OF regExpMatching IS";
		code.add(line);
		
		ArrayList<String> puertos_ER_in;
		ArrayList<String> puertos_ERs_out;
		
		//Generamos los componentes (engines)
		for(int i=0; i<engines; i++){
			line = "COMPONENT engine"+i;
			code.add(line);
			
			line ="PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); ";
			
			puertos_ER_in = cadenas.dameSignalsEntradasEngine(i);
			int j = 0;
			for (String puerto_ER_in : puertos_ER_in){
				if (puerto_ER_in.length() != 0) line += "i_" + puerto_ER_in + ": IN std_logic; ";
				j++;
			}
			//if (puertos_ER_in.length() != 0) line += puertos_ER_in + ": IN std_logic; ";
			
			puertos_ERs_out = cadenas.dameSignalsSalidaEngine(i);
			j = 0;
			for (String puerto_ER_out : puertos_ERs_out){
				if (puerto_ER_out.length() != 0) line += "o_subExp" + j + ": OUT std_logic; ";
				j++;
			}
			
			line+="output: OUT std_logic);";
			code.add(line);
			
			line = "END COMPONENT;";
			code.add(line);
		}
		
		//Generamos las señales necesarias para los engines
		for (int i=0; i<engines; i++){
			line = "SIGNAL s"+i+": std_logic;";
			code.add(line);
			
			puertos_ERs_out = cadenas.dameSignalsSalidaEngine(i);
			for (String puerto_ER_out : puertos_ERs_out){
				if (puerto_ER_out.length() != 0) {
					line = "SIGNAL subExpE"+i+puerto_ER_out+": std_logic;";
					code.add(line);
				}
			}
		}
		
		leaveEmptyLine();
		line = "BEGIN";
		code.add(line);
		//Generamos los port-maps para cada engine
		for (int i=0; i<engines; i++){
			line = "e"+i+": engine"+i+" PORT MAP(clock, charIn, ";
			
			//La entrada correspondiente a la subexpresion que use si existe
			puertos_ER_in = cadenas.dameSignalsEntradasEngine(i);
			for (String puerto_ER_in : puertos_ER_in) 
				if (puerto_ER_in.length() != 0) line += puerto_ER_in+", ";
			//if (puertos_ER_in.length() != 0) line += puertos_ER_in+", ";
			
			//Las señales correspondientes las salidas de sus subexpresiones si existen
			puertos_ERs_out = cadenas.dameSignalsSalidaEngine(i);
			for (String puerto_ER_out : puertos_ERs_out) 
				if (puerto_ER_out.length() != 0) line += "subExpE"+i+puerto_ER_out+", ";
			
			line+="s"+i+");";
			code.add(line);
		}
		
		leaveEmptyLine();
		line = "PROCESS(";
		for (int i=0; i<engines; i++){
			if(i<engines-1){
				line = line+"s"+i+", ";
			}else{
				line = line+"s"+i+")";
			}
		}
		
		//SALIDA 0
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "output1 <= ";
		for (int i=0; i<numERS1; i++){
			if(i<numERS1-1){
				line = line+"s"+i+" OR ";
			}else{
				line = line+"s"+i+";";
			}
		}
		code.add(line);
		
		//SALIDA 1
		line = "output2 <= ";
		for (int i=numERS1; i<numERS1+numERS2; i++){
			if(i<(numERS1+numERS2)-1){
				line = line+"s"+i+" OR ";
			}else{
				line = line+"s"+i+";";
			}
		}
		code.add(line);
		
		line = "END PROCESS;";
		code.add(line);
		line = "END structuralRegExpMatching;";
		code.add(line);
		
	}
	
	
	public boolean isOperation(char c){
		boolean output = false;
		if(c=='*' || c=='|' || c=='+' || c=='·'){
			output = true;
		}
		return output;
	}
	
	
	public void engineDescription(int id, String erp){
		leaveEmptyLine();
		String line = "";
		initializeEngineCode("engine"+id, "structuralEngine",id);
		
		int long_sub_cadena = cadenas.dameLongSubEREngine(id);
		
		/**
		 * TODO : Ojo revisar no se repita varias veces en la misma cadena
		 */
		int posInicioSubCad = erp.indexOf(cadenas.dameSubERSFormaPostfija().get(id));
		
		//Creación de las señales para unir los bloques básicos
		for (int j=0; j<erp.length()-1;j++){
			//for (int j=0; j<numberOfChar(erp);j++){
			//esta versión del bucle se utilizaría cuando sólo se generase un bloque para cada
			//signo distinto
			//Señales para bloque básico
			if ((long_sub_cadena == 0) || (j < posInicioSubCad || j > (posInicioSubCad + long_sub_cadena - 1))){
				//Estamos en la parte de la ER no reutilizada
				
				if (!isOperation(erp.charAt(j))){
					generateSignal("id"+j+"_i", "std_logic", 0);
					generateSignal("id"+j+"_i1", "std_logic", 0);
					generateSignal("id"+j+"_o", "std_logic", 0);
					generateSignal("id"+j+"_o1", "std_logic", 0);

					//Señales para los bloques de los operadores binarios (AND y OR)
				}else if(erp.charAt(j) == '·' || erp.charAt(j) == '|'){
					generateSignal("id"+j+"_i", "std_logic", 0);
					generateSignal("id"+j+"_i1", "std_logic", 0);
					generateSignal("id"+j+"_i2", "std_logic", 0);
					generateSignal("id"+j+"_o", "std_logic", 0);
					generateSignal("id"+j+"_o1", "std_logic", 0);
					generateSignal("id"+j+"_o2", "std_logic", 0);
					//Señales para el operador unario (*)					
				}else{
					generateSignal("id"+j+"_i", "std_logic", 0);
					generateSignal("id"+j+"_i1", "std_logic", 0);
					generateSignal("id"+j+"_o", "std_logic", 0);
					generateSignal("id"+j+"_o1", "std_logic", 0);
				}
			}
		}
//		charInDeclaration();
		leaveEmptyLine();
	
		line = "BEGIN";
		code.add(line);
		
		int aux;
		int numSubERSReutilizadas = 0;//Para saber qué subER sacar de la lista, ya que están almacenadas en orden de aparicion
		Stack<Integer> s = new Stack<Integer>();
		//Length-1 porque no se tiene en cuenta el ; 
		for(int j=0; j<erp.length()-1; j++){
			if ((long_sub_cadena == 0) || (j < posInicioSubCad || j > (posInicioSubCad + long_sub_cadena - 1))){
				if(!isOperation(erp.charAt(j))){
					generateBB(j, toBinary((int)erp.charAt(j)));
					s.push(j);
					System.out.println("BB  con id " + j + " para " + erp.charAt(j));
				}else if(erp.charAt(j)=='·'){
					generateAndBlock(j);
					
					aux=s.pop();
					route2(j, aux);
					
					if ((long_sub_cadena > 0) && 
							(
							 ((j == posInicioSubCad + long_sub_cadena+1) && (!isOperation(erp.charAt(j-1)))) 
							 || 
							 ((j == posInicioSubCad + long_sub_cadena+2) && (erp.charAt(j-1)=='*'))
							)){
						/**
						 * Conectamos el modulo con el puerto de entrada:
						 * Comparamos con el simbolo anterior a la '.' 
						 * 	-> Comprobamos que si tenemos un caracter antes, entonces estamos reutilizando un subExp
						 *     por tanto debemos sumar 1 a la comparacion con j, para tener en cuenta que acabamos de 
						 *     meter y sacar ese caracter de la pila
						 *     
						 *  -> Sino, comprobamos que el simbolo anterior es un '*'.+2 (símbolo + *)
						 */
						route1Port(j, "i_" + cadenas.dameSignalsEntradasEngine(id).get(numSubERSReutilizadas));
						numSubERSReutilizadas++;
					}else{
						aux=s.pop();
						route1(j, aux);					
					}
					
					s.push(j);
					System.out.println("AND con id "+j);
				}else if(erp.charAt(j)=='|'){
					generateOrBlock(j);
					aux=s.pop();
					route2(j, aux);
					
					if ((long_sub_cadena > 0) && (j == posInicioSubCad + long_sub_cadena)){
						/**
						 * Conectamos el modulo con el puerto de entrada
						 * Para la '|' no necesitamos mirar el/los símbolo/s anterior/es
						 */
						route1Port(j, "i_" + cadenas.dameSignalsEntradasEngine(id).get(numSubERSReutilizadas));
						numSubERSReutilizadas++;	
					}else{
						aux=s.pop();
						route1(j, aux);
					}
					
					s.push(j);
					System.out.println("OR  con id "+j);
				}else if(erp.charAt(j)=='*'){
					generateStarBlock(j);
					aux=s.pop();
					route1(j, aux);
					s.push(j);
					System.out.println("STAR con id "+j);
				}
			}
		}

		leaveEmptyLine();
		
		if (erp.length()-1 > long_sub_cadena)
			lastModuleConnections(erp.length()-2);
		else{
			//Toda la ER entera es una subcadena, por lo que no hemos generado bloques 
			line = "output <= i_" + cadenas.dameSignalsEntradasEngine(id).get(numSubERSReutilizadas) +";";
			code.add(line);
		}
			
		leaveEmptyLine();
		
		// Conectamos la salida de las subexpresiones en caso de existir
		int i = 0;
		for (String signal : cadenas.dameSignalsSalidaEngine(id)){
			line = "o_subExp" + i +" <= " + signal+";";
			code.add(line);
			i++;
		}
		leaveEmptyLine();
		
		finishEngineCode("structuralEngine");
		System.out.println();
	}
	
	public void generateBenchmarkRegExp(String input, int initialDelay, int delay){
		leaveEmptyLine();
		importLibraries();
		leaveEmptyLine();
		String line = "ENTITY benchmarkRegExp IS";
		code.add(line);
		line = "PORT(clk: IN std_logic; output: OUT std_logic);";
		code.add(line);
		line = "END benchmarkRegExp;";
		code.add(line);
		leaveEmptyLine();
		line = "ARCHITECTURE structuralBenchmarkRegExp OF benchmarkRegExp IS";
		code.add(line);
		leaveEmptyLine();
		line = "SIGNAL charIn: std_logic_vector(7 downto 0);";
		code.add(line);
		leaveEmptyLine();
		line = "COMPONENT regExpMatching PORT(clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output: OUT std_logic);";
		code.add(line);
		line = "END COMPONENT;";
		code.add(line);
		leaveEmptyLine();
		line = "BEGIN";
		code.add(line);
		line = "rem_0:regExpMatching PORT MAP (clk, charIn, output);";
		code.add(line);
		inputTest(input, initialDelay, delay);
		line = "END structuralBenchmarkRegExp;";
		code.add(line);
		
	}

		
	public void inputTest(String s, int initialDelay, int delay){
		leaveEmptyLine();
		String line = "";
		line = "PROCESS";
		code.add(line);
		line = "BEGIN";
		code.add(line);
		line = "WAIT FOR "+initialDelay+"ns;";
		//code.add(line);
		//line = "WAIT FOR "+delay+"ns;";
		code.add(line);
		line = "INPUT_LOOP: LOOP";
		code.add(line);
		for(int i=0; i<s.length(); i++){
			line = "charIn <= \""+toBinary((int)s.charAt(i))+"\";";
			code.add(line);
			line = "WAIT FOR "+delay+"ns;";
			code.add(line);
		}
		line = "END LOOP INPUT_LOOP;";
		code.add(line);
		line = "END PROCESS;";
		code.add(line);
		leaveEmptyLine();
		
	}
	
	
	public static void generaFicheroPrincipalFPGA(String cadenaEntrada) throws Exception {
		int longitudCadena = cadenaEntrada.length();
		int tamContador = Integer.toBinaryString(longitudCadena).length();
		
		FileHandler fh = new FileHandler("reconocedorERS_FPGA");
		ArrayList<String> codigo = new ArrayList<String>();
		codigo.add("library IEEE;");
		codigo.add("use IEEE.std_logic_1164.all;");
		codigo.add("use IEEE.std_logic_unsigned.all;");
		codigo.add("use ieee.std_logic_arith.all;");
		codigo.add("");
		codigo.add("entity reconocedorERS_FPGA is");
		codigo.add("	port(	");
		codigo.add("		clk: in std_logic;");
		codigo.add("		reset: in std_logic;");
		codigo.add("		output1: OUT std_logic; ");
		codigo.add("		output2: OUT std_logic);");
		codigo.add("end reconocedorERS_FPGA;");
		codigo.add("");
		codigo.add("architecture reconocedorERS_FPGA_arch of reconocedorERS_FPGA is");
		codigo.add("component regExpMatching is");
		codigo.add("	PORT(");
		codigo.add("		clock: IN std_logic; ");
		codigo.add("		charIn: IN std_logic_vector(7 downto 0); ");
		codigo.add("		output1: OUT std_logic; ");
		codigo.add("		output2: OUT std_logic);");
		codigo.add("end component;");
		codigo.add("");
		codigo.add("component divisor is");
		codigo.add("	PORT(");
		codigo.add("		clk: IN std_logic; ");
		codigo.add("		q: OUT std_logic_vector(23 downto 0));");
		codigo.add("end component;");
		codigo.add("");
		codigo.add("signal salida1: STD_LOGIC;");
		codigo.add("signal salida2: STD_LOGIC;");
		codigo.add("signal caracter: STD_LOGIC_VECTOR(7 downto 0);");
		codigo.add("signal indice: STD_LOGIC_VECTOR(" + (tamContador-1) + " downto 0);");
		codigo.add("type string_type is array (0 to " + (longitudCadena-1) + ") of CHARACTER;");
		codigo.add("constant cadena_entrada : string_type :=(" + '"' + cadenaEntrada + '"' + ");");
		codigo.add("");
		codigo.add("signal charaux: CHARACTER;");
		codigo.add("signal clkAux: std_logic_vector(23 downto 0);");
		codigo.add("signal clkDiv: std_logic;");
		codigo.add("");
		codigo.add("begin");
		codigo.add("");
		codigo.add("process(indice,charaux)");
		codigo.add("begin");
		codigo.add("	charaux <= cadena_entrada(conv_integer(indice));");
		codigo.add("	caracter <= CONV_STD_LOGIC_VECTOR(character'pos(charaux),8);");
		codigo.add("end process;");
		codigo.add("");
		codigo.add("contador: process (clkDiv,reset)");
		codigo.add("begin");
		codigo.add("	if (reset = '1') then");
		codigo.add("		indice <= (others => '0');");
		codigo.add("	elsif clkDiv'event and clkDiv='1' then ");
		codigo.add("		if indice = " + (longitudCadena-1) + " then");
		codigo.add("			indice <= (others => '0');");
		codigo.add("		else");
		codigo.add("			indice <= indice + 1;");
		codigo.add("		end if;");
		codigo.add("	end if;");
		codigo.add("end process;");
		codigo.add("");
		codigo.add("div: divisor port map (clk, clkAux);");
		codigo.add("reconocedor: regExpMatching port map (clkDiv, caracter, salida1, salida2);");
		codigo.add("clkDiv <= clkAux(23);");
		codigo.add("output1 <= salida1;");
		codigo.add("output2 <= salida2;");
		codigo.add("");
		codigo.add("end reconocedorERS_FPGA_arch;");
		
		fh.writeVHDFile(codigo);
	}

	
	public static void generaFicheroPrincipal(String cadenaEntrada) throws Exception {
		int longitudCadena = cadenaEntrada.length();
		int tamContador = Integer.toBinaryString(longitudCadena).length();
		
		FileHandler fh = new FileHandler("reconocedorERS");
		ArrayList<String> codigo = new ArrayList<String>();
		codigo.add("library IEEE;");
		codigo.add("use IEEE.std_logic_1164.all;");
		codigo.add("use IEEE.std_logic_unsigned.all;");
		codigo.add("use ieee.std_logic_arith.all;");
		codigo.add("");
		codigo.add("entity reconocedorERS is");
		codigo.add("	port(	");
		codigo.add("		clk: in std_logic;");
		codigo.add("		reset: in std_logic;");
		codigo.add("		output1: OUT std_logic; ");
		codigo.add("		output2: OUT std_logic);");
		codigo.add("end reconocedorERS;");
		codigo.add("");
		codigo.add("architecture reconocedorERS_arch of reconocedorERS is");
		codigo.add("component regExpMatching is");
		codigo.add("	PORT(");
		codigo.add("		clock: IN std_logic; ");
		codigo.add("		charIn: IN std_logic_vector(7 downto 0); ");
		codigo.add("		output1: OUT std_logic; ");
		codigo.add("		output2: OUT std_logic);");
		codigo.add("end component;");
		codigo.add("");
		codigo.add("signal salida1: STD_LOGIC;");
		codigo.add("signal salida2: STD_LOGIC;");
		codigo.add("signal caracter: STD_LOGIC_VECTOR(7 downto 0);");
		codigo.add("signal indice: STD_LOGIC_VECTOR(" + (tamContador-1) + " downto 0);");
		codigo.add("type string_type is array (0 to " + (longitudCadena-1) + ") of CHARACTER;");
		codigo.add("constant cadena_entrada : string_type :=(" + '"' + cadenaEntrada + '"' + ");");
		codigo.add("");
		codigo.add("signal charaux: CHARACTER;");
		codigo.add("");
		codigo.add("begin");
		codigo.add("");
		codigo.add("process(indice,charaux)");
		codigo.add("begin");
		codigo.add("	charaux <= cadena_entrada(conv_integer(indice));");
		codigo.add("	caracter <= CONV_STD_LOGIC_VECTOR(character'pos(charaux),8);");
		codigo.add("end process;");
		codigo.add("");
		codigo.add("contador: process (clk,reset)");
		codigo.add("begin");
		codigo.add("	if (reset = '1') then");
		codigo.add("		indice <= (others => '0');");
		codigo.add("	elsif clk'event and clk='1' then ");
		codigo.add("		if indice = " + (longitudCadena-1) + " then");
		codigo.add("			indice <= (others => '0');");
		codigo.add("		else");
		codigo.add("			indice <= indice + 1;");
		codigo.add("		end if;");
		codigo.add("	end if;");
		codigo.add("end process;");
		codigo.add("");
		codigo.add("reconocedor: regExpMatching port map (clk, caracter, salida1, salida2);");
		codigo.add("output1 <= salida1;");
		codigo.add("output2 <= salida2;");
		codigo.add("");
		codigo.add("end reconocedorERS_arch;");
		
		fh.writeVHDFile(codigo);
	}
}
