package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs;
@WebServlet("add_job")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String catagory = req.getParameter("catagory");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCatagory(catagory);
			j.setStatus(status);
			j.setDescription(desc);
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f=dao.addJobs(j);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succMsg", "job post successfully");
				resp.sendRedirect("add_job.jsp");
			}else {
				session.setAttribute("succMsg", "Something went wrong on server");
				resp.sendRedirect("add_job.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
