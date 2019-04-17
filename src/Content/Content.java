package Content;

public class Content implements Options {
	private String contenido;
	private boolean nocaseado;
	
	public Content() {}

	public Content(String c) {
		String[] element = c.split("\"");
		if(element.length ==1){
			this.nocaseado = false;
			this.contenido = element[0];
		}
		else {
			this.nocaseado = true;
			this.contenido = element[1];
		}
	}
	public void mostrar() {
		System.out.println(this.contenido);
		System.out.println(this.nocaseado);
	}

	public String getRegex() {
		// TODO Auto-generated method stub
		if(this.nocaseado) {
			String aux2 = this.contenido.toUpperCase();
			String[] aux=	aux2.split("");
			String fin = "";
			for(int i=0; i < aux.length; i++)
				fin += "("+aux[i]+"|"+aux[i].toLowerCase()+")";
			fin+=";";
			return fin;
			//return "^((?!"+this.contenido+").)*$";
		}
		else			
			return this.contenido+";";
			//return ".*(?="+this.contenido+").*";
	}

	@Override
	public Options parse(String[] line) {
		// TODO Auto-generated method stub
		if(line.length !=2)
			return null;
		else
			if(line[0].equalsIgnoreCase("CONTENT"))
				return new Content(line[1]);
			else
				return null;
	}
}
