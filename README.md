# ruby-on-rails-practice-project
This is a practice project for Ruby on Rails, which is to build a library management system.

## Local development

- Create a `.env` file inside the root directory:

  ```
  DEFAULT_LIBRARIAN_PASSWORD: <strong_password>
  ```

- Setup the pre-commit hook:

  ```shell
  cp scripts/git_hooks/pre-commit .git/hooks/
  chmod +x .git/hooks/pre-commit
  ```

- Run `docker compose up`.
- To run the tests: `RAILS_ENV=test bundle exec rspec` within the rails container.

## Requirements document
The library management system is a system for library management that enables users to search for and borrow books. Your task is to develop a system that fulfills the requirements outlined in this document. Once completed, the system must be fully operational and deployed on a cloud environment. You must also demonstrate that the system meets all the requirements.
### Functional requirements
Functional requirements refer to the specific features and capabilities that a system must possess for users to perform particular tasks. These requirements describe what the system should do and how it should respond to user actions or inputs.
#### Required functional requirements
You must implement the following requirements:
1. User management:
  - Users can register for a new account using their name, email, and password.
  - Users can sign in to the system using their email and password.
  - Users can sign out from the system.
  - Users can update their email and password.
2. Book management:
  - Users can search for books by title, authors, and ISBN.
  - Users can view a book's details, including its current availability.
  - Users can check out library books.
  - Users can return borrowed library books.
  - Users can list their current check-out and overdue library books.
  - Users can view their account information and check-out history.
  - Librarians can add a book.
  - Librarians can edit a book's information.
  - Librarians can list overdue books.
3. Librarian management:
  - Librarians can register another librarian with an initial password.
  - Librarians can sign in to the system with their email and password.
  - Librarians can search users' accounts by name and email.
  - Librarians can view the users' account information with current check-out and history.

These requirements will enable users and librarians to perform necessary tasks for managing the library's books and accounts.
#### Optional functional requirements
The following requirements are optional and can be implemented if there is enough time during development:
1. User Features:
  - Users can make a book suggestion for purchase.
  - Users can view the list of new books and popular books.
  - Users can reset their password when they forget it.
  - Users can reserve a book.
  - Users can cancel the reservation.
  - Users can view their reservations.
2. Librarian Features:
  - Librarians can deactivate a user account, preventing them from borrowing books.
  - Librarians must change their initial password when they log in for the first time.
  - Librarians can switch to a superuser with the password for the superuser.
3. Superuser Features:
  - Superusers can add or delete librarians.
  - Superusers can view the list of librarians.

These requirements can enhance the system's functionality and improve the user experience.
#### Required Business rules
The application must adhere to the following business rules:
1. User restrictions:
  - Users may check out a maximum of 10 books for 14 days.
  - Users may reserve up to five books when a book is unavailable.
  - Users must check out reserved books within five days of availability; otherwise, the reservation will be canceled.
  - Users cannot check out or reserve additional books if they have overdue books. Existing reservations will also be canceled.
2. Book management:
  - The library may contain multiple copies of the same book, including different editions which are considered the same book.

These business rules are essential to ensure the library's resources are used appropriately and effectively while providing fair access to all users.
#### Non-functional requirements
Non-functional requirements (NFRs) are criteria used to assess the quality of a system rather than specific functionalities. The system must meet the following NFRs:
#### Required non-functional requirements
The following are the non-functional requirements that must be met:
1. System architecture:
  - The system must be a web-based application.
2. Development process:
  - The source code must be stored in a Git repository.
  - All code must have automated tests, and coverage should be at least 30%.
3. Security:
  - Passwords must be at least eight characters long and include numbers or symbols and at least one character.
  - Passwords must be stored in hashed form using `bcrypt`.

These non-functional requirements are essential to ensuring the system is secure, reliable, and maintainable over time.
#### Required diagrams
You should create the following diagrams during the development process. These materials are intended to help the people understand the system and do not need to follow a particular notation strictly. You should include these diagrams in the final presentation slide.
  - Application architecture diagram: This diagram should illustrate the overall structure of the application.
  - Screen flow diagram: This diagram should demonstrate the flow of screens and user interactions within the application.
  - Entity relationship diagram: This diagram should illustrate the relationships between data entities in the system, including users, books, and reservations.

These diagrams are essential for understanding the system's overall structure, functionality, and data relationships and will aid in presenting the system's design to stakeholders.
### Appendix
The following materials are provided for information purposes only and may or may not be utilized during the system development process:
- data/user_list.xlsx
- data/book_list.xlsx
