# Job Tracker

## Learning Goals

* Use migrations to create tables with different data types including indexed foreign keys
* Update a routes file using appropriate syntax
* Create controllers with methods for all CRUD functionality appropriately using RESTful routes
* Use ActiveRecord in models to appropriately 1) manage relationships between resources, and 2) perform intermediate queries of a database
* Use best practices in views, partials, and helpers to minimize the number of variables passed and duplication of code and follow SRP


## Project Specs

You will be working with the existing code in this repository to modify a personal job tracking app. Imagine that your close friend has learned just enough rails to be dangerous, and has started to create an app to track job opportunities they find interesting. They are planning to maintain this site themselves (i.e. they will be adding all companies and jobs, and don’t anticipate companies or other users posting/reviewing jobs). The application currently has the following functionality:

* Jobs can be created and read.
* Jobs have a title, description, a city, and level_of_interest.
* Companies can be created, read, updated, and deleted.
* Companies have a name.
* A Job `belongs_to` a Company, and a Company `has_many` jobs.

You will be to add the following functionality to this application.

### Jobs

* You need to add the update and delete functionality for a Job.

### Categories

* The user can create a new Category by filling out a form. Each Category has a title (e.g. “Web Development”, “Education”, “Finance”).
* When the user successfully creates a Category they are shown a page with the Category title.
* When the user tries to create a Category that already exists, they are brought back to the page with the form to create a Category.
* The user can view a list of all Categories on a single page, and each Category can be deleted from that page. There is also a link to “Edit” each Category, which takes the user to a form where they can update the Category.
* When the user creates a new Job, they are required to select its Category from a drop down menu of existing categories. They also see a link to create a new Category.
* When the user visits a page for a specific Category, they see a list of Jobs in that Category.

### Comments

* When the user visits the page for a specific Job, in addition to information about the job there is a form that allows them to enter a Comment for that Job (e.g. “Spoke to hiring manager, Jacob. Plan to follow up Monday.”).
* Each comment has content (also created_at and updated_at).
* When the user submits a new comment, they are redirected back to the page for that specific job and the comment appears on the page.
* The user can leave multiple comments on a job and the most recent comments are shown above older comments (in reverse of the order in which they were created).

### Contacts

* When the user visits the page for a specific Company, in addition to information about the job there is a form that allows them to enter a Contact for that Company (e.g. “Penelope Santorini”, “Hiring Manager”, “penelope@wooo.com”).
* Each Contact has a full name, position, email, and company (which relates to the company you’ve already created). It should be possible for a Company to have more than one Contact, but a Contact only works at one Company.
* When the user submits a new contact, they are redirected back to the page for that specific company and the contact appears on the page.

### Analysis

* The user can visit `/jobs?sort=location` to view a list of the jobs sorted by `city`.
* The user can visit `/dashboard` to see
    * A count of jobs by `level_of_interest`
    * The top three companies ranked by average level of interest along with their respective average level of interest.
    * A count of jobs by `location` with a link to visit a page with jobs only in that location. The url should be `/jobs?location=Denver`.
* The user can visit `/jobs?sort=interest` to view a list of the jobs sorted by `level_of_interest`.

## Extensions:

### Tags

* The user is able to create new Tags from a form on the website.
* Each tag has a Title (e.g. “interview scheduled”, “waiting to hear back”, “email sent”, “research complete”, etc.).
* The user is able to view a list of Tags
* The user is able to delete Tags from the list of Tags.
* The list of tags also has a link to “Edit” each tag.
* When a user visits the site for a specific Tag they see a list of all jobs with that Tag.

## Rubric

### 1) Database, Relationships, and Migrations

* 4: The database has appropriate tables and appropriate columns to create relationships between tables. Foreign keys are indexed to increase database performance. Tables and columns are appropriately named.
* 3: The database has been prepared in a manner that allows for all functionality in the application, but not all foreign keys are indexed, and tables/columns may be named in a manner inconsistent with Rails conventions.
* 2: The database supports most, but not all functionality. The developer may struggle to explain the relationships between tables.
* 1: The database likely does not support significant portions of functionality. Relationships between tables may be lacking. The developer may have placed foreign keys on the wrong table or not be using a join table when appropriate.

### 2) Routes

* 4: Routes are defined for all functionality and not any additional functionality. All routes conform to RESTful conventions for resources, and routes to pages that are not specifically for resources stored in the database are not named in a way that an experienced developer would find surprising.
* 3: The developer has routes for all functionality that they provide, but may include routes that are not used in the application.
* 2: The routes file is missing routes for some functionality that the developer has implemented. Routes may be named in unconventional ways. Some routes may be preventing pattern matching because they are out of order.
* 1: Routes have not been updated or significant functionality is missing.

### 3) Controllers

* 4: The developer has moved logic out of the controllers and into the models/POROs where appropriate. The developer uses strong params in a private method. Instance variables being passed to views are appropriately named and limited in number. The developer can speak to each choice made when questioned.
* 3: Some logic may leak into the controllers that would more appropriately exist in a model/PORO. The developer may pass more instance variables than necessary to the view.
* 2: Significant logic exists in the controllers. Methods may be more complicated than necessary. Most functionality is still supported.
* 1: Significant functionality may be missing. Significant logic may be present, and it is difficult to understand at a glance the purpose of each method.


### 4) ActiveRecord

* 4: ActiveRecord methods are used in models to supply all appropriate functionality. Methods exist on the appropriate model, and developers are not referencing other classes or `self` in models unnecessarily. Ruby enumerables are not used where ActiveRecord methods could provide the necessary functionality. The developer can explain the ActiveRecord methods they used and the relationships between ActiveRecord models.
* 3: ActiveRecord methods are used appropriately in the database, but some Ruby enumerables may also be used. The developer uses ActiveRecord relationships appropriately, and does not call on other classes in their models.
* 2: The developer may be calling on other classes in models (e.g. `Category.where(title: title)`), and may struggle to explain choices they made in implementing some functionality.
* 1: Significant functionality is missing. The developer seems to not understand the methods that ActiveRecord makes available.


### 5) Views

* 4: Logic has been removed from views and controllers to the full degree possible, the developer ha minimized the number of variables passed to the view, and the developer can articulately explain their strategies for extracting this logic. The developer uses partials to reduce duplication of code in the view layer.
* 3: Limited logic that could be moved elsewhere remains in the views and/or controllers and developers are able to identify potentially opportunities to refactor.
* 2: Significant logic leaks into the view or remains in controllers and developers show some difficulty in identifying strategies to refactor.
* 1: Significant logic is present in the view or controllers and developers are unable to articulate potential strategies to refactor.

### 6) User Experience

* 4: The application has been styled and the user can easily navigate between different portions of the application without manually entering the URL into the nav-bar or using the back button on their browser.
* 3: The application has been styled, but the user may need to use the nav-bar to enter a URL or back button to get to access some functionality.
* 2: The application has limited styling, and it may not be clear how to navigate the application.
* 1: The application has little to no styling and it is difficult to navigate.

### 7) Testing

* 4: Project has a running test suite that exercises the application at multiple levels
* 3: Project has a running test suite that tests and multiple levels but fails to cover some features
* 2: Project has sporadic use of tests and multiple levels
* 1: Project did not really attempt to use TDD
