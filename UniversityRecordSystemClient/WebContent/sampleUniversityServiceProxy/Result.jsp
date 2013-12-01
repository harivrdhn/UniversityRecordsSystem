<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleUniversityServiceProxyid" scope="session" class="Services.UniversityServiceProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleUniversityServiceProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleUniversityServiceProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleUniversityServiceProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        Services.UniversityService getUniversityService10mtemp = sampleUniversityServiceProxyid.getUniversityService();
if(getUniversityService10mtemp == null){
%>
<%=getUniversityService10mtemp %>
<%
}else{
        if(getUniversityService10mtemp!= null){
        String tempreturnp11 = getUniversityService10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String personId_1id=  request.getParameter("personId16");
        int personId_1idTemp  = Integer.parseInt(personId_1id);
        String confirmPassword_2id=  request.getParameter("confirmPassword18");
            java.lang.String confirmPassword_2idTemp = null;
        if(!confirmPassword_2id.equals("")){
         confirmPassword_2idTemp  = confirmPassword_2id;
        }
        java.lang.String changePassword13mtemp = sampleUniversityServiceProxyid.changePassword(personId_1idTemp,confirmPassword_2idTemp);
if(changePassword13mtemp == null){
%>
<%=changePassword13mtemp %>
<%
}else{
        String tempResultreturnp14 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(changePassword13mtemp));
        %>
        <%= tempResultreturnp14 %>
        <%
}
break;
case 20:
        gotMethod = true;
        String personId_3id=  request.getParameter("personId23");
        int personId_3idTemp  = Integer.parseInt(personId_3id);
        java.lang.String getTransactions20mtemp = sampleUniversityServiceProxyid.getTransactions(personId_3idTemp);
if(getTransactions20mtemp == null){
%>
<%=getTransactions20mtemp %>
<%
}else{
        String tempResultreturnp21 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getTransactions20mtemp));
        %>
        <%= tempResultreturnp21 %>
        <%
}
break;
case 25:
        gotMethod = true;
        String personId_4id=  request.getParameter("personId28");
        int personId_4idTemp  = Integer.parseInt(personId_4id);
        String flag_5id=  request.getParameter("flag30");
            java.lang.String flag_5idTemp = null;
        if(!flag_5id.equals("")){
         flag_5idTemp  = flag_5id;
        }
        java.lang.String removeStudentInstructor25mtemp = sampleUniversityServiceProxyid.removeStudentInstructor(personId_4idTemp,flag_5idTemp);
if(removeStudentInstructor25mtemp == null){
%>
<%=removeStudentInstructor25mtemp %>
<%
}else{
        String tempResultreturnp26 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(removeStudentInstructor25mtemp));
        %>
        <%= tempResultreturnp26 %>
        <%
}
break;
case 32:
        gotMethod = true;
        String instructorId_6id=  request.getParameter("instructorId35");
        int instructorId_6idTemp  = Integer.parseInt(instructorId_6id);
        String courseId_7id=  request.getParameter("courseId37");
        int courseId_7idTemp  = Integer.parseInt(courseId_7id);
        java.lang.String removeInstructorFromCourse32mtemp = sampleUniversityServiceProxyid.removeInstructorFromCourse(instructorId_6idTemp,courseId_7idTemp);
if(removeInstructorFromCourse32mtemp == null){
%>
<%=removeInstructorFromCourse32mtemp %>
<%
}else{
        String tempResultreturnp33 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(removeInstructorFromCourse32mtemp));
        %>
        <%= tempResultreturnp33 %>
        <%
}
break;
case 39:
        gotMethod = true;
        java.lang.String displayAllInstructors39mtemp = sampleUniversityServiceProxyid.displayAllInstructors();
