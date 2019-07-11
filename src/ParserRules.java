import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import options.Content;
import options.Depth;
import options.Offset;
import options.Options;
import options.Protocol;

public class ParserRules {
	private final static Options[] options = {
			new Content(), new Offset(), new Depth()};

	/**
	 * Parser de bytecodes
	 * @param line Array de string (split por espacio)
	 * @return Un Bytecode si la entrada de datos es correcta y corresponde con alguno de los predefinidos
	 */
	public static Options parse(String line)
	{
		Options devolver = null;
		int i = 0;
		int j = 0;
		boolean found =false;
		line = line.trim();
		while(j < line.length() & !found) {
			if(line.charAt(j) == ':')
				found = true;
			else
				j++;
		}
		ArrayList<String> opciones = new ArrayList<String>();
		if(found) {
			opciones.add(line.substring(0, j));
			opciones.add(line.substring(j+1));
		}
		else {
			opciones.add(line);
		}
		
		String[] lineOptionsParsed = opciones.toArray(new String[0]);
		while(i < options.length && devolver == null)
		{
			devolver = options[i].parse(lineOptionsParsed);
			i++;
		}
		return devolver; 
	}

}

//content : "jfjfjjf", within:20, nocase
//content "jejejejej"-within 20 
