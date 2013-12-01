/**
 * UniversityServiceServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Services;

public class UniversityServiceServiceLocator extends org.apache.axis.client.Service implements Services.UniversityServiceService {

    public UniversityServiceServiceLocator() {
    }


    public UniversityServiceServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public UniversityServiceServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for UniversityService
    private java.lang.String UniversityService_address = "http://localhost:8081/UniversityRecordSystem/services/UniversityService";

    public java.lang.String getUniversityServiceAddress() {
        return UniversityService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String UniversityServiceWSDDServiceName = "UniversityService";

    public java.lang.String getUniversityServiceWSDDServiceName() {
        return UniversityServiceWSDDServiceName;
    }

    public void setUniversityServiceWSDDServiceName(java.lang.String name) {
        UniversityServiceWSDDServiceName = name;
    }

    public Services.UniversityService getUniversityService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(UniversityService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getUniversityService(endpoint);
    }

    public Services.UniversityService getUniversityService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            Services.UniversityServiceSoapBindingStub _stub = new Services.UniversityServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getUniversityServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setUniversityServiceEndpointAddress(java.lang.String address) {
        UniversityService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (Services.UniversityService.class.isAssignableFrom(serviceEndpointInterface)) {
                Services.UniversityServiceSoapBindingStub _stub = new Services.UniversityServiceSoapBindingStub(new java.net.URL(UniversityService_address), this);
                _stub.setPortName(getUniversityServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("UniversityService".equals(inputPortName)) {
            return getUniversityService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://Services", "UniversityServiceService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://Services", "UniversityService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("UniversityService".equals(portName)) {
            setUniversityServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
