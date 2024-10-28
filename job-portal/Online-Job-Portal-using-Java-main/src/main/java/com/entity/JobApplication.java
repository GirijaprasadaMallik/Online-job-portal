package com.entity;

public class JobApplication {
    private int id;
    private int jobId;
    private int userId;
    private String applicationDate;
    private String status;
    private String comments;
    private String userName;    // Added to store applicant's name
    private String userEmail;   // Added to store applicant's email
    private String jobTitle;    // Added to store job title
    private String qualification; // Added to store applicant's qualification

    // Default Constructor
    public JobApplication() {
        super();
    }

    // Constructor with all fields
    public JobApplication(int jobId, int userId, String applicationDate, String status, String comments,
                         String userName, String userEmail, String jobTitle, String qualification) {
        super();
        this.jobId = jobId;
        this.userId = userId;
        this.applicationDate = applicationDate;
        this.status = status;
        this.comments = comments;
        this.userName = userName;
        this.userEmail = userEmail;
        this.jobTitle = jobTitle;
        this.qualification = qualification;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(String applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "JobApplication{" +
                "id=" + id +
                ", jobId=" + jobId +
                ", userId=" + userId +
                ", applicationDate='" + applicationDate + '\'' +
                ", status='" + status + '\'' +
                ", comments='" + comments + '\'' +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", jobTitle='" + jobTitle + '\'' +
                ", qualification='" + qualification + '\'' +
                '}';
    }
}