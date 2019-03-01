import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Content.Content;

public class Main {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		Content cont = new Content();
		List<String> lista = new ArrayList<String>();
		lista = parseo("prueba.txt");
		for(int i = 0; i < lista.size();i++) {
			System.out.println(lista.get(i).trim());

		}
		controlContent(lista, cont);
		Parser p = new Parser("Regular Expressions\\REFile", "VHDLFile");
		p.process("PRUEBA10", "PRUEBA11" );

		String cadena_entrada = "--aabd-GET-ddhjsddjk";
		VHDLGenerator.generaFicheroPrincipalFPGA(cadena_entrada);
		VHDLGenerator.generaFicheroPrincipal(cadena_entrada);
		//"--aabd--jk--bb--aacc--bba--ccbbapk--ftp://--pepemartin--bb--ccca--ba--aa--abc--abcd--ftp--aaa--bb--http://bbwww.bbacjwdftpcjwd--vlc--be@ericsson.com--"
	}
	public static List<String> parseo(String nombre) throws IOException {
		File archivo = null;
		archivo = new File (nombre);
		FileReader fileread = new FileReader(archivo);
		BufferedReader buffer = new BufferedReader(fileread);
		String line = buffer.readLine();
		line = line.trim();
		//line = line.toLowerCase();
		List<String> sal = new ArrayList<String>();
		String[] salida = line.split("\\(");
		sal.addAll(Arrays.asList(salida[0].split(" ")));
		sal.addAll(Arrays.asList(salida[1].split(";")));
		sal.remove(sal.size()-1);
		buffer.close();
		return sal;
	}

	public static void controlContent(List<String> lista, Content cont) {
		int contador=0,contador2 = 0;
		String [] aux, res= new String[100];
		while(contador < lista.size()) {
			aux = lista.get(contador).split(":");
			if(aux[0].equalsIgnoreCase("CONTENT")) {
				cont = new Content(aux[1]);
				cont.mostrar();
				res[contador2] = cont.getRegex();
				System.out.println(res[contador2]);
				contador2++;
				
			}
			contador++;
		}
		
	}
}
