import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Content.Content;
import Content.Options;

public class ParserRules {
	private final static Options[] options = {
			new Content()};
		
		/**
		 * Parser de bytecodes
		 * @param line Array de string (split por espacio)
		 * @return Un Bytecode si la entrada de datos es correcta y corresponde con alguno de los predefinidos
		 */
		public static Options parse(String line)
	    {
			Options devolver = null;
	        int i = 0;
	        line = line.trim();
	        List<String> opciones = new ArrayList<String>();
			String[] lineParsed = line.split(":");
			opciones.addAll(Arrays.asList(lineParsed[0].split(":")));
			if(lineParsed.length==2)
			opciones.addAll(Arrays.asList(lineParsed[1].split(",")));
			if(lineParsed.length==3)
			opciones.addAll(Arrays.asList(lineParsed[2]));
			String[] lineOptionsParsed = opciones.toArray(new String[0]);
	        while(i < options.length && devolver == null)
	        {
	        	devolver = options[i].parse(lineOptionsParsed);
	       		i++;
	        }
	       return devolver; 
		}

}
