package options;

public interface Options {
	abstract public void mostrar();
	abstract public String getRegex();
	abstract public Options parse(String[] line);
	abstract public String cutPackage(String paquete);
	public abstract String getString();
	public abstract boolean igual(Options option);
}
