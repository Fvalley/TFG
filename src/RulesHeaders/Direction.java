package RulesHeaders;

public class Direction {
	private int option;
	public Direction(int t) {
		this.option = t;
	}
	
	public Direction parse(String line) {
		line = line.trim();
		line = line.toLowerCase();
		String[] s = line.split(" ");
		if (s[0].equalsIgnoreCase("->"))
			return new Direction(0);
		else if (s[0].equalsIgnoreCase("<>"))
			return new Direction(1);
		else
			return null;
	}
	public int get() {
		return this.option;
	}
}
