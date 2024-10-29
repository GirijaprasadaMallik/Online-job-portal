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
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>My Applications</title>
    <%@ include file="all_component/all_css.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f1f2;
        }
        .card {
            border: 1px solid #007bff;
            border-radius: 8px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .badge-info {
            background-color: #007bff;
        }
        .empty-message {
            font-size: 1.2em;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp" %>

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary mb-4">My Applications</h5>

                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">${succMsg}</div>
                    <c:remove var="succMsg" />
                </c:if>

                <%
                    User user = (User) session.getAttribute("userobj");
                    JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getconn());
                    List<JobApplication> applications = dao.getApplicationsByUser(user.getId());
                    request.setAttribute("applications", applications);
                %>

                <c:choose>
                    <c:when test="${not empty applications}">
                        <c:forEach var="app" items="${applications}">
                            <div class="card mt-2">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="text-primary mb-0"><i class="fas fa-clipboard-list"></i> ${app.jobTitle}</h6>
                                        <span class="badge badge-info">${app.status}</span>
                                    </div>
                                    <p><strong>Application Date:</strong> ${app.applicationDate}</p>
                                    <p><strong>Comments:</strong> ${app.comments}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="card mt-2">
                            <div class="card-body text-center empty-message">
                                <p><i class="fas fa-exclamation-circle"></i> No applications found</p>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
