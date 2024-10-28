package com.dao;

import com.entity.JobApplication;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobApplicationDAO {
    private Connection conn;

    public JobApplicationDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addJobApplication(JobApplication application) {
        boolean f = false;
        try {
            String sql = "INSERT INTO job_applications(job_id, user_id, application_date, status, comments) VALUES (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, application.getJobId());
            ps.setInt(2, application.getUserId());
            ps.setString(3, application.getApplicationDate());
            ps.setString(4, application.getStatus());
            ps.setString(5, application.getComments());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<JobApplication> getApplicationsByUser(int userId) {
        List<JobApplication> applications = new ArrayList<>();
        try {
            String sql = "SELECT * FROM job_applications WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                JobApplication application = new JobApplication();
                application.setId(rs.getInt("id"));
                application.setJobId(rs.getInt("job_id"));
                application.setUserId(rs.getInt("user_id"));
                application.setApplicationDate(rs.getString("application_date"));
                application.setStatus(rs.getString("status"));
                application.setComments(rs.getString("comments"));
                applications.add(application);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return applications;
    }

    public List<JobApplication> getApplicationsByJob(int jobId) {
        List<JobApplication> applications = new ArrayList<>();
        try {
            String sql = "SELECT * FROM job_applications WHERE job_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                JobApplication application = new JobApplication();
                application.setId(rs.getInt("id"));
                application.setJobId(rs.getInt("job_id"));
                application.setUserId(rs.getInt("user_id"));
                application.setApplicationDate(rs.getString("application_date"));
                application.setStatus(rs.getString("status"));
                application.setComments(rs.getString("comments"));
                applications.add(application);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return applications;
    }

    public boolean updateApplicationStatus(int applicationId, String status) {
        boolean f = false;
        try {
            String sql = "UPDATE job_applications SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, applicationId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public JobApplication getApplicationById(int applicationId) {
        JobApplication application = null;
        try {
            String sql = "SELECT * FROM job_applications WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, applicationId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                application = new JobApplication();
                application.setId(rs.getInt("id"));
                application.setJobId(rs.getInt("job_id"));
                application.setUserId(rs.getInt("user_id"));
                application.setApplicationDate(rs.getString("application_date"));
                application.setStatus(rs.getString("status"));
                application.setComments(rs.getString("comments"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return application;
    }

    public boolean deleteApplication(int applicationId) {
        boolean f = false;
        try {
            String sql = "DELETE FROM job_applications WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, applicationId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}