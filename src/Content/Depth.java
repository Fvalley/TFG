package Content;

public class Depth implements Options {

	private int number;
	public Depth(String string) {
		// TODO Auto-generated constructor stub
		this.number= Integer.parseInt(string);
	}

	public Depth() {
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
		return "";
	}

	@Override
	public Options parse(String[] line) {
		// TODO Auto-generated method stub
		if(line.length !=2)
			return null;
		else
			if(line[0].equalsIgnoreCase("DEPTH"))
				return new Depth(line[1]);
			else
				return null;

	}

	@Override
	public String cutPackage(String paquete) {
		// TODO Auto-generated method stub
		return paquete.substring(0, (this.number*2)-1);
	}

}
