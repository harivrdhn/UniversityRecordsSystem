package test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import com.google.gson.Gson;

import ServiceTO.TransactionsTO;
import Services.UniversityService;

public class UniversityServiceTest {
	UniversityService service = new UniversityService();

	public void searchForClasses() {
		try {
			service.searchForClasses(5, null, null);
			fail("Not yet implemented");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void enrollFor() {
		
		try {
			service.enrollStudent(1, "5,6,4");
			fail("Not yet implemented");
			
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
/*	@Test
	public void unenrollFor() {
		
		try {
			service.unenrollStudent(1, "5,6,4");
			fail("Not yet implemented");
			
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}*/
	@Test
	public void test()
	{
		try {
			service.getStudentDetails(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Test
	public void makePayment() {
		
		try {
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
			String utilDate = dateFormat.format(date);
			java.sql.Date sqlToday = new java.sql.Date(dateFormat.parse(utilDate).getTime());
			System.out.println("sql Date =" +sqlToday);
			
			TransactionsTO to = new TransactionsTO();
			to.setAmount(1500);
			to.setPersonId(1);
			to.setCreditCardNum("1242353543");
			to.setBankAccountNum("");
			to.setCreditOrDebit("D");
			to.setTransactionDate(sqlToday);
			to.setTime(timeFormat.format(date));
			
			Gson gson = new Gson();
			String json = gson.toJson(to);
			service.makePayment(json);
			fail("Not yet implemented");
			
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}
