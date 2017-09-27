# **Nyoro2 Project**
#### Album database and E-Commerce

### About Project 
* **Just for learning purpose**
* Technologies: Ruby on Rails 5.x full stack
* Features: 
  * Authentication (+ Social login) / Authorization (gem devise)
  * Chart (D3.js)
  * Search (gem sunspot)
  * Version management (Page is editable by both users and admins)

### Initialization
* `$ bundle install`
* `$ yarn install`
* `$ rake db:drop db:create db:schema:load db:seed`
* `$ rails s`

### Environment
##### Ruby Version: 
* Ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
* Rails 5.1.3

##### System dependencies
* sunspot - JAVA: `$ sudo apt-get install default-jre`
* sidekiq - redis: `$ sudo apt-get install redis-server`
* Node.js
* Yarn
* ngrok: `$ ./ngrok http 3000`

##### Database - MySQL
* Username: `root`
* Password: none
* Initialization: `$ rake db:drop db:create db:schema:load db:seed`

##### Services
* sunspot: `$ rake sunspot:solr:start`
* sidekiq: `$ redis-server`

### Resources
* [VGMdb](http://vgmdb.net/)
* ...

### Learning Materials
* [Official RoR beginner guide](http://guides.rubyonrails.org/getting_started.html)
* [Official RoR API](http://api.rubyonrails.org/)
* [Ajax in RoR](http://guides.rubyonrails.org/working_with_javascript_in_rails.html)
* [Simple Divise setup](https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication)
* [Search with Sunspot](https://github.com/sunspot/sunspot/wiki)
