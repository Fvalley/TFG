package RulesHeaders;

public class Protocolo {
	public enum PTCL {IP,ICMP,UDP,TCP;
		public String toString() {
			switch(this) {
			case IP:
				return "IP;";
			case ICMP:
				return "ICMP;";
			case UDP:
				return "UDP;";
			case TCP:
				return "TCP;";
			default:
				return "ERROR;";
			}
		}};
	private PTCL tipo;
	public Protocolo(PTCL t) {
		this.tipo = t;
	}
	
	public Protocolo parse(String line) {
		line = line.trim();
		line = line.toLowerCase();
		String[] s = line.split(" ");
		if (s[0].equalsIgnoreCase("TCP"))
			return new Protocolo(PTCL.TCP);
		else if (s[0].equalsIgnoreCase("UDP"))
			return new Protocolo(PTCL.UDP);
		else if (s[0].equalsIgnoreCase("ICMP"))
			return new Protocolo(PTCL.ICMP);
		else if (s[0].equalsIgnoreCase("IP"))
			return new Protocolo(PTCL.IP);
		else
			return null;
	}
	
	public String get() {
		return this.tipo.toString();
	}
}
