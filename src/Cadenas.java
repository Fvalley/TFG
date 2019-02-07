import java.util.ArrayList;
import java.util.HashMap;


/**
 * 
 * @author Claudio A. Mu�oz Fern�ndez
 * Clase que contiene las ERS y subERS en forma postfija,
 * adem�s de los nombres de los puertos/se�ales asociados 
 * a dichas expresiones
 *
 */
public class Cadenas {
	private ArrayList<String> cadenas; //En la posici�n i se encuentra la cadena asociada al engine i 
	private ArrayList<String> subcadenas;
	private HashMap<Integer,ArrayList<String>> nombresSignalsEntradas;
	private HashMap<Integer,ArrayList<String>> nombresSignalsSalidas; //Una lista de se�ales de salida para cada engine
	private int numEngines;
	
	public Cadenas(){
		cadenas = new ArrayList<String>();
		subcadenas = new ArrayList<String>();
		nombresSignalsEntradas = new HashMap<Integer,ArrayList<String>>();
		nombresSignalsSalidas = new HashMap<Integer,ArrayList<String>>();
		numEngines = 0;
	}

	
	/**
	 * Busca la subexpresion mas larga en todas las ERS existentes y genera los nombres de los 
	 * puertos de salida y de las se�ales de entrada de cada engine
	 * @param cadena
	 * @return 
	 */
	private String dameSubExpresion(String cadena) {
		int engineConSubcadena = 0;
		int i = 0;
		String subcad_mas_larga = new String();
		String subcad = new String();

		for (String cad : cadenas) {
			subcad = subExpresionMasLarga(cad,cadena);
			if (subcad.length() > subcad_mas_larga.length()){
				engineConSubcadena = i;
				subcad_mas_larga = subcad;
			}
			i++;
		}
		
		String signalEntrada = new String();
		
		if (subcad_mas_larga.length() != 0){
			int idBloqueConSubCad = (cadenas.get(engineConSubcadena).indexOf(subcad_mas_larga) + subcad_mas_larga.length()-1);
			//el id del bloque del que tomaremos la se�al de la subcadena m�s larga. Lo usaremos para saber de d�nde viene la subexpresi�n reutilizada
			
			System.out.println("Se ha reutilizado la subexpresi�n "+subcad_mas_larga+" del engine "+engineConSubcadena+" asociada al bloque id" + idBloqueConSubCad);//(subcad_mas_larga.length()-1));
			
			//Nombre se�al para el puerto entrada asociada al engine i 
			signalEntrada = "subExpE"+engineConSubcadena+"id"+idBloqueConSubCad+"_o";//(subcad_mas_larga.length()-1)+"_o";
			
			
			//Nombre se�al de salida asociada al engine i
			String signalSalida = "id"+idBloqueConSubCad+"_o";//(subcad_mas_larga.length()-1)+"_o";
			if (!nombresSignalsSalidas.get(engineConSubcadena).contains(signalSalida)){
				nombresSignalsSalidas.get(engineConSubcadena).add(signalSalida);
			}
		}
		else
			System.out.println("No se ha reutilizado ninguna subexpresi�n");
		
		if (!nombresSignalsSalidas.get(engineConSubcadena).contains(signalEntrada)){
			nombresSignalsEntradas.get(numEngines).add(signalEntrada);
		}
		System.out.println();
		numEngines++;
		
		return subcad_mas_larga;
	}


	/**
	 * Busca la subexpresion mas larga que tengan las dos cadenas en comun
	 * @param cad
	 * @param cadena
	 * @return
	 */
	private String subExpresionMasLarga(String cad1, String cad2) {
		/**
		 * 1� creamos ArrayList con todas las subexpresiones (reutilizar toPostFix?) de
		 * cad1 y de cad2 ordenadas convenientemente (�?)
		 * 
		 * Comprobamos para cada subexpresion de cad1 su presencia en el cjto de 
		 * subexpresiones de cad2 y cogemos la mayor
		 */
		
		String cad_mas_larga = new String();
		ArrayList<String> subexpresiones_cad1 = dameListaSubExpresiones(cad1,cad1.length()-1);
		ArrayList<String> subexpresiones_cad2 = dameListaSubExpresiones(cad2,cad2.length()-1);
		
		for (String cad : subexpresiones_cad1) {
			if (subexpresiones_cad2.contains(cad)){
				if (cad.length() > cad_mas_larga.length()) cad_mas_larga = cad; 
			}
		}
		return cad_mas_larga;
	}


