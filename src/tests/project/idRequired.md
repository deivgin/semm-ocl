-- Test file for Project::validId invariant
-- This invariant ensures that project IDs are not empty strings

-- Setup: Create valid project
!create validProject : Project
!set validProject.id := 'project1'
!set validProject.title := 'Valid Project'
!set validProject.description := 'This project has a valid ID'
!set validProject.tasks := Set{}

-- Test invalid case (should fail)
!create invalidProject : Project
!set invalidProject.id := ''
!set invalidProject.title := 'Invalid Project'
!set invalidProject.description := 'This project has an empty ID string'
!set invalidProject.tasks := Set{}

-- Expected result:
-- The creation of invalidProject should fail due to violating the validId invariant
