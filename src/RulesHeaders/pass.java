package RulesHeaders;

public class pass implements Action {

	@Override
	public Action parse(String[] s) {
		if (s[0].equalsIgnoreCase("PASS"))
			return new pass();
		else
			return null;
	}

}
