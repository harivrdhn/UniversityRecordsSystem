package Servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ServiceTO.TransactionsTO;
import Services.UniversityServiceProxy;

/**
 * Servlet implementation class makePaymentServlet
 */
public class makePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public makePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		int personId = Integer.parseInt(request.getParameter("personId"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		String creditOrDebit = request.getParameter("creditOrDebit");
		String bankAccNum = request.getParameter("bankAccNum");
		String creditCardNum = request.getParameter("creditCardNum");
		
		//***********************************************************************************************************
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		String utilDate = dateFormat.format(date);
		java.sql.Date sqlToday;
		sqlToday = new java.sql.Date(dateFormat.parse(utilDate).getTime());
		
		TransactionsTO to = new TransactionsTO();
		to.setPersonId(personId);
		to.setAmount(amount);
		to.setTransactionDate(sqlToday);
		to.setTime(timeFormat.format(date));
		to.setCreditOrDebit(creditOrDebit);
		if(bankAccNum != null)
			to.setBankAccountNum(bankAccNum);
		if(creditCardNum != null)
			to.setCreditCardNum(creditCardNum);
		
		Gson gson = new Gson();
		String json = gson.toJson(to);
		//***********************************************************************************************************
		
		Services.UniversityServiceProxy proxy = new UniversityServiceProxy();
		proxy.setEndpoint("http://localhost:8081/UniversityRecordSystem/services/UniversityService");
		String courseList = proxy.makePayment(json);
		response.getWriter().write(courseList);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
