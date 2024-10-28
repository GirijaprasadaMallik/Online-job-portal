<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.JobApplicationDAO"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.JobApplication"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Applications</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_component/navbar.jsp"%>
    
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">My Applications</h5>
                
                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">${succMsg}</div>
                    <c:remove var="succMsg" />
                </c:if>

                <%
                User user = (User) session.getAttribute("userobj");
                JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getconn());
                List<JobApplication> applications = dao.getApplicationsByUser(user.getId());
                
                if(applications != null && applications.size() > 0) {
                    for(JobApplication app : applications) {
                %>
                <div class="card mt-2">
                    <div class="card-body">
                        <div class="text-primary">
                            <i class="fas fa-clipboard-list"></i>
                            <h6><%=app.getJobTitle()%></h6>
                        </div>
                        
                        <p><strong>Application Date:</strong> <%=app.getApplicationDate()%></p>
                        <p><strong>Status:</strong> <span class="badge badge-info"><%=app.getStatus()%></span></p>
                        <p><strong>Comments:</strong> <%=app.getComments()%></p>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="card mt-2">
                    <div class="card-body text-center">
                        <p>No applications found</p>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </div>
</body>
</html>