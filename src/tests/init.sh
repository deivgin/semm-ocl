-- Create Users
!create user : User
!set user.id := 'user1'
!set user.name := 'John Doe'
!set user.email := 'john.doe@email.com'

-- Create Project
!create project : Project
!set project.id := 'project1'
!set project.title := 'Project Alpha'
!set project.description := 'This is a sample project.'

-- Create Tasks
!create task1 : Task
!set task1.id := 'task1'
!set task1.title := 'Task 1'
!set task1.description := 'This is the first task.'
!set task1.status := Status::in_progress
!set task1.priority := Priority::high

!create task2 : Task
!set task2.id := 'task2'
!set task2.title := 'Task 2'
!set task2.status := Status::open
!set task2.priority := Priority::medium

!create task3 : Task
!set task3.id := 'task3'
!set task3.title := 'Task 3'
!set task3.description := 'This is the third task.'
!set task3.status := Status::done
!set task3.priority := Priority::low

-- Insert associations based on the provided definitions

-- User owns tasks (Owns association)
!insert (user, task1) into Owns
!insert (user, task2) into Owns
!insert (user, task3) into Owns

-- User manages project (Manages association)
!insert (user, project) into Manages

-- Project contains tasks (Contains association)
!insert (task1, project) into Contains
!insert (task2, project) into Contains
