# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    RegistrationStatus.create!(reg_status: "Step 1: Choose Account Type")
    RegistrationStatus.create!(reg_status: "Step 2: Edit Account Profile")
    RegistrationStatus.create!(reg_status: "Step 3: Initial Registration Complete")
    RequestStatus.create!(req_status: 'pending')
    RequestStatus.create!(req_status: 'accepted')
    RequestStatus.create!(req_status: 'rejected')
    JobStatus.create!(current_job_status: 'Open')
    JobStatus.create!(current_job_status: 'Closed')
    JobStatus.create!(current_job_status: 'Finished')
    TaskStatus.create!(task_status: 'Not Submitted Yet')
    TaskStatus.create!(task_status: 'Submission Pending')
    TaskStatus.create!(task_status: 'Submission Accepted')
    TaskStatus.create!(task_status: 'Submission Rejected')
    
