<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply for Job</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_component/navbar.jsp"%>
    <div class="container p-2">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <div class="text-center text-success">
                        <i class="fas fa-user-md fa-3x"></i>
                        <h5>Apply for Job</h5>
                    </div>
                    <c:if test="${not empty userobj}">
                        <form action="apply_job" method="post">
                            <input type="hidden" name="job_id" value="${param.id}">
                            
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" value="${userobj.name}" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" value="${userobj.email}" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Qualification</label>
                                <input type="text" class="form-control" value="${userobj.qualification}" readonly>
                            </div>
                            
                            <!-- You can add more fields here if needed -->
                            
                            <div class="form-group">
                                <label>Additional Comments</label>
                                <textarea class="form-control" name="comments" rows="3"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-success">Submit Application</button>
                        </form>
                    </c:if>
                    <c:if test="${empty userobj}">
                        <h5 class="text-center text-danger">Please login to apply for this job</h5>
                        <div class="text-center mt-2">
                            <a href="login.jsp" class="btn btn-primary">Login</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>