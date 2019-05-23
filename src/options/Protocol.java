package options;
import javax.xml.bind.DatatypeConverter;

public class Protocol implements options.Options {

	private String tipo; 
	public Protocol(String upperCase) {
		// TODO Auto-generated constructor stub
		this.tipo = upperCase;
	}

	public Protocol() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void mostrar() {
		// TODO Auto-generated method stub
		System.out.println(this.tipo);
	}

	@Override
	public String getRegex() {
		// TODO Auto-generated method stub
		switch (this.tipo) {
		case "TCP":
			byte[] s = DatatypeConverter.parseHexBinary("06");
			return new String(s);
		case "ICMP":
			byte[] icmp = DatatypeConverter.parseHexBinary("01");
			return new String(icmp);
		case "IP":
			break;
		case "UDP":
			byte[] udp = DatatypeConverter.parseHexBinary("11");
			return new String(udp);
		default:
			return "";
		}
		return tipo;
	}

	@Override
	public Options parse(String[] line) {
		// TODO Auto-generated method stub
		if(line.length !=1)
			return null;
		else {
			String aux = line[0].toUpperCase();
			switch (aux) {
			case "TCP":
			case "ICMP":
			case "IP":
			case "UDP":
				return new Protocol(line[0].toUpperCase());
			default:
				return null;
			}

		}
	}

	@Override
	public String cutPackage(String paquete) {
		// TODO Auto-generated method stub
		switch (this.tipo) {
		case "TCP":
		case "ICMP":
		case "UDP":
			return paquete.substring(17,19);
		case "IP":
			break;
		default:
			return null;
		}
		return null;
	}

	@Override
	public String getString() {
		// TODO Auto-generated method stub
		return "Protocol: "+this.tipo;
	}

}
