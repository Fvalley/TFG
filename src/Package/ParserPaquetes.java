package Package;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import options.Options;

public class ParserPaquetes extends Thread{
	private List<List<Options>> options;
	public ParserPaquetes(List<List<Options>> opciones) {
		this.options= opciones;
	}
	public void run() {
		List<String> paquetes;
		try {
			paquetes = parseoPaquetes("paquetes.txt");

			File archivoPackage = new File("logPackage.txt");
			BufferedWriter buffer = new BufferedWriter(new FileWriter(archivoPackage));
			for(int i = 0; i < paquetes.size();i++) {
				for(int j=0;j<this.options.size();j++) {
					String aux = paquetes.get(i);	
					buffer.write(aux+"\n");
					for(int z = 0; z < this.options.get(j).size();z++) {
						String recorte = this.options.get(j).get(z).cutPackage(aux);
						if(recorte!= null) {
							buffer.write(recorte+"\n;\n");
						}
					}
				}
			}
			buffer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static List<String> parseoPaquetes(String string) throws IOException {

		File archivo = null;
		archivo = new File (string);
		FileReader fileread = new FileReader(archivo);
		BufferedReader buffer = new BufferedReader(fileread);
		String line = buffer.readLine();
		List<String> salida = new ArrayList<String>();
		int i = 0;
		String aux = "";
		while(line!=null & i < 5000) {
			aux="";
			while(!line.matches(";")) {
				line = line.trim();
				aux+= line.replace(" ", "");
				line = buffer.readLine();
			}
			salida.add(aux);
			i++;
			line = buffer.readLine();
		}
		buffer.close();
		return salida;
	}
}
