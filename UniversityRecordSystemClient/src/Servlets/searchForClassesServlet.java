package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.UniversityServiceProxy;

/**
 * Servlet implementation class searchForClassesServlet
 */
public class searchForClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchForClassesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String deptName = null;
		int courseId = 0;
		String courseName = null;
		String flag = request.getParameter("flag");
		
		if(request.getParameter("deptName") != null && request.getParameter("deptName") != ""){
			deptName = request.getParameter("deptName");
		}
		if(request.getParameter("courseId") != null && request.getParameter("courseId") != "" )	 
		{
			courseId  = Integer.parseInt(request.getParameter("courseId"));
		}
		if(request.getParameter("courseName") != null  && request.getParameter("courseName") != "")	 
		{
		courseName = request.getParameter("courseName");}
		
		Services.UniversityServiceProxy proxy = new UniversityServiceProxy();
		proxy.setEndpoint("http://localhost:8081/UniversityRecordSystem/services/UniversityService");
		String msg = proxy.searchForClasses(courseId,courseName,deptName);
		response.getWriter().write(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
