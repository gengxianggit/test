package util;

public enum Grade {
	 a("����"),b("����"),c("һ��"),d("����"),e("������"),f(null);
	
	
	private String value;
	
	
	
	private Grade(String value) {
		this.value=value;
	}
 
	public String getValue() {
		return value;
	}
	public static Grade getGrade(String value) {
		Grade g=Grade.f; 
		
		if(value!=null) {      //��ֹswitch��ָ���쳣
		
		switch(value){
		case "����":
	    g=Grade.a;
		break;
		case "����":
		g=Grade.b;
		break;
		case "һ��":
		g=Grade.c;
		break;
		case "����":
	    g=Grade.d;
		break;
		case "������":
		g=Grade.e;
		break;
		
		}
		
	}
		return g;
		}

	
}
