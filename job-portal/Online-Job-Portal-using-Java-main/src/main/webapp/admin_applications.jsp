<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dao.JobApplicationDAO, com.DB.DBConnect, java.util.List, com.entity.JobApplication" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Job Applications</title>
    <%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_component/navbar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All Job Applications</h5>
                
                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">${succMsg}</div>
                    <c:remove var="succMsg" scope="session" />
                </c:if>
                
                <%
                    JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getconn());
                    List<JobApplication> list = dao.getAllApplications();
                    for(JobApplication app : list) {
                %>
                <div class="card mt-2">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-2x"></i>
                        </div>
                        
                        <h6>Job Title: <%= app.getJobTitle() %></h6>
                        <p>Applicant: <%= app.getUserName() %> (<%= app.getUserEmail() %>)</p>
                        <p>Qualification: <%= app.getQualification() %></p>
                        <p>Application Date: <%= app.getApplicationDate() %></p>
                        <p>Status: <%= app.getStatus() %></p>
                        <p>Comments: <%= app.getComments() %></p>
                        
                        <div class="form-row">
                            <form action="update_application_status" method="post" class="mr-2">
                                <input type="hidden" name="id" value="<%= app.getId() %>">
                                <select name="status" class="form-control form-control-sm d-inline" style="width: auto;">
                                    <option value="Pending" <%= app.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                                    <option value="Approved" <%= app.getStatus().equals("Approved") ? "selected" : "" %>>Approved</option>
                                    <option value="Rejected" <%= app.getStatus().equals("Rejected") ? "selected" : "" %>>Rejected</option>
                                </select>
                                <button type="submit" class="btn btn-sm btn-primary">Update Status</button>
                            </form>
                            <form action="update_application_status" method="post">
                                <input type="hidden" name="id" value="<%= app.getId() %>">
                                <input type="hidden" name="status" value="Declined">
                                <button type="submit" class="btn btn-sm btn-danger">Decline & Delete</button>
                            </form>
                        </div>
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