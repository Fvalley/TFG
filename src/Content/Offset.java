package Content;

public class Offset implements Options {

	private int number;

	public Offset(String string) {
		// TODO Auto-generated constructor stub
		this.number= Integer.parseInt(string);
	}

	@Override
	public void mostrar() {
		// TODO Auto-generated method stub
		System.out.println(this.number);
	}

	@Override
	public String getRegex() {
		// TODO Auto-generated method stub
		return "";
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
		return paquete.substring((this.number*2)-1);
	}

}
