package RulesHeaders;

public class alert implements Action{

	@Override
	public Action parse(String[] s) {
		if (s[0].equalsIgnoreCase("ALERT"))
			return new alert();
		else
			return null;
	}
}