	/**
	 * Devuelve la lista de subexpresiones presentes en la ER dada como parametro
	 * a partir de la posicion pos (recorrida de dcha a izda)
	 * @param cad1
	 * @param pos
	 * @return
	 */
	private ArrayList<String> dameListaSubExpresiones(String cad, int pos) {
		ArrayList<String> subcadenas = new ArrayList<String>();
		String subExp1;
		String subExp2;
		String erCompleta;
		ArrayList<String> listaSubExp1; //ERs del hijo izquierdo
		ArrayList<String> listaSubExp2; //ERs del hijo derecho
		
		char c = cad.charAt(pos);
		String s = new String();
		s+=c;
		
		switch (c){
		case '�':
			/**
			 * Metemos la ER completa, y luego las del hijo izquierdo. Las del hijo derecho no las
			 * a�adimos.
			 */
			
			listaSubExp2 = dameListaSubExpresiones(cad, pos-1); 
			subExp2 = listaSubExp2.get(0);
			listaSubExp1 = dameListaSubExpresiones(cad, pos-subExp2.length()-1);
			subExp1 = listaSubExp1.get(0);

			erCompleta = new String(subExp1);
			erCompleta+=listaSubExp2.get(0);
			erCompleta+=s;
			
			subcadenas.add(erCompleta);
			subcadenas.addAll(listaSubExp1);
		break;
		case '*':
			/**
			 * Metemos la ER completa, y luego todas las del hijo
			 */
			
			listaSubExp1 = dameListaSubExpresiones(cad, pos-1); 
			subExp1 = listaSubExp1.get(0);
			
			erCompleta = new String(subExp1);
			erCompleta+=s;
			
			subcadenas.add(erCompleta);
			subcadenas.addAll(listaSubExp1);
		break;
		case '|':
			/**
			 * Metemos la ER completa, y luego todas las subexpresiones, primero las del hijo 
			 * izquiero de la or y despu�s las del hijo derecho.
			 */
			
			listaSubExp2 = dameListaSubExpresiones(cad, pos-1); 
			subExp2 = listaSubExp2.get(0);
			listaSubExp1 = dameListaSubExpresiones(cad, pos-subExp2.length()-1);
			subExp1 = listaSubExp1.get(0);
			
			erCompleta = new String(subExp1);
			erCompleta+=listaSubExp2.get(0);
			erCompleta+=s;
			
			subcadenas.add(erCompleta);
			subcadenas.addAll(listaSubExp1);
			subcadenas.addAll(listaSubExp2);
		break;
		default:
			//Es un caracter, por tanto lo a�adimos
			subcadenas.add(s);
		}
		return subcadenas;
	}


	/**
	 * A�ade una nueva Expresi�n Regular en forma postfija al conjunto existente
	 * @param cadena
	 */
	public void addCadena(String cadena) {
		//Creamos la lista de se�ales de dependencias para el nuevo engine
		nombresSignalsSalidas.put(numEngines,new ArrayList<String>());
		nombresSignalsEntradas.put(numEngines,new ArrayList<String>());
		subcadenas.add(dameSubExpresion(cadena));
		cadenas.add(cadena);
	}

	/**
	 * Devuelve el nombre el puerto de entrada del que depende el engine dado
	 * como par�metro. En caso de no tener dependencias devolver� null
	 * @param i
	 * @return
	 */
	public ArrayList<String> dameSignalsEntradasEngine(int i) {
		return nombresSignalsEntradas.get(i);
	}

	/**
	 * Devuelve un ArrayList con los nombres de los puertos de salida, del engine 
	 * dado como par�metro, necesarios para otros engines. 
	 * En caso de no existir devolver� null
	 * @param i
	 * @return
	 */
	public ArrayList<String> dameSignalsSalidaEngine(int i) {
		return this.nombresSignalsSalidas.get(i);
	}
	
	/**
	 * Devuelve la longitud de la sub-expresi�n regular usada por el engine dado como 
	 * par�metro. �ste valor se usar� para saber a partir de qu� s�mbolo hay que empezar
	 * a generar m�dulos
	 * @param engine
	 * @return
	 */
	public int dameLongSubEREngine(int engine){
		return subcadenas.get(engine).length();
	}


	/**
	 * Devuelve la lista de cadenas en forma postfija
	 * @return
	 */
	public ArrayList<String> dameERSFormaPostfija() {
		return cadenas;
	}

	/**
	 * Devuelve la lista de cadenas en forma postfija
	 * @return
	 */
	public ArrayList<String> dameSubERSFormaPostfija() {
		return subcadenas;
	}
}
