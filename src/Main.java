import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		List<String> lista = new ArrayList<String>();
		lista = parseo("prueba.txt");
		List<String> paquetes = parseoPaquetes("paquetes.txt");
		for(int i = 0; i < lista.size();i++) {
			System.out.println(lista.get(i).trim());
		}
		controlContent(lista);
		Parser p = new Parser("Regular Expressions\\REFile", "VHDLFile");
		p.process("PRUEBA10", "PRUEBA11" );

		String cadena_entrada = "--aabd-GET-ddhjsddjk";
		VHDLGenerator.generaFicheroPrincipalFPGA(cadena_entrada);
		VHDLGenerator.generaFicheroPrincipal(cadena_entrada);
		//"--aabd--jk--bb--aacc--bba--ccbbapk--ftp://--pepemartin--bb--ccca--ba--aa--abc--abcd--ftp--aaa--bb--http://bbwww.bbacjwdftpcjwd--vlc--be@ericsson.com--"
	}
	private static List<String> parseoPaquetes(String string) {
		// TODO Auto-generated method stub
		return null;
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

	public static void controlContent(List<String> lista) {
		int contador=0;
		String[] aux = lista.toArray(new String[0]);
		while(contador < aux.length) {
			ParserRules.parse(aux);
			contador++;
		}
		
	}
}
