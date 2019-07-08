package options;

import javax.xml.bind.DatatypeConverter;

public class Content implements Options {
	private String contenido;

	public Content() {}

	public Content(String c) {
		String[] element = c.split("\"");
		int i;
		if(element.length ==1){//para evitar el !, que no es aceptado por regex
			i = 0;
		}
		else {
			i = 1;
		}
		int ini = 0;
		int anterior = 0;
		int aux = 0;
		boolean first = false;
		String result="";
		boolean nunca = true;
		while(aux < element[i].length()) {//Por si es en hexadecimal
			if(element[i].charAt(aux)=='|' & !first) {
				first = true;
				nunca = false;
				result += element[i].substring(anterior, aux);
				ini = aux+1;
			}
			else if(element[i].charAt(aux)=='|'){
				String hex = element[i].substring(ini,aux).trim();
				hex = hex.replaceAll("\\s+","");
				if(hex.contains("0A") | hex.contains("0D") | hex.contains("3B")) {
					hex =hex.replaceAll("0A", "");
					hex =hex.replaceAll("0D", "");
					hex =hex.replaceAll("3B", "");
				}
				byte[] s = DatatypeConverter.parseHexBinary(hex);
				result+= new String(s);
				anterior = aux+1;
				first = false;
			}
			aux++;
		}
		if(aux != anterior)
			result += element[i].substring(anterior, aux);
		if(!nunca) {
			this.contenido= result;

		}
		else {
			this.contenido = element[i];
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

	@Override
	public String getString() {
		// TODO Auto-generated method stub
		return "Content: "+this.contenido;
	}
}
