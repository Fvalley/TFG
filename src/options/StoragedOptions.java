package options;

public class StoragedOptions {
	private Options[] storage;
	private int pos;
	private int max = 1000;
	public StoragedOptions(){
		this.storage = new Options [max];
		this.pos = 0;
	}
	
	public void add(Options opt) {
		if (this.pos >= max) {
			//Doblar tamaño
		}
		this.storage[this.pos] = opt;
		this.pos++;
	}
	public void clear() {
		this.max=1000;
		this.storage = new Options [max];
		this.pos = 0;
	}
	public Options getOpt(int pos) {
		return this.storage[pos];
	}
	public Options[] getAll() {
		return this.storage;
	}
}
