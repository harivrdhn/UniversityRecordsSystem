package ServiceTO;

import java.util.ArrayList;

public class StudentTO {
	
	private String firstName;
	private String lastName;
	private String addressLine;
	private String state;
	private String city;
	private int zip;
	private ArrayList<CoursesTO> courseList;
	private int studentId;
	private String emailId;
	private String password;
	private int departmentId;
	private String admitSemester;
	private int currSemester;
	private float gpa;
	private char onCampusJob;
	private String degreePursuing;
	private int estimateGradutationYear;
	
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getDeptId() {
		return departmentId;
	}
	public void setDeptId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getCurrSemester() {
		return currSemester;
	}
	public void setCurrSemester(int currSemester) {
		this.currSemester = currSemester;
	}
	
	public char getOnCampusJob() {
		return onCampusJob;
	}
	public void setOnCampusJob(char onCampusJob) {
		this.onCampusJob = onCampusJob;
	}
	public String getDegreePursuing() {
		return degreePursuing;
	}
	public void setDegreePursuing(String degreePursuing) {
		this.degreePursuing = degreePursuing;
	}
	public int getEstimateGradutationYear() {
		return estimateGradutationYear;
	}
	public void setEstimateGradutationYear(int estimateGradutationYear) {
		this.estimateGradutationYear = estimateGradutationYear;
	}
	public float getGpa() {
		return gpa;
	}
	public void setGpa(float gpa) {
		this.gpa = gpa;
	}
	
	public String getAdmitSemester() {
		return admitSemester;
	}
	public void setAdmitSemester(String admitSemester) {
		this.admitSemester = admitSemester;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddressLine() {
		return addressLine;
	}
	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	public ArrayList<CoursesTO> getCourseList() {
		return courseList;
	}
	public void setCourseList(ArrayList<CoursesTO> courseList) {
		this.courseList = courseList;
	}
}
