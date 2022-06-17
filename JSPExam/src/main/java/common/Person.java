package common; // 규칙 1 : default 패키지 외의 패키지에 존재해야 함

public class Person {
	
	// 규칙 2 : 맴버 변수의 접근제어자는 private
	private String name;
	private int age;
	
	// 규칙 3 : 기본 생성자가 존재해야 함
	public Person() {}
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	// 규칙 4 : getter, setter가 존재해야 함
	// 규칙 5 : getter, setter의 접근제어자는 public
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
