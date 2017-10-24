# **Nyoro2 Project (2017年8月30日 - ?)**
#### Album database and E-Commerce

### About Project
* **Just for learning purpose**
* Technologies: Ruby on Rails 5.x full stack
* Features:
  * Authentication (+ Social login) / Authorization (gem devise)
  * Chart (D3.js => moved to Chart.js)
  * Search (gem sunspot)
  * Version management (Page is editable by both users and admins)

### Initialization
* `$ bundle install`
* `$ yarn install`
* `$ rake db:drop db:create db:schema:load db:seed`
* `$ rails s`

### Environment
##### Ruby Version:
* ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux]
* Rails 5.1.4

##### System dependencies
* sunspot require java and unzip
  * `$ sudo apt-get install default-jre`
  * `$ sudo apt-get install unzip`
* sidekiq require redis
  * `$ sudo apt-get install redis-server`
* Node.js
* Yarn
* ngrok => moved to local network by disabling firewall
  * `$ ./ngrok http 3000`

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

###### Overview
* [Official RoR beginner guide](http://guides.rubyonrails.org/getting_started.html)
* [Official RoR API](http://api.rubyonrails.org/)
* [Some other resources](https://github.com/TranBaVinhSon/awesome-programming-tutorials#ruby-on-rails)

###### In-depth:

* [Ajax in RoR](http://guides.rubyonrails.org/working_with_javascript_in_rails.html)
* [Simple Divise setup](https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication)
* [Search with Sunspot](https://github.com/sunspot/sunspot/wiki)
* [Counter Cache](http://railscasts.com/episodes/23-counter-cache-column)
