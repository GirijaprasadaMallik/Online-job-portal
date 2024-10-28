package com.servlet;

import java.io.IOException;
import java.sql.Timestamp;

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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int jobId = Integer.parseInt(req.getParameter("job_id"));
            String comments = req.getParameter("comments");

            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("userobj");

            if (user == null) {
                session.setAttribute("succMsg", "Please login to apply for jobs");
                resp.sendRedirect("login.jsp");
                return;
            }

            JobDAO jobDAO = new JobDAO(DBConnect.getconn());
            Jobs job = jobDAO.getJobById(jobId);

            if (job == null) {
                session.setAttribute("succMsg", "Job not found");
                resp.sendRedirect("home.jsp");
                return;
            }

            JobApplication application = new JobApplication();
            application.setJobId(jobId);
            application.setUserId(user.getId());
            application.setComments(comments);
            application.setApplicationDate(new Timestamp(System.currentTimeMillis()).toString());
            application.setStatus("Pending");
            application.setUserName(user.getName());
            application.setUserEmail(user.getEmail());
            application.setJobTitle(job.getTitle());
            application.setQualification(user.getQualification());

            JobApplicationDAO applicationDAO = new JobApplicationDAO(DBConnect.getconn());
            boolean f = applicationDAO.addJobApplication(application);

            if (f) {
                session.setAttribute("succMsg", "Job Applied Successfully");
            } else {
                session.setAttribute("succMsg", "Something went wrong on server");
            }

            resp.sendRedirect("home.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("succMsg", "An error occurred while processing your application");
            resp.sendRedirect("home.jsp");
        }
    }
}