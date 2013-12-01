package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ServiceTO.StudentTO;
import Services.UniversityServiceProxy;

import com.google.gson.Gson;

/**
 * Servlet implementation class editPersonDetailsServlet
 */
public class editPersonDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editPersonDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int personId = Integer.parseInt(request.getParameter("personId"));
		String addressLine = request.getParameter("addressLine");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		StudentTO personTO = new StudentTO();
		personTO.setStudentId(personId);
		personTO.setAddressLine(addressLine);
		personTO.setCity(city);
		personTO.setState(state);
		personTO.setZip(Integer.parseInt(zip));
		Gson gson = new Gson();
		String json = gson.toJson(personTO);
		Services.UniversityServiceProxy proxy = new UniversityServiceProxy();
		proxy.setEndpoint("http://localhost:8081/UniversityRecordSystem/services/UniversityService");
		String msg = proxy.editPersonDetails(json);
		response.getWriter().write(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
