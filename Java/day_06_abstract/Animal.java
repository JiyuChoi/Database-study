package day_06_abstract;

/* abstract class: overriding 강제성 */
public abstract class Animal extends Object {
	String kind = "동물의 종류";
	
	public Animal() {}
	public Animal(String kind){
		this.kind = kind;
	}
	
//	public void breath() {
//		System.out.println("폐로 숨쉬기");
//		
//	}
	public void print() {}
	
	public abstract void breath(); //abstract
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Animal other = (Animal) obj;
		if (kind == null) {
			if (other.kind != null)
				return false;
		} else if (!kind.equals(other.kind))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Animal [kind=" + kind + "]";
	}
}

