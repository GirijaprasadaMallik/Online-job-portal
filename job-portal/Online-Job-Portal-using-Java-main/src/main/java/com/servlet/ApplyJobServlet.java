package com.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobApplicationDAO;
import com.dao.JobDAO;
import com.entity.JobApplication;
import com.entity.User;
import com.entity.Jobs;

@WebServlet("/apply_job")
public class ApplyJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the session and check if user is logged in
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("userobj");

            // Check if user is logged in
            if (user == null) {
                session.setAttribute("succMsg", "Please login to apply for jobs");
                resp.sendRedirect("login.jsp");
                return;
            }

            // Get job ID and comments from request
            int jobId = Integer.parseInt(req.getParameter("job_id"));
            String comments = req.getParameter("comments");

            // Validate job exists
            JobDAO jobDAO = new JobDAO(DBConnect.getconn());
            Jobs job = jobDAO.getJobById(jobId);

            if (job == null) {
                session.setAttribute("succMsg", "Job not found");
                resp.sendRedirect("home.jsp");
                return;
            }

            // Check if job is still active
            if (!"Active".equalsIgnoreCase(job.getStatus())) {
                session.setAttribute("succMsg", "This job is no longer accepting applications");
                resp.sendRedirect("home.jsp");
                return;
            }

            // Create new job application
            JobApplication application = new JobApplication();
            application.setJobId(jobId);
            application.setUserId(user.getId());
            application.setComments(comments);
            
            // Set current timestamp for application date
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            application.setApplicationDate(currentTimestamp.toString());
            
            // Set initial status
            application.setStatus("Pending");
            
            // Set user details
            application.setUserName(user.getName());
            application.setUserEmail(user.getEmail());
            application.setJobTitle(job.getTitle());
            application.setQualification(user.getQualification());

            // Save application to database
            JobApplicationDAO applicationDAO = new JobApplicationDAO(DBConnect.getconn());
            
            // Check if user has already applied
            List<JobApplication> existingApplications = applicationDAO.getApplicationsByUser(user.getId());
            for (JobApplication existingApp : existingApplications) {
                if (existingApp.getJobId() == jobId) {
                    session.setAttribute("succMsg", "You have already applied for this job");
                    resp.sendRedirect("home.jsp");
                    return;
                }
            }

            // Add new application
            boolean success = applicationDAO.addJobApplication(application);

            if (success) {
                session.setAttribute("succMsg", "Job Applied Successfully");
            } else {
                session.setAttribute("succMsg", "Something went wrong on server");
            }

            resp.sendRedirect("home.jsp");

        } catch (NumberFormatException e) {
            // Handle invalid job ID
            HttpSession session = req.getSession();
            session.setAttribute("succMsg", "Invalid job ID");
            resp.sendRedirect("home.jsp");
            e.printStackTrace();
        } catch (Exception e) {
            // Handle other exceptions
            HttpSession session = req.getSession();
            session.setAttribute("succMsg", "An error occurred while processing your application");
            resp.sendRedirect("home.jsp");
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Redirect GET requests to home page
        resp.sendRedirect("home.jsp");
    }
}