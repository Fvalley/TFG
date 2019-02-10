package RulesHeaders;

public class Protolo {
	private String tipo;
	public Protolo(String t) {
		this.tipo = t;
	}
	
	public Protolo parse(String line) {
		line = line.trim();
		line = line.toLowerCase();
		String[] s = line.split(" ");
		if (s[0].equalsIgnoreCase("TCP"))
			return new Protolo(s[0]);
		else if (s[0].equalsIgnoreCase("UDP"))
			return new Protolo(s[0]);
		else if (s[0].equalsIgnoreCase("ICMP"))
			return new Protolo(s[0]);
		else if (s[0].equalsIgnoreCase("IP"))
			return new Protolo(s[0]);
		else
			return null;
	}
	
	public String get() {
		return this.tipo;
	}
}
