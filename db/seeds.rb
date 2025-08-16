# Create sample tasks
tasks_data = [
  {
    name: "Complete Project Documentation",
    description: "Write comprehensive documentation for the current project including API endpoints, setup instructions, and deployment guide.",
    is_completed: false
  },
  {
    name: "Code Review and Refactoring",
    description: "Review existing codebase for potential improvements, code smells, and opportunities for refactoring.",
    is_completed: false
  },
  {
    name: "Set Up CI/CD Pipeline",
    description: "Configure continuous integration and deployment pipeline using GitHub Actions or similar tools.",
    is_completed: false
  },
  {
    name: "Write Unit Tests",
    description: "Create comprehensive unit tests for all models, services, and controllers to ensure code quality.",
    is_completed: false
  },
  {
    name: "Database Optimization",
    description: "Analyze and optimize database queries, add necessary indexes, and review database schema.",
    is_completed: false
  },
  {
    name: "Security Audit",
    description: "Conduct security review of the application, check for vulnerabilities, and implement security best practices.",
    is_completed: false
  },
  {
    name: "Performance Testing",
    description: "Run load tests, analyze performance bottlenecks, and implement performance improvements.",
    is_completed: false
  },
  {
    name: "User Interface Design",
    description: "Design and implement user interface improvements based on user feedback and usability testing.",
    is_completed: false
  },
  {
    name: "API Documentation",
    description: "Create interactive API documentation using tools like Swagger or Postman collections.",
    is_completed: false
  },
  {
    name: "Deployment Preparation",
    description: "Prepare application for production deployment, including environment configuration and monitoring setup.",
    is_completed: false
  }
]

tasks_data.each do |task_attrs|
  Task.create!(task_attrs)
end

puts "Created #{tasks_data.length} sample tasks" 