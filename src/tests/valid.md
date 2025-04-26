-- Valid Test Case: Creates 10+ objects satisfying all invariants

-- Create Date objects
!create today : Date
!set today.now := 20225

!create tomorrow : Date
!set tomorrow.now := 20226

-- Create User objects
!create user1 : User
!set user1.id := 'user1'
!set user1.name := 'John Doe'
!set user1.email := 'john@example.com'

!create user2 : User
!set user2.id := 'user2'
!set user2.name := 'Jane Smith'
!set user2.email := 'jane@example.com'

-- Create Project objects
!create project1 : Project
!set project1.id := 'project1'
!set project1.title := 'Website Redesign'
!set project1.description := 'Redesign company website'
!set project1.startDate := 20220
!set project1.endDate := 20320
!set project1.history := Set{Tuple{date:20220, action:'Create'}}

!create project2 : Project
!set project2.id := 'project2'
!set project2.title := 'Mobile App Development'
!set project2.description := 'Create a mobile app for customers'
!set project2.startDate := 20225
!set project2.endDate := 20325
!set project2.history := Set{Tuple{date:20225, action:'Create'}}

-- Initialize project sprints
!set project1.sprints := Sequence{}
!set project2.sprints := Sequence{}

-- Create initial sprints
!openter project1 createNewSprint()
!set project1.sprints := Sequence{Set{}}
!opexit 1

!openter project2 createNewSprint()
!set project2.sprints := Sequence{Set{}}
!opexit 1

-- Create Task objects for project1
!create task1 : Task
!set task1.id := 'task1'
!set task1.title := 'Create Wireframes'
!set task1.description := 'Design wireframes for website'
!set task1.priority := Priority::High
!set task1.status := Status::Open
!set task1.dueDate := 20230

!create task2 : Task
!set task2.id := 'task2'
!set task2.title := 'Setup Development Environment'
!set task2.description := 'Install and configure dev tools'
!set task2.priority := Priority::Medium
!set task2.status := Status::InProgress
!set task2.dueDate := 20226

!create task3 : Task
!set task3.id := 'task3'
!set task3.title := 'Implement Login Page'
!set task3.description := 'Create login functionality'
!set task3.priority := Priority::High
!set task3.status := Status::Open
!set task3.dueDate := 20240

-- Create Task objects for project2
!create task4 : Task
!set task4.id := 'task4'
!set task4.title := 'App Architecture Design'
!set task4.description := 'Design app architecture'
!set task4.priority := Priority::High
!set task4.status := Status::Open
!set task4.dueDate := 20235

!create task5 : Task
!set task5.id := 'task5'
!set task5.title := 'UI Design'
!set task5.description := 'Design user interface'
!set task5.priority := Priority::Medium
!set task5.status := Status::Open
!set task5.dueDate := 20245

-- Create Note object
!create note1 : Note
!set note1.text := 'Important project meeting scheduled for next week'
!set note1.createdAt := 20220
!set note1.updatedAt := 20221

-- Assign tasks to projects
!openter task1 assignToProject(project1)
!insert (task1, project1) into Contains
!opexit

!openter task2 assignToProject(project1)
!insert (task2, project1) into Contains
!opexit

!openter task3 assignToProject(project1)
!insert (task3, project1) into Contains
!opexit

!openter task4 assignToProject(project2)
!insert (task4, project2) into Contains
!opexit

!openter task5 assignToProject(project2)
!insert (task5, project2) into Contains
!opexit

-- Assign owners to tasks
!insert (user1, task1) into Owns
!insert (user1, task2) into Owns
!insert (user2, task3) into Owns
!insert (user2, task4) into Owns
!insert (user1, task5) into Owns

-- Assign managers to projects
!insert (user1, project1) into Manages
!insert (user2, project2) into Manages

-- Add tasks to sprints
!openter project1 addTaskToSprint(task1, 1)
!set project1.sprints := Sequence{Set{task1}}
!opexit

!openter project1 addTaskToSprint(task2, 1)
!set project1.sprints := Sequence{Set{task1, task2}}
!opexit

!openter project2 addTaskToSprint(task4, 1)
!set project2.sprints := Sequence{Set{task4}}
!opexit

-- Create another sprint for project1
!openter project1 createNewSprint()
!set project1.sprints := Sequence{Set{task1, task2}, Set{}}
!opexit 2

-- Add task3 to the second sprint
!openter project1 addTaskToSprint(task3, 2)
!set project1.sprints := Sequence{Set{task1, task2}, Set{task3}}
!opexit

-- Check the object state to verify that all invariants are satisfied
check
