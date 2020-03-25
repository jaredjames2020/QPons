TODO
1. create a single route, controller action, scope method, and view for both company and travel categories
2. clean up code!
3. add validation messages to login
4. make sure things don't crash

TODO ANSWERS
1a. create a single route,
  WHERE: config/routes line 18 & 19
  CHANGE: utilizes dynamic routes
  PREVIOUS: (previously had routes to each category individually)

  CODE:  get '/companies/:category', to: 'companies#category'
         get '/travels/:category', to: 'travels#category'

1b. controller action,
  WHERE: CompaniesController line 32-24 & TravelsController line 23-25
  CHANGE: generic method utilizing scope method to select all objects from database filtered by category
  PREVIOUS: (previously had a method for each category)

  CODE: def category
          @deals = Company.category(params[:category].capitalize)
        end

1c. scope method,
  WHERE: models/company line 8
  CHANGE: scope method with attribute to select all defined objects
  PREVIOUS:(previously had a scope method for each category)

  CODE: scope :category, ->(category) {where(category: category)}

1d. and view for both company and travel categories
  WHERE: views/companies/category and views/travels/category
  CHANGE: view pages to present retrieved data from the models
  PREVIOUS: (previously had a view for each category)

2. clean up code! - removed arbitrary commented out lines of code

3. add validation messages to login -
  WHERE: devise/sessions/new
  CHANGE: added validation messaging for login, email and password
  PREVIOUS: (previously no message was displayed)

4. make sure things don't crash - tested links for crashes/bugs, seems to be ok. Fixed the travel id crash that occurred during the review.
