-- Invalid Test Case: Creates objects that violate specific invariants

-- Create Date object
!create today : Date
!set today.now := 20225

-- Case 1: Project with invalid date range (endDate before startDate)
!create invalidProject1 : Project
!set invalidProject1.id := 'invalidProject1'
!set invalidProject1.title := 'Invalid Date Range Project'
!set invalidProject1.description := 'This project has an invalid date range'
!set invalidProject1.startDate := 20320 -- End date is before start date
!set invalidProject1.endDate := 20220
!set invalidProject1.history := Set{Tuple{date:20220, action:'Create'}}
!set invalidProject1.sprints := Sequence{}

-- The following invariant should be violated:
-- inv validDateRange: self.endDate > self.startDate

-- Case 2: Task with empty title
!create invalidTask1 : Task
!set invalidTask1.id := 'invalidTask1'
!set invalidTask1.title := '' -- Empty title violates invariant
!set invalidTask1.description := 'This task has an empty title'
!set invalidTask1.priority := Priority::Medium
!set invalidTask1.status := Status::Open
!set invalidTask1.dueDate := 20230

-- The following invariant should be violated:
-- inv validTitle: self.title.size() > 0

-- Case 3: High priority task without a due date
!create invalidTask2 : Task
!set invalidTask2.id := 'invalidTask2'
!set invalidTask2.title := 'High Priority Task Without Due Date'
!set invalidTask2.description := 'This high priority task has no due date'
!set invalidTask2.priority := Priority::High
!set invalidTask2.status := Status::Open
!set invalidTask2.dueDate := null -- Missing due date for high priority task

-- The following invariant should be violated:
-- inv importantTasksHaveDueDate: self.priority = Priority::High implies self.dueDate <> null

-- Case 4: High priority task without a project assignment
!create invalidTask3 : Task
!set invalidTask3.id := 'invalidTask3'
!set invalidTask3.title := 'High Priority Task Without Project'
!set invalidTask3.description := 'This high priority task has no project assigned'
!set invalidTask3.priority := Priority::High
!set invalidTask3.status := Status::Open
!set invalidTask3.dueDate := 20240
-- No project assignment for a high priority task

-- The following invariant should be violated:
-- inv highPriorityTasksHaveProjectAssigned: self.priority = Priority::High implies self.project <> null

-- Case 5: Project with duplicate task IDs
!create validProject : Project
!set validProject.id := 'validProject'
!set validProject.title := 'Valid Project'
!set validProject.description := 'This is a valid project'
!set validProject.startDate := 20220
!set validProject.endDate := 20320
!set validProject.history := Set{Tuple{date:20220, action:'Create'}}
!set validProject.sprints := Sequence{}

!create duplicateTask1 : Task
!set duplicateTask1.id := 'duplicate' -- Duplicate ID
!set duplicateTask1.title := 'Task with Duplicate ID 1'
!set duplicateTask1.description := 'This task has a duplicate ID'
!set duplicateTask1.priority := Priority::Medium
!set duplicateTask1.status := Status::Open
!set duplicateTask1.dueDate := 20230

!create duplicateTask2 : Task
!set duplicateTask2.id := 'duplicate' -- Same ID as duplicateTask1
!set duplicateTask2.title := 'Task with Duplicate ID 2'
!set duplicateTask2.description := 'This task also has a duplicate ID'
!set duplicateTask2.priority := Priority::Low
!set duplicateTask2.status := Status::Open
!set duplicateTask2.dueDate := 20235

-- The following invariant should be violated:
-- inv uniqueID: Task.allInstances()->forAll(t1, t2 | t1 <> t2 implies t1.id <> t2.id)

-- Case 6: User without email
!create invalidUser : User
!set invalidUser.id := 'invalidUser'
!set invalidUser.name := 'Invalid User'
!set invalidUser.email := '' -- Empty email violates invariant

-- The following invariant should be violated:
-- inv emailRequired: self.email <> null and self.email <> ''

-- Try to assign tasks to project (this should fail due to the task ID conflict)
!openter duplicateTask1 assignToProject(validProject)
!insert (duplicateTask1, validProject) into Contains
!opexit

!openter duplicateTask2 assignToProject(validProject)
!insert (duplicateTask2, validProject) into Contains
!opexit

-- Check the object state to verify that the expected invariants are violated
check
