-- Create project1
!create project1 : Project
!set project1.id := 'project1'
!set project1.title := 'Project1'
!set project1.description := 'Project1 description'
!set project1.startDate := 20220
!set project1.endDate := 20320

-- Initialize the history set if it's not already created
!set project1.history := Set{}

-- Add a tuple to the history set
!set project1.history := project1.history->including(Tuple{date:20221, action:'created'})

-- Add another tuple to the history set
!set project1.history := project1.history->including(Tuple{date:20222, action:'updated'})
