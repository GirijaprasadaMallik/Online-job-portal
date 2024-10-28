package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.entity.JobApplication;

public class JobApplicationDAO {
    private Connection conn;

    public JobApplicationDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addJobApplication(JobApplication application) {
        String sql = "INSERT INTO job_applications(job_id, user_id, application_date, status, comments, user_name, user_email, job_title, qualification) VALUES (?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, application.getJobId());
            ps.setInt(2, application.getUserId());
            ps.setString(3, application.getApplicationDate());
            ps.setString(4, application.getStatus());
            ps.setString(5, application.getComments());
            ps.setString(6, application.getUserName());
            ps.setString(7, application.getUserEmail());
            ps.setString(8, application.getJobTitle());
            ps.setString(9, application.getQualification());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<JobApplication> getApplicationsByUser(int userId) {
        List<JobApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM job_applications WHERE user_id = ? ORDER BY application_date DESC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    applications.add(extractJobApplicationFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }

    public List<JobApplication> getApplicationsByJob(int jobId) {
        List<JobApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM job_applications WHERE job_id = ? ORDER BY application_date DESC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, jobId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    applications.add(extractJobApplicationFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }

    public boolean updateApplicationStatus(int applicationId, String status) {
        String sql = "UPDATE job_applications SET status = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, applicationId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<JobApplication> getAllApplications() {
        List<JobApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM job_applications ORDER BY application_date DESC";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                applications.add(extractJobApplicationFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }

    public boolean deleteApplication(int applicationId) {
        String sql = "DELETE FROM job_applications WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, applicationId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public JobApplication getApplicationById(int applicationId) {
        String sql = "SELECT * FROM job_applications WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, applicationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractJobApplicationFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean hasUserApplied(int userId, int jobId) {
        String sql = "SELECT COUNT(*) FROM job_applications WHERE user_id = ? AND job_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private JobApplication extractJobApplicationFromResultSet(ResultSet rs) throws SQLException {
        JobApplication application = new JobApplication();
        application.setId(rs.getInt("id"));
        application.setJobId(rs.getInt("job_id"));
        application.setUserId(rs.getInt("user_id"));
        application.setApplicationDate(rs.getString("application_date"));
        application.setStatus(rs.getString("status"));
        application.setComments(rs.getString("comments"));
        application.setUserName(rs.getString("user_name"));
        application.setUserEmail(rs.getString("user_email"));
        application.setJobTitle(rs.getString("job_title"));
        application.setQualification(rs.getString("qualification"));
        return application;
    }
}