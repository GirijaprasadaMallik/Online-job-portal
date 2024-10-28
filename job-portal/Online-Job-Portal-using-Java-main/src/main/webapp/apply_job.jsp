<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Jobs"%>
<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply Job</title>
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
                <div class="card">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="fas fa-user-plus fa-2x"></i>
                            <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            JobDAO dao = new JobDAO(DBConnect.getconn());
                            Jobs job = dao.getJobById(id);
                            %>
                            <h5>Apply for <%=job.getTitle()%></h5>
                        </div>
                        
                        <form action="apply_job" method="post">
                            <input type="hidden" name="job_id" value="<%=id%>">
                            
                            <div class="form-group">
                                <label>Job Title</label>
                                <input type="text" class="form-control" value="<%=job.getTitle()%>" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Location</label>
                                <input type="text" class="form-control" value="<%=job.getLocation()%>" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" class="form-control" value="<%=job.getCategory()%>" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Comments/Cover Letter <span class="text-danger">*</span></label>
                                <textarea name="comments" class="form-control" rows="4" required></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit Application</button>
                            <a href="home.jsp" class="btn btn-secondary">Cancel</a>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>