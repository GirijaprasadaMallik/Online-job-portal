<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Jobs"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>User : Home</title>
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
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        @media (max-width: 768px) {
            .card-img-top {
                height: 150px;
            }
            .job-card {
                margin-bottom: 15px;
            }
            .search-section {
                padding: 15px;
            }
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">

    <%@include file="all_component/navbar.jsp"%>

    <div class="container mt-4">
        <!-- Alert Messages -->
        <c:if test="${not empty succMsg}">
            <div class="alert alert-success alert-dismissible fade show" role="alert" aria-live="assertive">
                ${succMsg}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <c:remove var="succMsg" />
        </c:if>

        <!-- Search Section -->
        <div class="search-section">
            <form class="form-row" action="home.jsp" method="GET">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="location">Location</label>
                        <input type="text" class="form-control" id="location" name="location" 
                               placeholder="Enter location..." value="${param.location}" aria-label="Job Location">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select class="form-control" id="category" name="category" aria-label="Job Category">
                            <option value="">Select Category</option>
                            <option value="IT" ${param.category == 'IT' ? 'selected' : ''}>IT</option>
                            <option value="Developer" ${param.category == 'Developer' ? 'selected' : ''}>Developer</option>
                            <option value="Banking" ${param.category == 'Banking' ? 'selected' : ''}>Banking</option>
                            <option value="Engineer" ${param.category == 'Engineer' ? 'selected' : ''}>Engineer</option>
                            <option value="Teacher" ${param.category == 'Teacher' ? 'selected' : ''}>Teacher</option>
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
            List<Jobs> list = null;
            String category = request.getParameter("category");
            String location = request.getParameter("location");
            
            if (category != null && location != null && !category.isEmpty() && !location.isEmpty()) {
                list = dao.getJobsAndLocationAndCate(category, location);
            } else if (category != null && !category.isEmpty()) {
                list = dao.getJobsByCategory(category);
            } else if (location != null && !location.isEmpty()) {
                list = dao.getJobsByLocation(location);
            } else {
                list = dao.getAllJobs();
            }

            if (list != null && !list.isEmpty()) {
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
                            <i class="fas fa-calendar-alt"></i> Posted: <%=j.getPdate()%>
                        </div>
                        <div class="text-center">
                            <a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-outline-success btn-sm mr-2">
                                <i class="fas fa-info-circle"></i> View Details
                            </a>
                            <c:if test="${not empty userobj}">
                                <a href="apply_job.jsp?id=<%=j.getId()%>" class="btn btn-primary btn-sm apply-btn">
                                    <i class="fas fa-paper-plane"></i> Apply Now
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12 text-center">
                <h4 class="text-muted">No jobs found</h4>
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

        // Smooth scroll to top
        $('.scroll-to-top').click(function(e) {
            e.preventDefault();
            $('html, body').animate({scrollTop: 0}, 'slow');
        });

        // Confirm before applying
        $('.apply-btn').click(function(e) {
            if(!confirm('Are you sure you want to apply for this job?')) {
                e.preventDefault();
            }
        });

        // Show loading spinner during AJAX requests
        $(document).ajaxStart(function() {
            $('#loading-spinner').show();
        }).ajaxStop(function() {
            $('#loading-spinner').hide();
        });
    </script>

    <!-- Scroll-to-top button -->
    <a href="#" class="scroll-to-top position-fixed btn btn-secondary" style="bottom: 20px; right: 20px;">
        <i class="fas fa-arrow-up"></i>
    </a>

</body>
</html>
