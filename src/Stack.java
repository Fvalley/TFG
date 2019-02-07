import java.util.ArrayList;

public class Stack <Type>{

	private int size;
    private ArrayList<Type> elements;
   
    public Stack() {
        super();
        elements = new ArrayList<Type>();
        size = 0;
    }
    
    public Stack (String s){
    	
    }
   
    public boolean empty() {
        if (size==0) {
            return true;
        }
        return false;
    }

    public void push ( Type o ) {
        elements.add(size, o);
        size++;
    }
    
    
    //No tiene tratamiento de excepciones
    public Type pop () {
        return elements.get(--size);
    }

    public int getSize() {
        return size;
    }
    
    public Type peek() {
    	return elements.get(size-1);
    }
    
    public boolean isOperation(char c){
		boolean output = false;
		if(c=='*' || c=='|' || c=='+' || c=='·'){
			output = true;
		}
		return output;
	}
    
}
