-- Correct user
!create user : User
!set user.id := 'user1'
!set user.name := 'John Doe'
!set user.email := 'john.doe@email.com'

-- No Id user
!create user : User
!set user.name := 'John Doe'
!set user.email := 'john.doe@email.com'

-- No email user
!create user : User
!set user.id := 'user2'
!set user.name := 'John Doe'

-- Incorrect email user
!create user : User
!set user.id := 'user3'
!set user.name := 'John Doe'
!set user.email := 'john.doe'
