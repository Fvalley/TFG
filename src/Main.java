import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Content.Options;

public class Main {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		List<List<String>> lista = new ArrayList<List<String>>();
		lista = parseo("prueba.txt");
		String[] paquetes = parseoPaquetes("paquetes.txt");
		for(int i = 0; i < lista.size();i++) {
			for(int j = 0; j < lista.get(i).size();j++) {
				System.out.println(lista.get(i).get(j).trim());
			}
		}
		List<List<Options>>listadelistadeopciones = new ArrayList<List<Options>>();
		for(int i = 0; i < lista.size();i++) {
			listadelistadeopciones.add(controlContent(lista.get(i)));
		}
		File archivoPackage = new File("logPackage.txt");
		BufferedWriter buffer = new BufferedWriter(new FileWriter(archivoPackage));
		for(int i = 0; i < paquetes.length;i++) {
			for(int j=0;j<listadelistadeopciones.size();j++) {
				String aux = paquetes[i];	
				buffer.write(aux+"\n");
				for(int z = 0; z < listadelistadeopciones.get(j).size();z++) {
					String recorte = listadelistadeopciones.get(j).get(z).cutPackage(aux);
					if(recorte!= null) {
						buffer.write(recorte+"\n");
					}
				}
			}
		}
		buffer.close();
		File archivoRegex = new File ("logRegex.txt");
		buffer = new BufferedWriter(new FileWriter(archivoRegex));
		String Regex = "PRUEBA1 ";
		for(int i = 0; i < listadelistadeopciones.size();i++) {
			for(int j = 0; j < listadelistadeopciones.get(i).size();j++) {
				Regex += listadelistadeopciones.get(i).get(j).getRegex();
				Regex +=";";
			}
		}
		buffer.write(Regex);
		buffer.close();

		Parser p = new Parser("logRegex", "VHDLFile");
		p.process("PRUEBA1","PRUEBA1" );

		String cadena_entrada = "--aabd-GET-ddhjsddjk";
		VHDLGenerator.generaFicheroPrincipalFPGA(cadena_entrada);
		VHDLGenerator.generaFicheroPrincipal(cadena_entrada);
		//"--aabd--jk--bb--aacc--bba--ccbbapk--ftp://--pepemartin--bb--ccca--ba--aa--abc--abcd--ftp--aaa--bb--http://bbwww.bbacjwdftpcjwd--vlc--be@ericsson.com--"
	}
	private static String[] parseoPaquetes(String string) throws IOException {

		File archivo = null;
		archivo = new File (string);
		FileReader fileread = new FileReader(archivo);
		BufferedReader buffer = new BufferedReader(fileread);
		String line = buffer.readLine();
		line = line.trim();
		String[] salida = line.split(";");

		buffer.close();
		return salida;
	}
	public static List<List<String>> parseo(String nombre) throws IOException {
		List<List<String>> finalParse = new ArrayList<List<String>>();
		File archivo = null;
		archivo = new File (nombre);
		FileReader fileread = new FileReader(archivo);
		BufferedReader buffer = new BufferedReader(fileread);
		String line = buffer.readLine();
		while(line!= null) {
			line = line.trim();
			List<String> sal = new ArrayList<String>();
			String[] salida = line.split("\\(");
			sal.addAll(Arrays.asList(salida[0].split(" ")));
			sal.addAll(Arrays.asList(salida[1].split(";")));
			sal.remove(sal.size()-1);
			finalParse.add(sal);
			line = buffer.readLine();
		}
		buffer.close();
		return finalParse;
	}
	public static List<Options> controlContent(List<String> lista) {
		int contador=0;
		String[] aux = lista.toArray(new String[0]);
		List<Options> listaOpciones = new ArrayList<Options>();
		Options option = null;
		while(contador < aux.length) {
			option = ParserRules.parse(aux[contador]);//le pasa las partes de la regla snort
			contador++;
			if(option!=null)
				listaOpciones.add(option);
		}
		return listaOpciones;
	}

}
