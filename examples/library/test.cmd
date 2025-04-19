-- Create Date instances for loan tracking
!create date1 : Date
!set date1.day := 1
!set date1.month := 4
!set date1.year := 2023

!create date2 : Date
!set date2.day := 15
!set date2.month := 4
!set date2.year := 2023

!create date3 : Date
!set date3.day := 1
!set date3.month := 5
!set date3.year := 2023

-- Create 5 members
!create member1 : Member
!set member1.name := 'John Smith'
!set member1.memberId := 'M001'

!create member2 : Member
!set member2.name := 'Alice Johnson'
!set member2.memberId := 'M002'

!create member3 : Member
!set member3.name := 'Robert Davis'
!set member3.memberId := 'M003'

!create member4 : Member
!set member4.name := 'Emma Wilson'
!set member4.memberId := 'M004'

!create member5 : Member
!set member5.name := 'Michael Brown'
!set member5.memberId := 'M005'

-- Create 10 books
!create book1 : Book
!set book1.title := 'Database Systems'
!set book1.available := true

!create book2 : Book
!set book2.title := 'Programming in Java'
!set book2.available := true

!create book3 : Book
!set book3.title := 'Software Engineering'
!set book3.available := true

!create book4 : Book
!set book4.title := 'Artificial Intelligence'
!set book4.available := true

!create book5 : Book
!set book5.title := 'Computer Networks'
!set book5.available := true

!create book6 : Book
!set book6.title := 'Operating Systems'
!set book6.available := true

!create book7 : Book
!set book7.title := 'Web Development'
!set book7.available := true

!create book8 : Book
!set book8.title := 'Data Structures'
!set book8.available := true

!create book9 : Book
!set book9.title := 'Machine Learning'
!set book9.available := true

!create book10 : Book
!set book10.title := 'Cloud Computing'
!set book10.available := true

-- Create some loans (both active and returned)
!create loan1 : Loan
!set loan1.loanDate := date1

!create loan2 : Loan
!set loan2.loanDate := date1
!set loan2.returnDate := date2

!create loan3 : Loan
!set loan3.loanDate := date2

-- Create association links for active loans
-- Member1 has 2 books currently borrowed
!insert (book1,member1) into BorrowedBy
!set book1.available := false
!insert (book1,loan1) into LoanHistory
!insert (member1,loan1) into MemberLoans

!insert (book2,member1) into BorrowedBy
!set book2.available := false
!insert (book2,loan3) into LoanHistory
!insert (member1,loan3) into MemberLoans

-- Member2 has 1 book currently borrowed
!insert (book3,member2) into BorrowedBy
!set book3.available := false
!create loan4 : Loan
!set loan4.loanDate := date2
!insert (book3,loan4) into LoanHistory
!insert (member2,loan4) into MemberLoans

-- Add a returned book (no longer in BorrowedBy)
!insert (book4,loan2) into LoanHistory
!insert (member3,loan2) into MemberLoans

-- Check that all invariants are satisfied
check
