package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.UniversityServiceProxy;

/**
 * Servlet implementation class removeInstructorForCourseServlet
 */
public class removeInstructorForCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeInstructorForCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int instructorId = Integer.parseInt(request.getParameter("personId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		
		Services.UniversityServiceProxy proxy = new UniversityServiceProxy();
		proxy.setEndpoint("http://localhost:8081/UniversityRecordSystem/services/UniversityService");
		String msg = proxy.removeInstructorFromCourse(instructorId, courseId);
		response.getWriter().write(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
