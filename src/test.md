-- Init Now Date
!create currentDate : Date
!set currentDate.now := 20199

-- Create user
!create user : User
!set user.id := 'user'
!set user.name := 'John Smith'
!set user.email := 'john@gmail.com'

-- Create task1
!create task1 : Task
!set task1.id := 'task1'
!set task1.title := 'Task 1'
!set task1.description := 'Task Description'
!set task1.priority := Priority::Medium
!set task1.status := Status::Open
!set task1.dueDate := 20222

-- Create project1
!create project1 : Project
!set project1.id := 'project1'
!set project1.title := 'Project1'
!set project1.description := 'Project1 description'
!set project1.startDate := 20220
!set project1.endDate := 20320
