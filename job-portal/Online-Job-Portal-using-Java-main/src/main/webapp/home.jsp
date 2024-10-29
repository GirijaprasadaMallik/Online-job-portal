<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Jobs"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User: View Jobs</title>
    <%@include file="all_component/all_css.jsp"%>
    <style>
        .job-card {
            transition: transform 0.3s;
            border: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .search-section {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .job-icon {
            color: #007bff;
            margin-bottom: 15px;
        }
        .badge-custom {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin-right: 5px;
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_component/navbar.jsp"%>
    
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>
    
    <div class="container mt-4">
        <!-- Alert Messages -->
        <c:if test="${not empty succMsg}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${succMsg}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <c:remove var="succMsg" />
        </c:if>

        <!-- Search Section -->
        <div class="search-section">
            <form class="form-row" action="search_jobs" method="GET">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Location</label>
                        <input type="text" class="form-control" name="location" 
                               placeholder="Enter location...">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Category</label>
                        <select class="form-control" name="category">
                            <option value="">Select Category</option>
                            <option value="IT">IT</option>
                            <option value="Developer">Developer</option>
                            <option value="Banking">Banking</option>
                            <option value="Engineer">Engineer</option>
                            <option value="Teacher">Teacher</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>&nbsp;</label>
                        <button type="submit" class="btn btn-primary btn-block">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Jobs List -->
        <div class="row">
            <%
            JobDAO dao = new JobDAO(DBConnect.getconn());
            List<Jobs> list = dao.getAllJobs();
            for (Jobs j : list) {
            %>
            <div class="col-md-6 mb-4">
                <div class="card job-card">
                    <div class="card-body">
                        <div class="text-center job-icon">
                            <i class="far fa-clipboard fa-2x"></i>
                        </div>
                        
                        <h5 class="card-title text-center mb-3"><%=j.getTitle()%></h5>
                        
                        <div class="mb-3">
                            <span class="badge badge-primary badge-custom">
                                <i class="fas fa-map-marker-alt"></i> <%=j.getLocation()%>
                            </span>
                            <span class="badge badge-success badge-custom">
                                <i class="fas fa-tags"></i> <%=j.getCategory()%>
                            </span>
                            <span class="badge badge-info badge-custom">
                                <i class="fas fa-clock"></i> <%=j.getStatus()%>
                            </span>
                        </div>
                        
                        <p class="card-text text-muted">
                            <%=j.getDescription().length() > 150 ? j.getDescription().substring(0, 150) + "..." : j.getDescription()%>
                        </p>
                        
                        <div class="text-muted small mb-3">
                            <i class="fas fa-calendar-alt"></i> Posted: <%=j.getPdate().toString()%>
                        </div>
                        
                        <div class="text-center">
                            <a href="one_view.jsp?id=<%=j.getId()%>"
                                class="btn btn-outline-success btn-sm mr-2">
                                <i class="fas fa-info-circle"></i> View Details
                            </a>
                                
                            <%
                            User user = (User) session.getAttribute("userobj");
                            if (user != null) {
                            %>
                            <a href="apply_job.jsp?id=<%=j.getId()%>" 
                                class="btn btn-primary btn-sm">
                                <i class="fas fa-paper-plane"></i> Apply Now
                            </a>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>

    <!-- Add Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Auto-dismiss alerts after 5 seconds
        $(document).ready(function() {
            setTimeout(function() {
                $(".alert").alert('close');
            }, 5000);
        });
    </script>
</body>
</html>