if(displayAllInstructors39mtemp == null){
%>
<%=displayAllInstructors39mtemp %>
<%
}else{
        String tempResultreturnp40 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(displayAllInstructors39mtemp));
        %>
        <%= tempResultreturnp40 %>
        <%
}
break;
case 42:
        gotMethod = true;
        String requestType_8id=  request.getParameter("requestType45");
            java.lang.String requestType_8idTemp = null;
        if(!requestType_8id.equals("")){
         requestType_8idTemp  = requestType_8id;
        }
        java.lang.String viewPendingChangeRequests42mtemp = sampleUniversityServiceProxyid.viewPendingChangeRequests(requestType_8idTemp);
if(viewPendingChangeRequests42mtemp == null){
%>
<%=viewPendingChangeRequests42mtemp %>
<%
}else{
        String tempResultreturnp43 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(viewPendingChangeRequests42mtemp));
        %>
        <%= tempResultreturnp43 %>
        <%
}
break;
case 47:
        gotMethod = true;
        String personId_9id=  request.getParameter("personId50");
        int personId_9idTemp  = Integer.parseInt(personId_9id);
        java.lang.String getStudentDetails47mtemp = sampleUniversityServiceProxyid.getStudentDetails(personId_9idTemp);
if(getStudentDetails47mtemp == null){
%>
<%=getStudentDetails47mtemp %>
<%
}else{
        String tempResultreturnp48 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getStudentDetails47mtemp));
        %>
        <%= tempResultreturnp48 %>
        <%
}
break;
case 52:
        gotMethod = true;
        String username_10id=  request.getParameter("username55");
            java.lang.String username_10idTemp = null;
        if(!username_10id.equals("")){
         username_10idTemp  = username_10id;
        }
        String password_11id=  request.getParameter("password57");
            java.lang.String password_11idTemp = null;
        if(!password_11id.equals("")){
         password_11idTemp  = password_11id;
        }
        java.lang.String getLoginDetails52mtemp = sampleUniversityServiceProxyid.getLoginDetails(username_10idTemp,password_11idTemp);
if(getLoginDetails52mtemp == null){
%>
<%=getLoginDetails52mtemp %>
<%
}else{
        String tempResultreturnp53 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getLoginDetails52mtemp));
        %>
        <%= tempResultreturnp53 %>
        <%
}
break;
case 59:
        gotMethod = true;
        String courseId_12id=  request.getParameter("courseId62");
        int courseId_12idTemp  = Integer.parseInt(courseId_12id);
        String courseName_13id=  request.getParameter("courseName64");
            java.lang.String courseName_13idTemp = null;
        if(!courseName_13id.equals("")){
         courseName_13idTemp  = courseName_13id;
        }
        String deptName_14id=  request.getParameter("deptName66");
            java.lang.String deptName_14idTemp = null;
        if(!deptName_14id.equals("")){
         deptName_14idTemp  = deptName_14id;
        }
        java.lang.String generateSearchQuery59mtemp = sampleUniversityServiceProxyid.generateSearchQuery(courseId_12idTemp,courseName_13idTemp,deptName_14idTemp);
if(generateSearchQuery59mtemp == null){
%>
<%=generateSearchQuery59mtemp %>
<%
}else{
        String tempResultreturnp60 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(generateSearchQuery59mtemp));
        %>
        <%= tempResultreturnp60 %>
        <%
}
break;
case 68:
        gotMethod = true;
        String courseId_15id=  request.getParameter("courseId71");
        int courseId_15idTemp  = Integer.parseInt(courseId_15id);
        String courseName_16id=  request.getParameter("courseName73");
            java.lang.String courseName_16idTemp = null;
        if(!courseName_16id.equals("")){
         courseName_16idTemp  = courseName_16id;
        }
        String deptName_17id=  request.getParameter("deptName75");
            java.lang.String deptName_17idTemp = null;
        if(!deptName_17id.equals("")){
         deptName_17idTemp  = deptName_17id;
        }
        java.lang.String searchForClasses68mtemp = sampleUniversityServiceProxyid.searchForClasses(courseId_15idTemp,courseName_16idTemp,deptName_17idTemp);
