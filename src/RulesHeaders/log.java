package RulesHeaders;

public class log extends Action{

	@Override
	public Action parse(String[] s) {
		if (s[0].equalsIgnoreCase("LOG"))
			return new log();
		else
			return null;
	}

}
