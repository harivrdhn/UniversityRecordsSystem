/**
 * UniversityService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Services;

public interface UniversityService extends java.rmi.Remote {
    public java.lang.String changePassword(int personId, java.lang.String confirmPassword) throws java.rmi.RemoteException;
    public java.lang.String getTransactions(int personId) throws java.rmi.RemoteException;
    public java.lang.String removeStudentInstructor(int personId, java.lang.String flag) throws java.rmi.RemoteException;
    public java.lang.String removeInstructorFromCourse(int instructorId, int courseId) throws java.rmi.RemoteException;
    public java.lang.String displayAllInstructors() throws java.rmi.RemoteException;
    public java.lang.String viewPendingChangeRequests(java.lang.String requestType) throws java.rmi.RemoteException;
    public java.lang.String getStudentDetails(int personId) throws java.rmi.RemoteException;
    public java.lang.String getLoginDetails(java.lang.String username, java.lang.String password) throws java.rmi.RemoteException;
    public java.lang.String generateSearchQuery(int courseId, java.lang.String courseName, java.lang.String deptName) throws java.rmi.RemoteException;
    public java.lang.String searchForClasses(int courseId, java.lang.String courseName, java.lang.String deptName) throws java.rmi.RemoteException;
    public java.lang.String enrollStudent(int studentId, java.lang.String courseId) throws java.rmi.RemoteException;
    public java.lang.String getCourseDetails(int courseId) throws java.rmi.RemoteException;
    public java.lang.String getInstructorDetails(int personId) throws java.rmi.RemoteException;
    public java.lang.String createStudent(java.lang.String details) throws java.rmi.RemoteException;
    public java.lang.String createInstructor(java.lang.String details) throws java.rmi.RemoteException;
    public java.lang.String assignInstructor(int instructorId, int courseId) throws java.rmi.RemoteException;
    public java.lang.String displayAllStudents() throws java.rmi.RemoteException;
    public java.lang.String displayAllCourses() throws java.rmi.RemoteException;
    public java.lang.String unenrollStudent(int studentId, java.lang.String courseId) throws java.rmi.RemoteException;
    public java.lang.String editPersonDetails(java.lang.String details) throws java.rmi.RemoteException;
    public java.lang.String editCourseDetails(java.lang.String details, int courseId) throws java.rmi.RemoteException;
    public java.lang.String getCourseListForStudent(int studentId, java.lang.String flag) throws java.rmi.RemoteException;
    public java.lang.String replaceIstrucForCourse(int instructorId, int courseId) throws java.rmi.RemoteException;
    public java.lang.String createCourse(java.lang.String details) throws java.rmi.RemoteException;
    public java.lang.String removeCourse(int courseId) throws java.rmi.RemoteException;
    public java.lang.String makePayment(java.lang.String transaction) throws java.rmi.RemoteException;
    public java.lang.String submitChangeRequest(java.lang.String details) throws java.rmi.RemoteException;
    public java.lang.String getChargesDue(int personId) throws java.rmi.RemoteException;
}
