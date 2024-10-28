package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobApplicationDAO;
import com.entity.JobApplication;
import com.entity.User;

@WebServlet("/view_applications")
public class ViewApplicationsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userobj");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getconn());
        List<JobApplication> applications;

        if ("admin".equals(user.getRole())) {
            applications = dao.getAllApplications();
            request.setAttribute("applications", applications);
            request.getRequestDispatcher("admin_applications.jsp").forward(request, response);
        } else {
            applications = dao.getApplicationsByUser(user.getId());
            request.setAttribute("applications", applications);
            request.getRequestDispatcher("my_applications.jsp").forward(request, response);
        }
    }
}