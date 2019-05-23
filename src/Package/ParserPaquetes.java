package Package;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import options.Options;

public class ParserPaquetes extends Thread{
	private List<List<Options>> options;
	public ParserPaquetes(List<List<Options>> opciones) {
		this.options= opciones;
	}
	public void run() {
		String[] paquetes;
		try {
			paquetes = parseoPaquetes("paquetes.txt");

			File archivoPackage = new File("logPackage.txt");
			BufferedWriter buffer = new BufferedWriter(new FileWriter(archivoPackage));
			for(int i = 0; i < paquetes.length;i++) {
				for(int j=0;j<this.options.size();j++) {
					String aux = paquetes[i];	
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
}
