-- Test file for Project::validDates invariant
-- This invariant ensures that project start dates are before or equal to end dates

-- Setup: Create valid project with equal dates
!create equalDatesProject : Project
!set equalDatesProject.id := 'equal1'
!set equalDatesProject.title := 'Equal Dates Project'
!set equalDatesProject.description := 'This project has equal start and end dates'
!set equalDatesProject.startDate := 10
!set equalDatesProject.endDate := 10
!set equalDatesProject.tasks := Set{}

-- Setup: Create valid project with proper date range
!create validDatesProject : Project
!set validDatesProject.id := 'valid1'
!set validDatesProject.title := 'Valid Dates Project'
!set validDatesProject.description := 'This project has start date before end date'
!set validDatesProject.startDate := 10
!set validDatesProject.endDate := 20
!set validDatesProject.tasks := Set{}

-- Test invalid case (should fail)
!create invalidDatesProject : Project
!set invalidDatesProject.id := 'invalid1'
!set invalidDatesProject.title := 'Invalid Dates Project'
!set invalidDatesProject.description := 'This project has start date after end date'
!set invalidDatesProject.startDate := 20
!set invalidDatesProject.endDate := 10
!set invalidDatesProject.tasks := Set{}

-- Expected result:
-- The creation of invalidDatesProject should fail due to violating the validDates invariant
