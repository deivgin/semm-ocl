-- test Task :: isOverdue

-- Create task1
!create task1 : Task
!set task1.id := 'task1'
!set task1.title := 'Task 1'
!set task1.description := 'Task Description'
!set task1.priority := Priority::Medium
!set task1.status := Status::Open
!set task1.dueDate := 20180 -- Due date in the past

-- Create date with current time
!create date1 : Date
!set date1.now := 20199 -- Current date as specified in the postcondition

-- Check test case
!openter task1 isOverdue()

-- The operation should return true since 20199 > 20180
!opexit true

-- Test with a task that is not overdue
!create task2 : Task
!set task2.id := 'task2'
!set task2.title := 'Task 2'
!set task2.description := 'Task Description'
!set task2.priority := Priority::Medium
!set task2.status := Status::Open
!set task2.dueDate := 20250 -- Due date in the future

-- Check test case
!openter task2 isOverdue()

-- The operation should return false since 20199 < 20250
!opexit false
