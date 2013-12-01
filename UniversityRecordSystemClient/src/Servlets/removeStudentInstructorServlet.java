package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.UniversityServiceProxy;

/**
 * Servlet implementation class removeStudentInstructorServlet
 */
public class removeStudentInstructorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeStudentInstructorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int personId = Integer.parseInt(request.getParameter("personId"));
		String flag = request.getParameter("flag");
		
		Services.UniversityServiceProxy proxy = new UniversityServiceProxy();
		proxy.setEndpoint("http://localhost:8081/UniversityRecordSystem/services/UniversityService");
		String msg = proxy.removeStudentInstructor(personId, flag);
		response.getWriter().write(msg);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
