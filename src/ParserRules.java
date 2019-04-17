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
		public static Options parse(String []line)
	    {
			Options devolver = null;
	        int i = 0;
	        while(i < options.length && devolver == null)
	        {
	        	devolver = options[i].parse(line);
	       		i++;
	        }
	       return devolver; 
		}

}