if(searchForClasses68mtemp == null){
%>
<%=searchForClasses68mtemp %>
<%
}else{
        String tempResultreturnp69 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(searchForClasses68mtemp));
        %>
        <%= tempResultreturnp69 %>
        <%
}
break;
case 77:
        gotMethod = true;
        String studentId_18id=  request.getParameter("studentId80");
        int studentId_18idTemp  = Integer.parseInt(studentId_18id);
        String courseId_19id=  request.getParameter("courseId82");
            java.lang.String courseId_19idTemp = null;
        if(!courseId_19id.equals("")){
         courseId_19idTemp  = courseId_19id;
        }
        java.lang.String enrollStudent77mtemp = sampleUniversityServiceProxyid.enrollStudent(studentId_18idTemp,courseId_19idTemp);
if(enrollStudent77mtemp == null){
%>
<%=enrollStudent77mtemp %>
<%
}else{
        String tempResultreturnp78 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(enrollStudent77mtemp));
        %>
        <%= tempResultreturnp78 %>
        <%
}
break;
case 84:
        gotMethod = true;
        String courseId_20id=  request.getParameter("courseId87");
        int courseId_20idTemp  = Integer.parseInt(courseId_20id);
        java.lang.String getCourseDetails84mtemp = sampleUniversityServiceProxyid.getCourseDetails(courseId_20idTemp);
if(getCourseDetails84mtemp == null){
%>
<%=getCourseDetails84mtemp %>
<%
}else{
        String tempResultreturnp85 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getCourseDetails84mtemp));
        %>
        <%= tempResultreturnp85 %>
        <%
}
break;
case 89:
        gotMethod = true;
        String personId_21id=  request.getParameter("personId92");
        int personId_21idTemp  = Integer.parseInt(personId_21id);
        java.lang.String getInstructorDetails89mtemp = sampleUniversityServiceProxyid.getInstructorDetails(personId_21idTemp);
if(getInstructorDetails89mtemp == null){
%>
<%=getInstructorDetails89mtemp %>
<%
}else{
        String tempResultreturnp90 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getInstructorDetails89mtemp));
        %>
        <%= tempResultreturnp90 %>
        <%
}
break;
case 94:
        gotMethod = true;
        String details_22id=  request.getParameter("details97");
            java.lang.String details_22idTemp = null;
        if(!details_22id.equals("")){
         details_22idTemp  = details_22id;
        }
        java.lang.String createStudent94mtemp = sampleUniversityServiceProxyid.createStudent(details_22idTemp);
if(createStudent94mtemp == null){
%>
<%=createStudent94mtemp %>
<%
}else{
        String tempResultreturnp95 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createStudent94mtemp));
        %>
        <%= tempResultreturnp95 %>
        <%
}
break;
case 99:
        gotMethod = true;
        String details_23id=  request.getParameter("details102");
            java.lang.String details_23idTemp = null;
        if(!details_23id.equals("")){
         details_23idTemp  = details_23id;
        }
        java.lang.String createInstructor99mtemp = sampleUniversityServiceProxyid.createInstructor(details_23idTemp);
if(createInstructor99mtemp == null){
%>
<%=createInstructor99mtemp %>
<%
}else{
        String tempResultreturnp100 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createInstructor99mtemp));
        %>
        <%= tempResultreturnp100 %>
        <%
}
break;
case 104:
        gotMethod = true;
        String instructorId_24id=  request.getParameter("instructorId107");
        int instructorId_24idTemp  = Integer.parseInt(instructorId_24id);
        String courseId_25id=  request.getParameter("courseId109");
        int courseId_25idTemp  = Integer.parseInt(courseId_25id);
        java.lang.String assignInstructor104mtemp = sampleUniversityServiceProxyid.assignInstructor(instructorId_24idTemp,courseId_25idTemp);
