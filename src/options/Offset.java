package options;

public class Offset implements Options {

	private int number;

	public Offset(String string) {
		// TODO Auto-generated constructor stub
		this.number= Integer.parseInt(string);
	}

	public Offset() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void mostrar() {
		// TODO Auto-generated method stub
		System.out.println(this.number);
	}

	@Override
	public String getRegex() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Options parse(String[] line) {
		// TODO Auto-generated method stub
		if(line.length !=2)
			return null;
		else
			if(line[0].equalsIgnoreCase("OFFSET"))
				return new Offset(line[1]);
			else
				return null;

	}

	
	@Override
	public String cutPackage(String paquete) {
		// TODO Auto-generated method stub
		if(this.number > 0)//por si en la regla pone offset 0, es decir que comience al principio
			return paquete.substring((this.number*2)-1);
		else 
			return null;
	}

	@Override
	public String getString() {
		// TODO Auto-generated method stub
		return "Offset: "+this.number;
	}

	@Override
	public boolean igual(Options option) {
		// TODO Auto-generated method stub
		if(this.getClass() == option.getClass()) {
			Offset aux = (Offset) option;
			return this.number == aux.number;
		}
		return false;	}

}
