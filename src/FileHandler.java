import java.io.*;
import java.util.ArrayList;

public class FileHandler {
	
	private String VHDLFile;
	private String REFile;
	private File outputFile;
	private BufferedWriter bw;
	
	
	public FileHandler(String ref, String vhdlf) throws IOException{
		VHDLFile = vhdlf;
		REFile = ref;
		outputFile = new File(VHDLFile+".vhd");//es el archivo en el que va a escribir la variable nombre
		bw = new BufferedWriter(new FileWriter(outputFile));
		
	}
	
	public FileHandler(String vhdlf) throws IOException{
		VHDLFile = vhdlf;
		outputFile = new File(VHDLFile+".vhd");//es el archivo en el que va a escribir la variable nombre
		bw = new BufferedWriter(new FileWriter(outputFile));
		
	}
	
	public void writeVHDFile(ArrayList<String> code)throws Exception{
		for (int i=0; i< code.size();i++){
			bw.write(code.get(i)+"\n");
		}
		bw.close();//importante , no dejarse abierto canales
	}

	public String readREFile()throws Exception{

		File archivo = null;

		archivo = new File (REFile+".txt");
		String line, text;
		text = new String();
		FileReader fr = new FileReader (archivo);
		BufferedReader br = new BufferedReader(fr);
		while((line=br.readLine())!=null) {
			text += line;
			
		}
		fr.close();
		return text;
	}
	
	public String getREClass(String REClass)throws Exception{
		File archivo = null;
		boolean found=false;
		archivo = new File (REFile+".txt");
		String str= new String();
		FileReader fr = new FileReader (archivo);
		BufferedReader br = new BufferedReader(fr);
		String aux=br.readLine();
		while (!found && aux!=null){
			if(aux.contains(REClass)){
				for(int i=REClass.length()+1; i<aux.length(); i++){
					str = str+aux.charAt(i);
				}
				found=true;
			}
			aux = br.readLine();
		}
		
		
		fr.close();
		return str;
	
	}
	
}