if(assignInstructor104mtemp == null){
%>
<%=assignInstructor104mtemp %>
<%
}else{
        String tempResultreturnp105 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(assignInstructor104mtemp));
        %>
        <%= tempResultreturnp105 %>
        <%
}
break;
case 111:
        gotMethod = true;
        java.lang.String displayAllStudents111mtemp = sampleUniversityServiceProxyid.displayAllStudents();
if(displayAllStudents111mtemp == null){
%>
<%=displayAllStudents111mtemp %>
<%
}else{
        String tempResultreturnp112 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(displayAllStudents111mtemp));
        %>
        <%= tempResultreturnp112 %>
        <%
}
break;
case 114:
        gotMethod = true;
        java.lang.String displayAllCourses114mtemp = sampleUniversityServiceProxyid.displayAllCourses();
if(displayAllCourses114mtemp == null){
%>
<%=displayAllCourses114mtemp %>
<%
}else{
        String tempResultreturnp115 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(displayAllCourses114mtemp));
        %>
        <%= tempResultreturnp115 %>
        <%
}
break;
case 117:
        gotMethod = true;
        String studentId_26id=  request.getParameter("studentId120");
        int studentId_26idTemp  = Integer.parseInt(studentId_26id);
        String courseId_27id=  request.getParameter("courseId122");
            java.lang.String courseId_27idTemp = null;
        if(!courseId_27id.equals("")){
         courseId_27idTemp  = courseId_27id;
        }
        java.lang.String unenrollStudent117mtemp = sampleUniversityServiceProxyid.unenrollStudent(studentId_26idTemp,courseId_27idTemp);
if(unenrollStudent117mtemp == null){
%>
<%=unenrollStudent117mtemp %>
<%
}else{
        String tempResultreturnp118 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(unenrollStudent117mtemp));
        %>
        <%= tempResultreturnp118 %>
        <%
}
break;
case 124:
        gotMethod = true;
        String details_28id=  request.getParameter("details127");
            java.lang.String details_28idTemp = null;
        if(!details_28id.equals("")){
         details_28idTemp  = details_28id;
        }
        java.lang.String editPersonDetails124mtemp = sampleUniversityServiceProxyid.editPersonDetails(details_28idTemp);
if(editPersonDetails124mtemp == null){
%>
<%=editPersonDetails124mtemp %>
<%
}else{
        String tempResultreturnp125 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(editPersonDetails124mtemp));
        %>
        <%= tempResultreturnp125 %>
        <%
}
break;
case 129:
        gotMethod = true;
        String details_29id=  request.getParameter("details132");
            java.lang.String details_29idTemp = null;
        if(!details_29id.equals("")){
         details_29idTemp  = details_29id;
        }
        String courseId_30id=  request.getParameter("courseId134");
        int courseId_30idTemp  = Integer.parseInt(courseId_30id);
        java.lang.String editCourseDetails129mtemp = sampleUniversityServiceProxyid.editCourseDetails(details_29idTemp,courseId_30idTemp);
if(editCourseDetails129mtemp == null){
%>
<%=editCourseDetails129mtemp %>
<%
}else{
        String tempResultreturnp130 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(editCourseDetails129mtemp));
        %>
        <%= tempResultreturnp130 %>
        <%
}
break;
case 136:
        gotMethod = true;
        String studentId_31id=  request.getParameter("studentId139");
        int studentId_31idTemp  = Integer.parseInt(studentId_31id);
        String flag_32id=  request.getParameter("flag141");
            java.lang.String flag_32idTemp = null;
        if(!flag_32id.equals("")){
         flag_32idTemp  = flag_32id;
        }
        java.lang.String getCourseListForStudent136mtemp = sampleUniversityServiceProxyid.getCourseListForStudent(studentId_31idTemp,flag_32idTemp);
