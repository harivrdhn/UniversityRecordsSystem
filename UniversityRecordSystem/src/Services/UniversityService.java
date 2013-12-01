package Services;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.jws.WebService;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp.BasicDataSource;

import ServiceTO.ChangeRequestTO;
import ServiceTO.CoursesTO;
import ServiceTO.InstructorTO;
import ServiceTO.PaymentTO;
import ServiceTO.PersonTO;
import ServiceTO.StudentTO;
import ServiceTO.TransactionsTO;

import com.google.gson.Gson;

@WebService
public class UniversityService implements Serializable{
	
	private DataSource dataSource;
	
	public UniversityService(){
		BasicDataSource ds=new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUsername("root");
		ds.setPassword("Formula#1");
		ds.setUrl("jdbc:mysql://localhost/universitydatabase");
	    dataSource = ds;
	 
	}
	
	private static final long serialVersionUID = 1L;
		
	/**
	 * BELOW ARE THE FUNCTIONS USED IN A STUDENT PORTAL
	 * 
	 * getLoginDetails(String username, String password)
	 * getStudentDetails(int personId)
	 * changePassword(int personId,String confirmPassword)
	 * getCourseListForStudent(int studentId)
	 * enrollStudent(int studentId, int courseId)
	 * unenrollStudent()
	 * editPersonDetails(String details)
	 * getTransactions(int studentId)
	 */
	
