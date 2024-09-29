<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Admin: view jobs</title>
        <%@include file="all_component/oll_css.jsp"%>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div Class="col-md-12">
                    
                    <h5 class="trext-center text-primary">All Jobs</h5>

                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>


<% JobDAO dao=new JobDAO(DBConnect) %>

                            <h6>Title</h6>
                            <p>description</p>
                            <br>

                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm"
                                    value="Location:" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-sm"
                                    value="category:" readonly>
                                </div>

                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm"
                                    value="Status:" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>