package Content;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Content {
	private String contenido;
	private boolean negado;
	public Content() {}

	public Content(String c) {
		String[] element = c.split("\"");
		if(element.length ==1){
			this.negado = false;
			this.contenido = element[0];
		}
		else {
			this.negado = true;
			this.contenido = element[1];
		}
	}
	public void mostrar() {
		System.out.println(this.contenido);
		System.out.println(this.negado);
	}

	public String getRegex() {
		// TODO Auto-generated method stub
		if(this.negado)
			return "^((?!"+this.contenido+").)*$";
		else			
			return ".*(?="+this.contenido+").*";
	}
}