	//Function to verify the login of the user
	public String getLoginDetails(String username, String password) throws Exception {
		
		PersonTO personTO = null;
		String json=null;
		ResultSet rs=null;
		PreparedStatement st=null;
		Connection con=null;
		Gson gson=new Gson();

		try
		{
			//Creating the sql connection with the database
			con=dataSource.getConnection();
			
			
			//querying the database to check if it is a new game or an existing one
			String query= "select personId,flag,firstName from person where personId='"+username+"' and password='"+password+"'";
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			while(rs.next()){
				personTO = new PersonTO();
				personTO.setPersonId(rs.getInt(1));
				personTO.setFlag(rs.getString(2));
				personTO.setFirstName(rs.getString(3));
				json = gson.toJson(personTO);
			}
		}
		catch(Exception e){
			json  = "username/password does not match! please try again.";
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return json;
	}
	
	public String getStudentDetails(int personId) throws SQLException{
		PreparedStatement st=null;
		Connection con=null;
		ResultSet rs=null;
		String json = null;
		try
		{
		//Getting the SQL connection from the data source
		con=dataSource.getConnection();
		
		Gson gson=new Gson();
		StudentTO studentto=null;
		
		String query="select p.firstName,p.lastName,p.addressLine,p.city,p.state,p.zip,s.departmentId,s.admitSemester,s.currentSemester,s.degreePursuing,s.estimatedYearOfGraduation,s.GPA,p.emailId from person p,student s where p.personId=s.studentId and p.personId="+personId;
		st=con.prepareStatement(query);
		rs=st.executeQuery(query);
		//InstructorTO instrTO=new InstructorTO();
			while (rs.next())
			{
				studentto = new StudentTO();
				studentto.setFirstName(rs.getString(1));
				studentto.setLastName(rs.getString(2));
				studentto.setAddressLine(rs.getString(3));
				studentto.setCity(rs.getString(4));
				studentto.setState(rs.getString(5));
				studentto.setZip(rs.getInt(6));
				studentto.setDeptId(rs.getInt(7));
				studentto.setAdmitSemester(rs.getString(8));
				studentto.setCurrSemester(rs.getInt(9));
				studentto.setDegreePursuing(rs.getString(10));
				studentto.setEstimateGradutationYear(rs.getInt(11));
				studentto.setGpa(rs.getFloat(12));
				studentto.setEmailId(rs.getString(13));
			}
			json = gson.toJson(studentto);
		}
		catch(Exception e){
			json = "ERROR";
			e.printStackTrace();
		}
		finally{
		con.close();
		}
		return json;
	}
	
	public String changePassword(int personId,String confirmPassword)
	{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Creating the sql connection with the database
			con=dataSource.getConnection();
			
			String query = "update person set password='"+confirmPassword+"' where personId="+personId;
			st=con.prepareStatement(query);
			System.out.println("query : "+query);
			if(st.executeUpdate(query) == 1){
				message = "SUCCESS";
			}
			else{
				message = "ERROR";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return message;
		
	}
	
	//Search the course details of a course with a given courseId and send the result as a json string back
	public String getCourseListForStudent(int studentId, String flag) throws SQLException {
		PreparedStatement st=null;
		Connection con=null;
		ResultSet rs=null;
		String json = null;
		ArrayList<CoursesTO> courseList = new ArrayList<>();
		Gson gson=new Gson();
		CoursesTO coursesto=null;

		try
		{
			//Getting the SQL connection from the data source
		con=dataSource.getConnection();
		
		String query = null;
		
		if(flag.equals("S")){
			query="SELECT c.courseId,c.courseName,c.roomNumber,c.classHours,c.credits,c.section,c.department FROM course c, studentenroll s where s.studentId = "+ studentId +" And s.courseId=c.courseId; ";
		}
		
		if(flag.equals("I")){
			query="SELECT c.courseId,c.courseName,c.roomNumber,c.classHours,c.credits,c.section,c.department FROM course c, instructorscourse s where s.instructorId = "+ studentId +" AND s.courseId=c.courseId; ";
		}
		st=con.prepareStatement(query);
		System.out.println("query" + query);
		courseList.clear();
		
		rs=st.executeQuery(query);
			while (rs.next())
			{
				coursesto = new CoursesTO(); 
				coursesto.setCourseId(rs.getInt(1));
				coursesto.setCourseName(rs.getString(2));
				coursesto.setRoomNumber(rs.getString(3));
				coursesto.setClassHours(rs.getString(4));
				coursesto.setCredits(rs.getInt(5));
				coursesto.setSection(rs.getString(6));
				coursesto.setDepartmentId(rs.getInt(7));
				courseList.add(coursesto);
			}
		    json = gson.toJson(courseList);
		}
		catch(Exception e){
			json = "ERROR";
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		return json;
	}
	
	public String getChargesDue(int personId) throws SQLException{
		
		PreparedStatement st=null;
		Connection con=null;
		ResultSet rs=null;
		String json = null;
		ArrayList<PaymentTO> paymentList = new ArrayList<PaymentTO>();
		Gson gson=new Gson();
		PaymentTO paymentTO=null;

		try
		{
			//Getting the SQL connection from the data source
		con=dataSource.getConnection();
		
		String query="select charges,dueDate,term,amount from chargesDue where personId="+ personId;
		st=con.prepareStatement(query);
		paymentList.clear();
		
		rs=st.executeQuery(query);
			
		while (rs.next())
			{
				paymentTO = new PaymentTO();
				paymentTO.setCharge(rs.getString(1));
				paymentTO.setDueDate(rs.getDate(2));
				paymentTO.setTerm(rs.getString(3));
				paymentTO.setAmount(rs.getDouble(4));
				paymentList.add(paymentTO);
			}
		    json = gson.toJson(paymentList);
		}
		catch(Exception e){
			json = "ERROR";
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		return json;
		
	}
	
		public String generateSearchQuery(int courseId, String courseName, String deptName)
		{
			String query = "select c.courseId,c.courseName,c.roomNumber,c.classHours, c.credits,c.section,c.department,d.departmentName, p.firstName,p.lastName from course c,instructorscourse ic, person p, department d where c.department = d.departmentId and  ic.courseId = c.courseId and ic.instructorId = p.personId ";
			StringBuffer queryBuffer= new StringBuffer(query);
							
			if(courseId != 0 ){
				queryBuffer.append("AND c.courseId="+courseId);
				System.out.println("query is : "+queryBuffer);
			}
			else if(courseName != null && deptName != null)
			{
				queryBuffer.append("AND c.courseName like '%"+courseName+"%'");
				queryBuffer.append("AND d.departmentName like '%"+deptName+"%'");
				System.out.println("query is : "+queryBuffer);
			}
			else if(courseName != null)
			{
				queryBuffer.append("AND c.courseName like '%"+courseName+"%'");
				System.out.println("query is : "+queryBuffer);
			}
			else if(deptName != null)
			{
				queryBuffer.append("AND d.departmentName like '%"+deptName+"%'");
				System.out.println("query is : "+queryBuffer);
			}
			return queryBuffer.toString();
		}
	
		public String searchForClasses(int courseId, String courseName, String deptName) throws SQLException 
		{
			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs = null;
			CoursesTO coursesTO = null;
			Gson gson = new Gson();
			ArrayList<CoursesTO> courseList = new ArrayList<>();
			String json = null;
			
			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				courseList.clear();
				
				//Inserting student Id with the enrolled course
				String query = generateSearchQuery(courseId, courseName, deptName);
				st=con.prepareStatement(query);
				
				rs = st.executeQuery(query);
				
				while(rs.next()){
					
					coursesTO = new CoursesTO();
					coursesTO.setCourseId(rs.getInt(1));
					coursesTO.setCourseName(rs.getString(2));
					coursesTO.setRoomNumber(rs.getString(3));
					coursesTO.setClassHours(rs.getString(4));
					coursesTO.setCredits(rs.getInt(5));
					coursesTO.setSection(rs.getString(6));
					coursesTO.setDepartmentId(rs.getInt(7));
					coursesTO.setDepartmentName(rs.getString(8));
					String instructorName = rs.getString(9)+" "+rs.getString(10);
					coursesTO.setInstructor(instructorName);
					courseList.add(coursesTO);
				}
				json = gson.toJson(courseList);
				
			}
			catch(Exception e){
				json  = "ERROR";
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return json;	
		}
	
		public String enrollStudent(int studentId, String courseId)throws Exception
		{
			String message=null;
			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs = null;
			int creditCount = 0;
			double cost = 0;
			
			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				
				
				String[] course = courseId.split(",");
				
				//Inserting student Id with the enrolled course
				for(int i=0;i<course.length;i++){
					
					String query= "insert into studentenroll (studentId,courseId) values('"+studentId+"','"+course[i]+"')";
					st=con.prepareStatement(query);
					if(st.executeUpdate() == 1){
						
						String creditCountQuery = "select sum(c.credits) from studentenroll s,course c where s.courseId = c.courseId and s.feeStatusFlag='N' and s.studentId="+studentId;
						st=con.prepareStatement(creditCountQuery);
						rs = st.executeQuery();
						
						while(rs.next()){
							creditCount = rs.getInt(1);
						}
						
						String costPerCreditQuery = "select creditsCost from charges where id='summer13'";
						st=con.prepareStatement(costPerCreditQuery);
						rs = st.executeQuery();
						
						while(rs.next()){
							cost = rs.getDouble(1);
						}
						double totalAmount = creditCount*cost;
						
						String amountUpdateQuery= "update chargesDue set amount="+totalAmount+" where chargeId=1 and personId="+studentId;
						st=con.prepareStatement(amountUpdateQuery);
						if(st.executeUpdate() == 1){
							message="SUCCESS";
						}
						else{
							message ="ERROR";
						}
						message="SUCCESS";
					}
					else{
						message ="ERROR";
						break;
					}
				}
			}
			
			catch(Exception e){
	  		    message  = "ERROR";
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return message;
		}
		
		public String unenrollStudent(int studentId, String courseId) throws SQLException {
			String message=null;
			PreparedStatement st=null;
			Connection con=null;
			
			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				String[] course = courseId.split(",");
				
				//Inserting student Id with the enrolled course
				for(int i=0;i<course.length;i++){
						
					String query= "delete from studentenroll where studentId = "+studentId+" AND courseId ="+course[i];
					st=con.prepareStatement(query);
					if(st.executeUpdate() == 1){
						message="SUCCESS";
					}
					else{
						message ="ERROR";
						break;
					}
				}
			}
			catch(Exception e){
	  		    message  = "ERROR";
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return message;
			}
		
		public String getTransactions(int personId) throws SQLException{
			
			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs = null;
			TransactionsTO transactionsTO =null;
			ArrayList<TransactionsTO> transactionList = new ArrayList<>();
			Gson gson = new Gson();
			String json;
			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
										
					String query= "select transactionId,amount,date,time,creditOrDebit,bankAccountNum,creditCardNum from transaction where personId = "+personId;
					st=con.prepareStatement(query);
					rs = st.executeQuery(query);
					while(rs.next()){
						transactionsTO = new TransactionsTO();
						transactionsTO.setTransactionId(rs.getInt(1));
						transactionsTO.setAmount(rs.getDouble(2));
						transactionsTO.setTransactionDate(rs.getDate(3));
						transactionsTO.setTime(rs.getString(4));
						transactionsTO.setCreditOrDebit(rs.getString(5));
						transactionsTO.setBankAccountNum(rs.getString(6));
						transactionsTO.setCreditCardNum(rs.getString(7));
						transactionList.add(transactionsTO);
					}
					json = gson.toJson(transactionList);
			}
			catch(Exception e){
				json  = "ERROR";
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return json;
		}
		
		public String makePayment(String transaction) throws SQLException{
			PreparedStatement st=null;
			Connection con=null;
			ArrayList<TransactionsTO> paymentList = new ArrayList<>();
			Gson gson = new Gson();
			String json;
			String bankAccNum="";
			String creditCardNum = "";
			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				TransactionsTO to = gson.fromJson(transaction, TransactionsTO.class);
				
				int personId = to.getPersonId();
				double amount = to.getAmount();
				java.sql.Date date  =to.getTransactionDate();
				
				String creditOrDebit = to.getCreditOrDebit();
				if(to.getBankAccountNum() != null)
					bankAccNum = to.getBankAccountNum();
				if(to.getCreditCardNum() != null)
					creditCardNum = to.getCreditCardNum();
				
				String insertTransactionQuery="insert into transaction (personId,amount,date,time,creditOrDebit,bankAccountNum,creditCardNum)"
							+" values ("+personId+","+amount+",'"+date+"','"+to.getTime()+"','"+creditOrDebit+"','"+bankAccNum+"','"+creditCardNum+"')";
				
					st=con.prepareStatement(insertTransactionQuery);
					if(st.executeUpdate() == 1){
						json = "SUCCESS";
					}
					else{
						json = "ERROR";
					}
					
					json = gson.toJson(paymentList);
			}
			catch(Exception e){
				json  = "ERROR";
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return json;
		}
	
	/**
	 * 
	 * 
	 * @return
	 * @throws SQLException
	 */
	
	public String getCourseDetails(int courseId) throws SQLException{
		PreparedStatement st=null;
		Connection con=null;
		ResultSet rs=null;
		String json = null;
		ArrayList<CoursesTO> courseList = new ArrayList<>();
		Gson gson=new Gson();
		CoursesTO coursesto=null;
		
		try{
			con=dataSource.getConnection();
			String query="SELECT c.courseId,c.courseName,c.roomNumber,c.classHours,c.credits,c.section,c.department FROM course c, person p, studentenroll s where c.courseId="+courseId;
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			while (rs.next())
			{
				coursesto = new CoursesTO(); 
				coursesto.setCourseId(rs.getInt(1));
				coursesto.setCourseName(rs.getString(2));
				coursesto.setRoomNumber(rs.getString(3));
				coursesto.setClassHours(rs.getString(4));
				coursesto.setCredits(rs.getInt(5));
				coursesto.setSection(rs.getString(6));
				coursesto.setDepartmentId(rs.getInt(7));
				courseList.add(coursesto);
			}
			json = gson.toJson(courseList);
		}
		catch(Exception e){
			json = "ERROR";
			e.printStackTrace();
		}
		finally{
			con.close();
		}
		return json;
		
	}
	
	
	public String getInstructorDetails(int personId) throws Exception {
		PreparedStatement st = null;
		Connection con = null;
		ResultSet rs = null;
		String json = null;
		try {
			// Getting the SQL connection from the data source
			con = dataSource.getConnection();

			Gson gson = new Gson();
			InstructorTO instructorto = null;

			String query = "select p.firstName,p.lastName,p.addressLine,p.city,p.state,p.zip,i.departmentId,i.meetingHours,i.officeRoom,i.dateOfJoining,i.numberOfClasses,i.position from person p,instructor i where p.personId=i.personId and p.personId="+ personId;
			st = con.prepareStatement(query);
			rs = st.executeQuery();
			
			while (rs.next()) {
				instructorto = new InstructorTO();
				instructorto.setFirstName(rs.getString(1));
				instructorto.setLastName(rs.getString(2));
				instructorto.setAddressLine(rs.getString(3));
				instructorto.setCity(rs.getString(4));
				instructorto.setState(rs.getString(5));
				instructorto.setZip(rs.getInt(6));
				instructorto.setDepartmentId(rs.getInt(7));
				instructorto.setMeetingHours(rs.getString(8));
				instructorto.setOfficeRoom(rs.getString(9));
				instructorto.setDateOfJoining(rs.getString(10));
				instructorto.setNoOfClasses(rs.getInt(11));
				instructorto.setPosition(rs.getString(12));
			}
			json = gson.toJson(instructorto);
		} catch (Exception e) {
			json = "ERROR";
			e.printStackTrace();
		} finally {
			con.close();
		}
		return json;
	}

	//Creates a record of a new student in the person and student table
	public String createStudent(String details) throws Exception{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			
			Gson gson=new Gson();
			StudentTO studentto=gson.fromJson(details, StudentTO.class);
			
			//Fetching student data from Json string
			String fName=studentto.getFirstName();
			String lName=studentto.getLastName();
			String address=studentto.getAddressLine();
			String state=studentto.getState();
			String city=studentto.getCity();
			int zip=studentto.getZip();
			int deptId=studentto.getDeptId();
			String admitSem=studentto.getAdmitSemester();
			int currentSem=studentto.getCurrSemester();
			
			//Setting the emailId and one time password for the student
			String emailId=fName+"."+lName + "@cmpe273.edu";
			String password=lName.substring(0, 1).toUpperCase() + lName.substring(1);
			
			//Inserting student data into the person table
			String insertQuery= "insert into person(firstName,lastName,addressLine,state,city,zip,emailId,password) values('"+fName+"','"+lName+"','"+address+"','"+state+"','"+city+"','"+zip+"','"+emailId+"','"+password+"')";
			st = con.prepareStatement(insertQuery);
			if(st.executeUpdate() == 1)
			{
				//Inserting student data into the student table
				String updateQuery="insert into student(departmentId,admitSemester,currentSemester) values('"+deptId+"','"+admitSem+"','"+currentSem+"')";
				st = con.prepareStatement(updateQuery);
				if(st.executeUpdate()==1)
					message="SUCCESS";
				else 
					message ="ERROR";
			}
			else
				  message="ERROR";
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	
	public String removeStudentInstructor(int personId, String flag) throws SQLException{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			
			String query = null;
			
			if(flag.equals("S")){
				query = "delete from studentenroll where studentId= "+personId+";delete from student where studentId="+personId+";delete from person where personId="+personId+";";
			}
			else{
				query = "delete from instructorscourse where personId= "+personId+";delete from instructor where personId= "+personId+";delete from person where personId="+personId+";";
			}
			st=con.prepareStatement(query);
			if(st.executeUpdate() == 1)
			{
				message="SUCCESS";
			}
			else 
			{
				message ="ERROR";
			}
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	
	//creates a record for a new course 
	public String createCourse(String details) throws Exception{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			
			Gson gson=new Gson();
			CoursesTO coursesto=gson.fromJson(details, CoursesTO.class);
			
			//Fetching student data from Json string
			String courseName=coursesto.getCourseName();
			int credits=coursesto.getCredits();
			String section=coursesto.getSection();
			int department=coursesto.getDepartmentId();
			
			
			//Inserting instructor data into the person table
			String query= "insert into course(courseName,credits,section,department) values('"+courseName+"','"+credits+"','"+section+"','"+department+"')";
			st=con.prepareStatement(query);
			if(st.executeUpdate(query) == 1)
			{
				message="SUCCESS";
				con.commit();
			}
			else 
			{
				message ="ERROR";
				con.rollback();
			}
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	public String removeCourse(int courseId) throws SQLException{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			
			String query = null;
			query = "delete from studentenroll where courseId="+courseId+";delete from instructorscourse where courseId="+courseId+";delete from course where courseId="+courseId+";";
			st=con.prepareStatement(query);
			if(st.executeUpdate() == 1)
			{
				message="SUCCESS";
			}
			else 
			{
				message ="ERROR";
			}
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	
	//creates a record of a new instructor
	public String createInstructor(String details) throws Exception{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			
			Gson gson=new Gson();
			InstructorTO instructorto=gson.fromJson(details, InstructorTO.class);
			
			//Fetching student data from Json string
			String fName=instructorto.getFirstName();
			String lName=instructorto.getLastName();
			String address=instructorto.getAddressLine();
			String state=instructorto.getState();
			String city=instructorto.getCity();
			int zip=instructorto.getZip();
			String deptId=instructorto.getDeptId();
			String officeRoom=instructorto.getOfficeRoom();
			String dateOfJoining=instructorto.getDateOfJoining();
			String position=instructorto.getPosition();
			
			//Setting the emailId and one time password for the instructor
			String emailId=fName+"."+lName + "@cmpe273.edu";
			String password=lName.substring(0, 1).toUpperCase() + lName.substring(1);
			
			//Inserting instructor data into the person table
			String insertQuery= "insert into person(firstName,lastName,addressLine,state,city,zip,emailId,password) values('"+fName+"','"+lName+"','"+address+"','"+state+"','"+city+"','"+zip+"','"+emailId+"','"+password+"')";
			st=con.prepareStatement(insertQuery);
			if(st.executeUpdate() == 1)
			{
				String updateQuery="insert into instructor(departmentId,officeRoom,dateOfJoining,position) values('"+deptId+"','"+officeRoom+"','"+dateOfJoining+"','"+position+"')";
				st=con.prepareStatement(updateQuery);
				if(st.executeUpdate()==1)
				{
				message="SUCCESS";
				con.commit();
				}
				else 
				{
					message ="ERROR";
					con.rollback();
				}
			}
			else
				  message="ERROR";
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}

	public String replaceIstrucForCourse(int instructorId , int courseId) throws SQLException
	{
		
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			String query = null;
			query = "update instructorscourse set instructorId="+instructorId+" where courseId="+courseId+";";
			st=con.prepareStatement(query);
			System.out.println("query : >>>>>>>>>>>>>>>>" + query);
			if(st.executeUpdate() == 1)
			{
				message="SUCCESS";
			}
			else 
			{
				message ="ERROR";
			}
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	public String removeInstructorFromCourse(int instructorId,int courseId) throws SQLException
	{
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			String query = null;
			query = "delete from instructorscourse where instructorId="+instructorId+" and courseId="+courseId+";";
			st=con.prepareStatement(query);
			System.out.println("query : >>>>>>>>>>>>>>>>" + query);
			if(st.executeUpdate(query) == 1)
			{
				message="SUCCESS";
			}
			else 
			{
				message ="ERROR";
			}
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	
	public String assignInstructor(int instructorId,int courseId) throws SQLException{
		
		String message=null;
		PreparedStatement st=null;
		Connection con=null;

		try
		{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			String query = null;
			query = "insert into instructorscourse values ("+instructorId+","+courseId+");";
			st=con.prepareStatement(query);
			System.out.println("query : >>>>>>>>>>>>>>>>" + query);

			if(st.executeUpdate(query) == 1)
			{
				message="SUCCESS";
			}
			else 
			{
				message ="ERROR";
			}
		}
		catch(Exception e){
  		    message  = e.toString();
			e.printStackTrace();
		}
		finally {
			con.close();
		}
		return message;
	}
	
		/**
		 *	displayAllCourses()
		 * 	displayAllInstructors()
		 *  displayAllStudents()
		 *	removeStudentInstructor()
		 *  removeCourse()
		 *  createInstructor()
		 *  createStudent()
		 *  createCourse()
		 *  assignInstructor()
		 *  closePendingChangeRequests()
		 *  
		 */
	
		public String displayAllStudents() throws SQLException 
		{
			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs=null;
			String json = null;
			try
			{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			Gson gson=new Gson();
			StudentTO studentto=null;
			ArrayList<StudentTO> studentList = new ArrayList<>();
			
			String query="select p.firstName,p.lastName,p.addressLine,p.city,p.state,p.zip,s.departmentId,s.admitSemester,s.currentSemester,s.degreePursuing,s.estimatedYearOfGraduation,s.GPA,p.personId from person p,student s where p.personId=s.studentId";
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			studentList.clear();

			while (rs.next())
				{
					studentto = new StudentTO();
					studentto.setFirstName(rs.getString(1));
					studentto.setLastName(rs.getString(2));
					studentto.setAddressLine(rs.getString(3));
					studentto.setCity(rs.getString(4));
					studentto.setState(rs.getString(5));
					studentto.setZip(rs.getInt(6));
					studentto.setDeptId(rs.getInt(7));
					studentto.setAdmitSemester(rs.getString(8));
					studentto.setCurrSemester(rs.getInt(9));
					studentto.setDegreePursuing(rs.getString(10));
					studentto.setEstimateGradutationYear(rs.getInt(11));
					studentto.setGpa(rs.getFloat(12));
					studentto.setStudentId(rs.getInt(13));
					studentList.add(studentto);
				}
	
				json = gson.toJson(studentList);
			}
			catch(Exception e){
				json = "ERROR";
				e.printStackTrace();
			}
			finally{
			con.close();
			}
			return json;
		}
	
		public String displayAllCourses() throws Exception
		{
		
			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs=null;
			String json = null;
			ArrayList<CoursesTO> courseList = new ArrayList<>();
			Gson gson=new Gson();
			CoursesTO coursesto=null;
			
			try{
				con=dataSource.getConnection();
				String query="select c.courseId,c.courseName,c.roomNumber,c.classHours,c.credits,c.section,c.department,p.firstName,p.lastName from course c,instructorscourse ic, instructor i, person p where c.courseId=ic.courseId and ic.instructorId=i.personId and i.personId = p.personId";
				st=con.prepareStatement(query);
				rs=st.executeQuery();
				courseList.clear();
				
				while (rs.next())
				{
					coursesto = new CoursesTO(); 
					coursesto.setCourseId(rs.getInt(1));
					coursesto.setCourseName(rs.getString(2));
					coursesto.setRoomNumber(rs.getString(3));
					coursesto.setClassHours(rs.getString(4));
					coursesto.setCredits(rs.getInt(5));
					coursesto.setSection(rs.getString(6));
					coursesto.setDepartmentId(rs.getInt(7));
					coursesto.setInstructor(rs.getString(8)+rs.getString(9));
					courseList.add(coursesto);
				}
				json = gson.toJson(courseList);
			}
			catch(Exception e){
				json = "ERROR";
				e.printStackTrace();
			}
			finally{
				con.close();
			}
			return json;
		
		}
		
		public String displayAllInstructors() throws SQLException
		{

			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs=null;
			String json = null;
			ArrayList<InstructorTO> instructorList = new ArrayList<>();
			try
			{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();

			Gson gson=new Gson();
			InstructorTO instructorto=null;

			String query="select p.firstName,p.lastName,p.addressLine,p.city,p.state,p.zip,i.departmentId,i.meetingHours,i.officeRoom,i.dateOfJoining,i.numberOfClasses,i.position,i.personId from person p,instructor i where p.personId=i.personId";
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			instructorList.clear();

			while (rs.next()) {
				instructorto = new InstructorTO();
				instructorto.setFirstName(rs.getString(1));
				instructorto.setLastName(rs.getString(2));
				instructorto.setAddressLine(rs.getString(3));
				instructorto.setCity(rs.getString(4));
				instructorto.setState(rs.getString(5));
				instructorto.setZip(rs.getInt(6));
				instructorto.setDepartmentId(rs.getInt(7));
				instructorto.setMeetingHours(rs.getString(8));
				instructorto.setOfficeRoom(rs.getString(9));
				instructorto.setDateOfJoining(rs.getString(10));
				instructorto.setNoOfClasses(rs.getInt(11));
				instructorto.setPosition(rs.getString(12));
				instructorto.setPersonId(rs.getInt(13));
				instructorList.add(instructorto);
			}
			json = gson.toJson(instructorList);
			}
			catch(Exception e){
				json = "ERROR";
			e.printStackTrace();
			}
			finally{
			con.close();
			}
			return json;
		}
		
		
		public String editPersonDetails(String details) throws Exception {
			String message=null;
			PreparedStatement st=null;
			Connection con=null;

			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				
				Gson gson=new Gson();
				StudentTO studentto=gson.fromJson(details, StudentTO.class);
				
				//Fetching student data from Json string
				
				String address=studentto.getAddressLine();
				String state=studentto.getState();
				String city=studentto.getCity();
				int zip=studentto.getZip();
				int studentId=studentto.getStudentId();
				
				
				//Inserting instructor data into the person table
				String query= "update person set addressLine='"+address+"',state='"+state+"', city='"+city+"',zip='"+zip+"' where personId="+studentId;
				st=con.prepareStatement(query);
				if(st.executeUpdate() == 1)
				{
					message="SUCCESS";
				}
				else 
				{
					message ="ERROR";
				}
			}
			catch(Exception e){
	  		    message  = e.toString();
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return message;
		}
		
		public String submitChangeRequest(String details) throws Exception
		{
			
			String message=null;
			PreparedStatement st=null;
			Connection con=null;

			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				
				Gson gson=new Gson();
				PersonTO personTO=gson.fromJson(details, PersonTO.class);
				
				int personId = 	personTO.getPersonId();
				String changeReq = personTO.getChangeRequest();
					
					//Inserting course data into the person table
					String query= "insert into changerequest (personId,changeRequested) values ("+personId+",'"+changeReq+"')";
					st=con.prepareStatement(query);
					if(st.executeUpdate() == 1)
					{
						message="SUCCESS";
					}
					else 
					{
						message ="ERROR";
					}
			}
			catch(Exception e){
	  		    message  = e.toString();
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return message;
			
		}
		
		public String editCourseDetails(String details, int courseId) throws Exception
		{
			String message=null;
			PreparedStatement st=null;
			Connection con=null;

			try
			{
				//Getting the SQL connection from the data source
				con=dataSource.getConnection();
				
				Gson gson=new Gson();
				CoursesTO courseto=gson.fromJson(details, CoursesTO.class);
				
					String roomNumber=courseto.getRoomNumber();
					String classHours=courseto.getClassHours();
					
					//Inserting course data into the person table
					String query= "update course set roomNumber='"+roomNumber+"', classHours='"+classHours+"' where courseId='"+courseId+"'";
					st=con.prepareStatement(query);
					if(st.executeUpdate() == 1)
					{
						message="SUCCESS";
					}
					else 
					{
						message ="ERROR";
					}
			}
			catch(Exception e){
	  		    message  = e.toString();
				e.printStackTrace();
			}
			finally {
				con.close();
			}
			return message;
		}
		
		public String viewPendingChangeRequests(String requestType) throws SQLException
		{
			PreparedStatement st=null;
			Connection con=null;
			ResultSet rs=null;
			String json = null;
			try
			{
			//Getting the SQL connection from the data source
			con=dataSource.getConnection();
			
			Gson gson=new Gson();
			ChangeRequestTO changeRequestTO =null;
			String query= null;
			ArrayList<ChangeRequestTO> changeRequestList = new ArrayList<ChangeRequestTO>();
			
			if(requestType.equals("pending")){
				query="select changeRequestId,personId,changeRequested,date,time,statusFlag from changerequest where statusFlag='N'";
			}
			else{
				query="select changeRequestId,personId,changeRequested,date,time,statusFlag from changerequest where statusFlag='Y'";
			}
			st=con.prepareStatement(query);
			rs=st.executeQuery();
				while (rs.next())
				{
					changeRequestTO = new ChangeRequestTO();
					changeRequestTO.setChangeRequestId(rs.getInt(1));
					changeRequestTO.setPersonId(rs.getInt(2));
					changeRequestTO.setChangeRequested(rs.getString(3));
					changeRequestTO.setDate(rs.getDate(4));
					changeRequestTO.setTime(rs.getString(5));
					changeRequestTO.setStatusFlag(rs.getString(6));
					changeRequestList.add(changeRequestTO);
				}
				json = gson.toJson(changeRequestList);
			}
			catch(Exception e){
				json = "ERROR";
				e.printStackTrace();
			}
			finally{
			con.close();
			}
			return json;
		}
		
		
}
