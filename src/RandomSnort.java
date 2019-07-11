import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class RandomSnort {
	private static int longmax = 10;
	private static int longmin = 4;
	static void generarRandom(int numeroReglas) throws IOException {
		
		File archivo = new File ("pruebaRandom"+numeroReglas+".txt");
		BufferedWriter buffer = new BufferedWriter(new FileWriter(archivo));
	    Random random = new Random();
	    for(int i = 0; i < numeroReglas; i++)
	    {
	        char[] word = new char[random.nextInt(longmax-longmin+1)+longmin]; 
	        for(int j = 0; j < word.length; j++)
	        {
	            word[j] = (char)('a' + random.nextInt(26));
	        }
	        String palabra = new String(word);
	        buffer.write("alert tcp any any -> any any(content:\""+palabra+"\";)\n");
	    }
	    buffer.close();
	}
}
