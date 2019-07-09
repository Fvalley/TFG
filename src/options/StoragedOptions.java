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
		if (this.pos >= max-1) {
			//Doblar tamaño
			this.max = this.max*2;
			Options[] almacen = new Options [max];
			for(int i = 0;i < pos;i++)
				almacen[i] = this.storage[i];
			this.storage = almacen;
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
