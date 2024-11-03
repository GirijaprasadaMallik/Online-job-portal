<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto Mono', monospace;
        }
    </style>
</head>
<body class="bg-blue-100 text-gray-800">
    <div class="flex h-screen">
        <!-- Sidebar -->
        <div class="bg-blue-500 text-white w-64 space-y-6 py-7 px-2">
            <div class="text-3xl font-semibold text-center">
                Admin Dashboard
            </div>
            <nav>
                <a href="index.jsp" class="block py-2.5 px-4 rounded transition duration-200 hover:bg-blue-400 hover:text-white">
                    <i class="fas fa-home"></i> Home
                </a>
                <a href="add_job.jsp" class="block py-2.5 px-4 rounded transition duration-200 hover:bg-blue-400 hover:text-white">
                    <i class="fas fa-briefcase"></i> Post Jobs
                </a>
                <a href="view_jobs.jsp" class="block py-2.5 px-4 rounded transition duration-200 hover:bg-blue-400 hover:text-white">
                    <i class="fas fa-eye"></i> View Jobs
                </a>
                <a href="admin_applications.jsp" class="block py-2.5 px-4 rounded transition duration-200 hover:bg-blue-400 hover:text-white">
                    <i class="fas fa-file-alt"></i> Applications
                </a>
            </nav>
        </div>
        <!-- Main Content -->
        <div class="flex-1 p-10 text-2xl font-bold">
            <h1 class="text-4xl mb-6">Welcome to the Admin Dashboard</h1>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <!-- Home Card -->
                <div class="bg-white p-6 rounded-lg shadow-lg text-blue-600">
                    <div class="flex items-center justify-between">
                        <div>
                            <h2 class="text-xl font-semibold">Home</h2>
                            <p class="text-blue-400">Overview of the dashboard</p>
                        </div>
                        <i class="fas fa-home text-3xl text-blue-400"></i>
                    </div>
                </div>
                <!-- Post Jobs Card -->
                <div class="bg-white p-6 rounded-lg shadow-lg text-blue-600">
                    <div class="flex items-center justify-between">
                        <div>
                            <h2 class="text-xl font-semibold">Post Jobs</h2>
                            <p class="text-blue-400">Create new job postings</p>
                        </div>
                        <i class="fas fa-briefcase text-3xl text-blue-400"></i>
                    </div>
                </div>
                <!-- View Jobs Card -->
                <div class="bg-white p-6 rounded-lg shadow-lg text-blue-600">
                    <div class="flex items-center justify-between">
                        <div>
                            <h2 class="text-xl font-semibold">View Jobs</h2>
                            <p class="text-blue-400">See all job listings</p>
                        </div>
                        <i class="fas fa-eye text-3xl text-blue-400"></i>
                    </div>
                </div>
                <!-- Applications Card -->
                <div class="bg-white p-6 rounded-lg shadow-lg text-blue-600">
                    <div class="flex items-center justify-between">
                        <div>
                            <h2 class="text-xl font-semibold">Applications</h2>
                            <p class="text-blue-400">Manage job applications</p>
                        </div>
                        <i class="fas fa-file-alt text-3xl text-blue-400"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>