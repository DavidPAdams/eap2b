# Engineer Assessment Project - Level 2
Last updated - 02/28/2020

## OVERVIEW
For the next step in our hiring process, we’d like you to see you put your skills to the test. Review the below artifact to get up to speed on your project. This project is to evaluate and assess your current knowledge and skill level. Although no mockups will be provided, the interface and functionality should be clean, simple and meet professional standards.

## YOUR TASK
1. Create a rails application using the specifications and acceptance criteria below.
2. This will be a very simple application with a single index view with 1+ partials.
3. Provide a clean and modern interface.
4. Once finished, please deploy the application to Heroku and push to public GitHub repo.
5. Provide URLs to the deployed application and GH repo.

## SPECIFICATIONS
1. Rails 6+
2. Ruby 2.5+
3. Utilize Bootstrap 4
4. All views should be in HAML
5. You have the option to use 3rd party gems and/or JS libraries.

## ACCEPTANCE CRITERIA
1. Create a simple index of users
2. User attributes needed: Name*, Email*, Title, Phone*, Status(active, inactive)*, timestamps
3. The column should be ordered: Last updated, Name, Email, Title, Phone, Status
4. The text in the status column should be red if the status is “inactive” and green if the status is “active”
5. ISBAT create a new user
6. ISBAT edit an existing user
7. ISBAT delete an existing user
8. Emails should be unique, ISNBAT create multiple users with the same email address.
9. ISBAT sort columns by attributes
10. ISBAT to filter users via a search field
11. The index should contain at least 1000 users with seeded data.
12. The index should be paginated with 25 users per page.
13. The user should never need to leave or reload the index view. All forms should be in modals and updates should update the table asynchronously.
14. Assets should be configured correctly via webpacker. The design should be modern, clean and professional.
