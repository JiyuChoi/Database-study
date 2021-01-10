package day_06_abstract;

public class Test02_Service {

	public static void main(String[] args) {
		Service service = new OracleServiceImp1();
		
		service.insert();
		service.delete();
		service.update();
	}

}
