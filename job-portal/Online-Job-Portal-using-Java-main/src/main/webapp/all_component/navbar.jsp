<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="index.jsp">Job Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home
                    <span class="sr-only">(current)</span>
            </a></li>

            <c:if test="${userobj.role eq 'admin'}">
                <li class="nav-item"><a class="nav-link" href="add_job.jsp"><i class="fas fa-plus-circle"></i> Post Job</a></li>
                <li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i class="fas fa-eye"></i> View Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="admin_applications.jsp"><i class="fas fa-clipboard-list"></i> Applications</a></li>
            </c:if>
            
            <c:if test="${userobj.role eq 'user'}">
                <li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fas fa-search"></i> Job Listings</a></li>
                <li class="nav-item"><a class="nav-link" href="my_applications.jsp"><i class="fas fa-clipboard-list"></i> My Applications</a></li>
            </c:if>
        </ul>

        <form class="form-inline my-2 my-lg-0">
            <c:if test="${userobj.role eq 'admin'}">
                <a href="#" class="btn btn-light mr-1"><i class="fas fa-user"></i> Admin</a>
                <a href="logout" class="btn btn-light"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </c:if>

            <c:if test="${userobj.role eq 'user'}">
                <a href="#" class="btn btn-light mr-1" data-toggle="modal" data-target="#profile-modal">
                    <i class="fas fa-user"></i> ${userobj.name}
                </a>
                <a href="logout" class="btn btn-light"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </c:if>

            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn btn-light mr-1"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="signup.jsp" class="btn btn-light"><i class="fas fa-user-plus"></i> Signup</a>
            </c:if>
        </form>
    </div>
</nav>

<!-- Profile Modal -->
<c:if test="${not empty userobj}">
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <i class="fas fa-user fa-3x"></i>
                        <h5>${userobj.name}</h5>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>Email</th>
                                    <td>${userobj.email}</td>
                                </tr>
                                <tr>
                                    <th>Qualification</th>
                                    <td>${userobj.qualification}</td>
                                </tr>
                                <tr>
                                    <th>Role</th>
                                    <td>${userobj.role}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="edit_profile.jsp" class="btn btn-primary">Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
</c:if>