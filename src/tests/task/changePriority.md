-- test Task :: changeStatus

-- Create task1
!create task1 : Task
!set task1.id := 'task1'
!set task1.title := 'Task 1'
!set task1.description := 'Task Description'
!set task1.status := Status::Open

-- check test case

!openter task1 changePriority(Priority::High)
!set task1.priority := Priority::High
!opexit
