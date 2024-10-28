package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobApplicationDAO;
import com.DB.DBConnect;

@WebServlet("/update_application_status")
public class UpdateApplicationStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            // Get and validate the ID parameter
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                session.setAttribute("succMsg", "Invalid application ID");
                response.sendRedirect("admin_applications.jsp");
                return;
            }
            
            int id = Integer.parseInt(idParam);
            
            // Get and validate the status parameter
            String status = request.getParameter("status");
            if (status == null || status.trim().isEmpty()) {
                session.setAttribute("succMsg", "Invalid status");
                response.sendRedirect("admin_applications.jsp");
                return;
            }

            JobApplicationDAO dao = new JobApplicationDAO(DBConnect.getconn());
            boolean updated = false;

            if ("Declined".equals(status)) {
                updated = dao.deleteApplication(id);
            } else {
                updated = dao.updateApplicationStatus(id, status);
            }

            if (updated) {
                session.setAttribute("succMsg", "Application " + 
                    (status.equals("Declined") ? "declined and deleted" : "status updated") + 
                    " successfully");
            } else {
                session.setAttribute("succMsg", "Failed to update application status");
            }

        } catch (NumberFormatException e) {
            session.setAttribute("succMsg", "Invalid application ID format");
            e.printStackTrace();
        } catch (Exception e) {
            session.setAttribute("succMsg", "An error occurred while processing your request");
            e.printStackTrace();
        }
        
        response.sendRedirect("admin_applications.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}