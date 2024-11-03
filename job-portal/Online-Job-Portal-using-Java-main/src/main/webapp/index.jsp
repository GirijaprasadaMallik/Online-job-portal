<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Job Portal</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
<style>
    body {
        font-family: 'Roboto', sans-serif;
    }
    .bg-animation {
        background: linear-gradient(270deg, #ff7e5f, #feb47b);
        background-size: 400% 400%;
        animation: gradientAnimation 15s ease infinite;
    }
    @keyframes gradientAnimation {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
</style>
</head>

<body class="bg-gray-100 text-gray-800">
    <header class="bg-blue-600 text-white p-4">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold">Job Portal</h1>
            <nav>
                <ul class="flex space-x-4">
                    <li>
                        <a class="hover:underline" href="index.jsp"></a>
                    </li>
                    <li>
                        <a class="hover:underline" href="login.jsp">Login</a>
                    </li>
                    <li>
                        <a class="hover:underline" href="signup.jsp">New user</a>
                    </li>
                    <li>
                        <a id="jobsLink" class="hover:underline" href="#">Jobs</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="container mx-auto py-8">
        <!-- Features Section -->
        <section class="mb-12">
            <h2 class="text-3xl font-bold text-center mb-6">Features We Provide</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white p-6 rounded-lg shadow-lg bg-animation">
                    <i class="fas fa-search text-white text-4xl mb-4"></i>
                    <h3 class="text-xl font-bold mb-2 text-white">Job Search</h3>
                    <p class="text-white">Find the best jobs that match your skills and interests.</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg bg-animation">
                    <i class="fas fa-tasks text-white text-4xl mb-4"></i>
                    <h3 class="text-xl font-bold mb-2 text-white">Application Tracking</h3>
                    <p class="text-white">Keep track of your job applications and their statuses.</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg bg-animation">
                    <i class="fas fa-bell text-white text-4xl mb-4"></i>
                    <h3 class="text-xl font-bold mb-2 text-white">Job Alerts</h3>
                    <p class="text-white">Get notified about the latest job openings in your field.</p>
                </div>
            </div>
        </section>

        <!-- User Comments Section -->
        <section class="mb-12">
            <h2 class="text-3xl font-bold text-center mb-6">What Our Users Say</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white p-6 rounded-lg shadow-lg">
                    <img alt="Portrait of a happy user" class="w-16 h-16 rounded-full mb-4" height="100" src="https://storage.googleapis.com/a1aa/image/UynTKiqxMZrkLV2QfzeXtoz49I57RgJQENXxy9UhZ2jz8fZnA.jpg" width="100"/>
                    <h3 class="text-xl font-bold mb-2">John Doe</h3>
                    <p>"This job portal has been a game-changer for my career. I found                    my dream job here!"</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg">
                    <img alt="Portrait of a happy user" class="w-16 h-16 rounded-full mb-4" height="100" src="https://storage.googleapis.com/a1aa/image/UynTKiqxMZrkLV2QfzeXtoz49I57RgJQENXxy9UhZ2jz8fZnA.jpg" width="100"/>
                    <h3 class="text-xl font-bold mb-2">Jane Smith</h3>
                    <p>"I love the job alerts feature! It keeps me updated on new opportunities."</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-lg">
                    <img alt="Portrait of a happy user" class="w-16 h-16 rounded-full mb-4" height="100" src="https://storage.googleapis.com/a1aa/image/UynTKiqxMZrkLV2QfzeXtoz49I57RgJQENXxy9UhZ2jz8fZnA.jpg" width="100"/>
                    <h3 class="text-xl font-bold mb-2">Mike Johnson</h3>
                    <p>"The application tracking system is very helpful. I can see where I stand with each application."</p>
                </div>
            </div>
        </section>
    </main>

    <!-- Modal -->
    <div id="jobModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
        <div class="bg-white rounded-lg p-6 w-11/12 md:w-1/3">
            <h2 class="text-xl font-bold mb-4">Notice</h2>
            <p class="mb-4">You can only see the job advertisements, not able to apply for them.</p>
            <div class="flex justify-between">
                <button id="okButton" class="bg-blue-500 text-white px-4 py-2 rounded">OK</button>
                <button id="registerButton" class="bg-green-500 text-white px-4 py-2 rounded">Register</button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const jobLink = document.getElementById('jobsLink'); // Select the Jobs link
            const jobModal = document.getElementById('jobModal');
            const okButton = document.getElementById('okButton');
            const registerButton = document.getElementById('registerButton');

            // Show modal when Jobs link is clicked
            jobLink.addEventListener('click', function (event) {
                event.preventDefault(); // Prevent default link behavior
                jobModal.classList.remove('hidden'); // Show the modal
            });

            // Redirect to home.jsp when OK button is clicked
            okButton.addEventListener('click', function () {
                jobModal.classList.add('hidden'); // Hide the modal
                window.location.href = 'home.jsp'; // Redirect to home.jsp
            });

            // Redirect to signup.jsp when Register button is clicked
            registerButton.addEventListener('click', function () {
                jobModal.classList.add('hidden'); // Hide the modal
                window.location.href = 'signup.jsp'; // Redirect to signup.jsp
            });
        });
    </script>

