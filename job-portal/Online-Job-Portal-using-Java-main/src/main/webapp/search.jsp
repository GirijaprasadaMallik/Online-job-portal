<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_component/navbar.jsp"%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">Search Results</h5>
                
                <%
                String category = request.getParameter("category");
                String location = request.getParameter("location");
                
                JobDAO dao = new JobDAO(DBConnect.getconn());
                List<Jobs> list = null;
                
                if(category != null && location != null) {
                    // If both parameters are provided, search for exact matches
                    list = dao.getJobsAndLocationAndCate(category, location);
                    
                    if(list.isEmpty()) {
                        // If no exact matches, try broader search
                        list = dao.getJobsORLocationAndCate(category, location);
                    }
                }
                
                if(list != null) {
                    for(Jobs j : list) {
                %>
                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>
                            
                            <h6><%= j.getTitle() %></h6>
                            <p><%= j.getDescription() %></p>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" 
                                           value="Location: <%= j.getLocation() %>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" 
                                           value="Category: <%= j.getCategory() %>" readonly>
                                </div>
                            </div>
                            <h6>Publish Date: <%= j.getPdate().toString() %></h6>
                            <div class="text-center">
                                <a href="view_jobs.jsp?id=<%= j.getId() %>" 
                                   class="btn btn-sm bg-success text-white">View More</a>
                            </div>
                        </div>
                    </div>
                <%
                    }
                } else {
                %>
                    <div class="text-center">
                        <h6 class="text-danger">No jobs found matching your search criteria</h6>
                    </div>
                <%
                }
                %>
            </div>
        </div>
    </div>
</body>
</html>