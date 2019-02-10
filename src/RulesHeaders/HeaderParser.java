package RulesHeaders;

public class HeaderParser {
	private final static Action[] actions = { new alert(), new log(),
			new pass() };
	
	public static Action parse(String line) {
		line = line.trim();
		line = line.toLowerCase();
		String[] s = line.split(" ");
		int i = 0;
		Action c = null;
		while (i < actions.length) {
			c = actions[i].parse(s);
			if (c != null)
				break;
			else
				i++;
		}
		return c;
	}
}
