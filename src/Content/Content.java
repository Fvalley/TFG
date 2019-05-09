package Content;

import javax.xml.bind.DatatypeConverter;

public class Content implements Options {
	private String contenido;

	public Content() {}

	public Content(String c) {
		String[] element = c.split("\"");
		if(element.length ==1){//para evitar el !, que noe s aceptado por regex

			if(element[0].startsWith("|") | element[0].endsWith("|")) {//Por si es en hexadecimal
				String aux = element[0].substring(1,element[0].length()-2).trim();
				byte[] s = DatatypeConverter.parseHexBinary(aux);
				this.contenido= new String(s);

			}
			else {
				this.contenido = element[0];
			}
		}
		else {
			this.contenido = element[1];
		}
	}
	public void mostrar() {
		System.out.println(this.contenido);
	}

	public String getRegex() {
		return this.contenido;
		/*if(this.nocaseado) {
			String aux2 = this.contenido.toUpperCase();
			String[] aux=	aux2.split("");
			String fin = "";
			for(int i=0; i < aux.length; i++)
				fin += "("+aux[i]+"|"+aux[i].toLowerCase()+")";

			return fin;
			//return "^((?!"+this.contenido+").)*$";
		}
		else	*/		

	}

	@Override
	public Options parse(String[] line) {
		if(line.length !=2)
			return null;
		else
			if(line[0].equalsIgnoreCase("CONTENT"))
				return new Content(line[1]);
			else
				return null;
	}

	@Override
	public String cutPackage(String paquete) {
		// TODO Auto-generated method stub
		return null;
	}
}
