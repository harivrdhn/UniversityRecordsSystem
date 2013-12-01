package Services;

public class UniversityServiceProxy implements Services.UniversityService {
  private String _endpoint = null;
  private Services.UniversityService universityService = null;
  
  public UniversityServiceProxy() {
    _initUniversityServiceProxy();
  }
  
  public UniversityServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initUniversityServiceProxy();
  }
  
  private void _initUniversityServiceProxy() {
    try {
      universityService = (new Services.UniversityServiceServiceLocator()).getUniversityService();
      if (universityService != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)universityService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)universityService)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (universityService != null)
      ((javax.xml.rpc.Stub)universityService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public Services.UniversityService getUniversityService() {
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService;
  }
  
  public java.lang.String changePassword(int personId, java.lang.String confirmPassword) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.changePassword(personId, confirmPassword);
  }
  
  public java.lang.String getTransactions(int personId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getTransactions(personId);
  }
  
  public java.lang.String removeStudentInstructor(int personId, java.lang.String flag) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.removeStudentInstructor(personId, flag);
  }
  
  public java.lang.String removeInstructorFromCourse(int instructorId, int courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.removeInstructorFromCourse(instructorId, courseId);
  }
  
  public java.lang.String displayAllInstructors() throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.displayAllInstructors();
  }
  
  public java.lang.String viewPendingChangeRequests(java.lang.String requestType) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.viewPendingChangeRequests(requestType);
  }
  
  public java.lang.String getStudentDetails(int personId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getStudentDetails(personId);
  }
  
  public java.lang.String getLoginDetails(java.lang.String username, java.lang.String password) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getLoginDetails(username, password);
  }
  
  public java.lang.String generateSearchQuery(int courseId, java.lang.String courseName, java.lang.String deptName) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.generateSearchQuery(courseId, courseName, deptName);
  }
  
  public java.lang.String searchForClasses(int courseId, java.lang.String courseName, java.lang.String deptName) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.searchForClasses(courseId, courseName, deptName);
  }
  
  public java.lang.String enrollStudent(int studentId, java.lang.String courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.enrollStudent(studentId, courseId);
  }
  
  public java.lang.String getCourseDetails(int courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getCourseDetails(courseId);
  }
  
  public java.lang.String getInstructorDetails(int personId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getInstructorDetails(personId);
  }
  
  public java.lang.String createStudent(java.lang.String details) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.createStudent(details);
  }
  
  public java.lang.String createInstructor(java.lang.String details) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.createInstructor(details);
  }
  
  public java.lang.String assignInstructor(int instructorId, int courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.assignInstructor(instructorId, courseId);
  }
  
  public java.lang.String displayAllStudents() throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.displayAllStudents();
  }
  
  public java.lang.String displayAllCourses() throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.displayAllCourses();
  }
  
  public java.lang.String unenrollStudent(int studentId, java.lang.String courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.unenrollStudent(studentId, courseId);
  }
  
  public java.lang.String editPersonDetails(java.lang.String details) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.editPersonDetails(details);
  }
  
  public java.lang.String editCourseDetails(java.lang.String details, int courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.editCourseDetails(details, courseId);
  }
  
  public java.lang.String getCourseListForStudent(int studentId, java.lang.String flag) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getCourseListForStudent(studentId, flag);
  }
  
  public java.lang.String replaceIstrucForCourse(int instructorId, int courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.replaceIstrucForCourse(instructorId, courseId);
  }
  
  public java.lang.String createCourse(java.lang.String details) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.createCourse(details);
  }
  
  public java.lang.String removeCourse(int courseId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.removeCourse(courseId);
  }
  
  public java.lang.String makePayment(java.lang.String transaction) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.makePayment(transaction);
  }
  
  public java.lang.String submitChangeRequest(java.lang.String details) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.submitChangeRequest(details);
  }
  
  public java.lang.String getChargesDue(int personId) throws java.rmi.RemoteException{
    if (universityService == null)
      _initUniversityServiceProxy();
    return universityService.getChargesDue(personId);
  }
  
  
}