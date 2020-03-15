Requirements
Use the Ruby on Rails framework.

Your models must:

X • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

X • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

X - Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

X - You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

X- Your application must provide standard user authentication, including signup, login, logout, and passwords.

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

Your forms should correctly display validation errors.

a. Your fields should be enclosed within a fields_with_errors class

b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

Example Domains
A Recipe Manager - Should provide the ability to browse recipes by different filters such as date created, ingredient count, rating, comments, whatever your domain provides. Additionally ingredients would need to be unique so that the first user that adds Chicken to their recipe would create the canonical (or atomic/unique/individual) instance of Chicken (the only row to ever have the name Chicken in the ingredients table). This will force a join model between ingredients and recipes and provide an easy way to group recipes by ingredients, which would be a great view to implement. Associating some user-centric data regarding recipes such as ratings or comments would further fill out the domain and provide some great learning experiences.

A Group Task Manager - An application that allowed the creation of task lists with individual tasks that can be assigned to a user would flex the majority of the requirements of this assessment. You would be able to create a list of tasks, add tasks to that list, assign those tasks to a user, and allow users to change the statuses of their tasks.

Restricted Domains
A Basic Blog App - We've used a Blog domain design for a lot of the rails lessons and code-alongs. The blog must have unique features/approaches and solve problems in different ways.

An Amusement Park - This is the domain design for one of the final Rails projects. Try to find inspiration from this project and build something unique and different.

Instructions
Create a new repository on GitHub for your Rails application.
When you create the Rails app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub. You will use this file as a personal checklist of requirements as you complete the project.
Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. This is important and you'll be graded on this.
Record at least a 30 min coding session. During the session, either think out loud or not. It's up to you. You don't need to submit it, but we may ask for it at a later time.
Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement before you submit your project.
Write a README.md.
Submit a video of how a user would interact with your working web application.
Write a blog post about the project and process.
When done, submit your GitHub repo's url, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.



todo:
#users
##models

##views
index
create
new

##controllers
index

##routes
get '/users', to: 'users#index'
get '/users/new', to: 'users#new'
post '/users', to: 'users#create'

<%= link_to "Add a new company", new_travel_company_path %>

<%@companies.each.with_index(1) do |company, index|%>
  <h3><%= "#{index}. " %><%= link_to company.name, company_path(company) %></h3>
<% end %>

<%= link_to "Add a new company", new_company_path %>


  Select a company: <%= f.collection_select :company_id, Company.all, :id, :name, include_blank: true %>


  <h2><%= @company.name %></h2>
    <h3>Location: <%= @company.location %></h3>
    <h3>Category: <%= @company.category %></h3>


<h2>Route: <%= @travel.name %></h2>
  <%= f.text_field :location, value: @travel.name %><br>


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :companies
  has_many :travels, through: :offers
  validates_presence_of :username, :password, :password_confirmation
  validates_uniqueness_of :username
  has_secure_password


------TODO------

*** add dropdown menu to select category for new companies
*** determine where to send route after company create
*** company locations dropdown to select an available path or add a new path
*** travel routes link shows name of actual route vs id of route
*** travel is the main start point - click route to add company then add offers for that company
*** only unique companies to database - validates_uniqueness_of :name
*** assign a company to a route when offer is created
*** fix render redirect errors on offersController
*** add dropdown to select company categories

51

User
x - go to a travel and see all routes
x - open a route to see all company offers
x - go to companies and see all offers
x - sort companies by all or category
no point of company if there is no offer


Log-in user
Show list of all user companies
Add a new company
Link to view all companies by routes
Add offers to only your company
check hacking and find routes just through the url bar


Do admin first
Admin
Add offers
Add travel
Add companies
Delete offers
Delete travel
Delete companies

Scope method
Companies by category
