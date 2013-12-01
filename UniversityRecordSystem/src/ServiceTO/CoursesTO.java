package ServiceTO;


public class CoursesTO {
	private int courseId;
	private String courseName;
	private String section;
	private String classHours;
	private int credits;
	private int departmentId;
	private String roomNumber;
	private String departmentName;
	private String instructor;
	
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	public String getSection() {
		return section;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int i) {
		this.courseId = i;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getClassHours() {
		return classHours;
	}
	public void setClassHours(String classHours) {
		this.classHours = classHours;
	}
	public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
}
