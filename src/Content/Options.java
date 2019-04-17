package Content;

public interface Options {
	abstract public void mostrar();
	abstract public String getRegex();
	public abstract Options parse(String[] line);
}