if(getCourseListForStudent136mtemp == null){
%>
<%=getCourseListForStudent136mtemp %>
<%
}else{
        String tempResultreturnp137 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getCourseListForStudent136mtemp));
        %>
        <%= tempResultreturnp137 %>
        <%
}
break;
case 143:
        gotMethod = true;
        String instructorId_33id=  request.getParameter("instructorId146");
        int instructorId_33idTemp  = Integer.parseInt(instructorId_33id);
        String courseId_34id=  request.getParameter("courseId148");
        int courseId_34idTemp  = Integer.parseInt(courseId_34id);
        java.lang.String replaceIstrucForCourse143mtemp = sampleUniversityServiceProxyid.replaceIstrucForCourse(instructorId_33idTemp,courseId_34idTemp);
if(replaceIstrucForCourse143mtemp == null){
%>
<%=replaceIstrucForCourse143mtemp %>
<%
}else{
        String tempResultreturnp144 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(replaceIstrucForCourse143mtemp));
        %>
        <%= tempResultreturnp144 %>
        <%
}
break;
case 150:
        gotMethod = true;
        String details_35id=  request.getParameter("details153");
            java.lang.String details_35idTemp = null;
        if(!details_35id.equals("")){
         details_35idTemp  = details_35id;
        }
        java.lang.String createCourse150mtemp = sampleUniversityServiceProxyid.createCourse(details_35idTemp);
if(createCourse150mtemp == null){
%>
<%=createCourse150mtemp %>
<%
}else{
        String tempResultreturnp151 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(createCourse150mtemp));
        %>
        <%= tempResultreturnp151 %>
        <%
}
break;
case 155:
        gotMethod = true;
        String courseId_36id=  request.getParameter("courseId158");
        int courseId_36idTemp  = Integer.parseInt(courseId_36id);
        java.lang.String removeCourse155mtemp = sampleUniversityServiceProxyid.removeCourse(courseId_36idTemp);
if(removeCourse155mtemp == null){
%>
<%=removeCourse155mtemp %>
<%
}else{
        String tempResultreturnp156 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(removeCourse155mtemp));
        %>
        <%= tempResultreturnp156 %>
        <%
}
break;
case 160:
        gotMethod = true;
        String transaction_37id=  request.getParameter("transaction163");
            java.lang.String transaction_37idTemp = null;
        if(!transaction_37id.equals("")){
         transaction_37idTemp  = transaction_37id;
        }
        java.lang.String makePayment160mtemp = sampleUniversityServiceProxyid.makePayment(transaction_37idTemp);
if(makePayment160mtemp == null){
%>
<%=makePayment160mtemp %>
<%
}else{
        String tempResultreturnp161 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(makePayment160mtemp));
        %>
        <%= tempResultreturnp161 %>
        <%
}
break;
case 165:
        gotMethod = true;
        String details_38id=  request.getParameter("details168");
            java.lang.String details_38idTemp = null;
        if(!details_38id.equals("")){
         details_38idTemp  = details_38id;
        }
        java.lang.String submitChangeRequest165mtemp = sampleUniversityServiceProxyid.submitChangeRequest(details_38idTemp);
if(submitChangeRequest165mtemp == null){
%>
<%=submitChangeRequest165mtemp %>
<%
}else{
        String tempResultreturnp166 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(submitChangeRequest165mtemp));
        %>
        <%= tempResultreturnp166 %>
        <%
}
break;
case 170:
        gotMethod = true;
        String personId_39id=  request.getParameter("personId173");
        int personId_39idTemp  = Integer.parseInt(personId_39id);
        java.lang.String getChargesDue170mtemp = sampleUniversityServiceProxyid.getChargesDue(personId_39idTemp);
if(getChargesDue170mtemp == null){
%>
<%=getChargesDue170mtemp %>
<%
}else{
        String tempResultreturnp171 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getChargesDue170mtemp));
        %>
        <%= tempResultreturnp171 %>
        <%
}
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>