<!-- Team Section -->
   <section>
    <h2 class="text-3xl font-bold text-center mb-6">
     Meet Our Team
    </h2>
    <div class="flex flex-wrap justify-center gap-8">
     <div class="bg-white p-6 rounded-lg shadow-lg text-center bg-animation w-60">
      <img alt="Portrait of team member Alice Brown" class="w-24 h-24 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/eixrJg9DZWzPSi7WFGW9fBxIK1mOfbzlcJiHqx6YQWAk5fzOB.jpg" width="150"/>
      <h3 class="text-xl font-bold mb-2 text-white">
       Alice Brown
      </h3>
      <p class="text-white">
       CEO
      </p>
      <p>
       <i class="fab fa-github text-white">
       </i>
       <a class="text-white hover:underline" href="https://github.com/alicebrown">
        alicebrown
       </a>
      </p>
      <p>
       <i class="fas fa-envelope text-white">
       </i>
       <a class="text-white hover:underline" href="mailto:alice@example.com">
        alice@example.com
       </a>
      </p>
      <p class="text-white">
       Reg No: 123456
      </p>
     </div>
     <div class="bg-white p-6 rounded-lg shadow-lg text-center bg-animation w-60">
      <img alt="Portrait of team member David Wilson" class="w-24 h-24 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/wrm9sjf4U3RUXqKsRyVIHc0i3Dm8MITGdYdkv1wdSuZbefZnA.jpg" width="150"/>
      <h3 class="text-xl font-bold mb-2 text-white">
       David Wilson
      </h3>
      <p class="text-white">
       CTO
      </p>
      <p>
       <i class="fab fa-github text-white">
       </i>
       <a class="text-white hover:underline" href="https://github.com/davidwilson">
        davidwilson
       </a>
      </p>
      <p>
       <i class="fas fa-envelope text-white">
       </i>
       <a class="text-white hover:underline" href="mailto:david@example.com">
        david@example.com
       </a>
      </p>
      <p class="text-white">
       Reg No: 654321
      </p>
     </div>
     <div class="bg-white p-6 rounded-lg shadow-lg text-center bg-animation w-60">
      <img alt="Portrait of team member Emma Davis" class="w-24 h-24 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/XQAINPkmK8YuIFH8K3Q25WGA3VBP7k2NYQ180LCm93SMffsTA.jpg" width="150"/>
      <h3 class="text-xl font-bold mb-2 text-white">
       Emma Davis
      </h3>
      <p class="text-white">
       COO
      </p>
      <p>
       <i class="fab fa-github text-white">
       </i>
       <a class="text-white hover:underline" href="https://github.com/emmadavis">
        emmadavis
       </a>
      </p>
      <p>
       <i class="fas fa-envelope text-white">
       </i>
       <a class="text-white hover:underline" href="mailto:emma@example.com">
        emma@example.com
       </a>
      </p>
      <p class="text-white">
       Reg No: 789012
      </p>
     </div>
     <div class="bg-white p-6 rounded-lg shadow-lg text-center bg-animation w-60">
      <img alt="Portrait of team member John Smith" class="w-24 h-24 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/7.jpg" width="150"/>
      <h3 class="text-xl font-bold mb-2 text-white">
       John Smith
      </h3>
      <p class="text-white">
       Lead Developer
      </p>
      <p>
       <i class="fab fa-github text-white">
       </i>
       <a class="text-white hover:underline" href="https://github.com/johnsmith">
        johnsmith
       </a>
      </p>
      <p>
       <i class="fas fa-envelope text-white">
       </i>
       <a class="text-white hover:underline" href="mailto:john@example.com">
        john@example.com
       </a>
      </p>
      <p class="text-white">
       Reg No: 345678
      </p>
     </div>
     <div class="bg-white p-6 rounded-lg shadow-lg text-center bg-animation w-60">
      <img alt="Portrait of team member Lisa White" class="w-24 h-24 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/8.jpg" width="150"/>
      <h3 class="text-xl font-bold mb-2 text-white">
       Lisa White
      </h3>
      <p class="text-white">
       Marketing Head
      </p>
      <p>
       <i class="fab fa-github text-white">
       </i>
       <a class="text-white hover:underline" href="https://github.com/lisawhite">
        lisawhite
       </a>
      </p>
      <p>
       <i class="fas fa-envelope text-white">
       </i>
       <a class="text-white hover:underline" href="mailto:lisa@example.com">
        lisa@example.com
       </a>
      </p>
      <p class="text-white">
       Reg No: 901234
      </p>
     </div>
    </div>
   </section>
  </main>
  <footer class="bg-blue-600 text-white p-4 text-center">
</body>
</html>