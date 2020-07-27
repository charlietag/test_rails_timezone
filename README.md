# README
* Try rails multiple timezone - built in function

## Packages

* Ruby version
  * 2.7.0

* Rails version
  * 6.0.3.2

## Basic setup
* Gems - useful for dev
  * gem 'pry-rails', :group => :development
  * gem 'bullet', group: 'development'


* jQuery
  * yarn add jquery
    * {project_name}/app/javascript/packs/application.js

      ```bash
      import "jquery/src/jquery"
      ...
      ```

* bootstrap
  * yarn add bootstrap popper.js (don't add popper v2, bootstrap default requires v1.16) , (no need to import popper.js manually, bootstrap will do it automatically)
    * app/javascript/packs/application.js
      * `import "bootstrap/dist/js/bootstrap"`
    * app/assets/stylesheets/application.css
      * `*= require 'bootstrap/dist/css/bootstrap'`

## Rails setup

* generate scaffold
  * `bin/rails g scaffold Book name:string author:string`
  * `bin/rails g scaffold Config name:string value:string`


## config - credential

* command
  * `EDITOR=vim bundle exec rails credentials:edit`

    ```bash
    development:
      db:
        user: user
        pass: pass

    production:
      db:
        user: user
        pass: pass
    ```

* config/database.yml

  ```bash
  default: &default
    adapter: mysql2
    encoding: utf8mb4
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    username: <%= Rails.application.credentials[Rails.env.to_sym][:db][:user] %>
    password: <%= Rails.application.credentials[Rails.env.to_sym][:db][:pass] %>
    socket: /var/lib/mysql/mysql.sock

  development:
    <<: *default
    database: {project_name}_development

  test:
    <<: *default
    database: {project_name}_test

  production:
    <<: *default
    database: {project_name}_production
  ```

* Create database
  * `bundle exec rails db:create`

## Changes
* Basic config and setup
  * https://github.com/charlietag/test_rails_timezone/compare/v0.0.0...v0.0.1
* Start trying (Timezone in Rails database)
  * https://github.com/charlietag/test_rails_timezone/compare/v0.0.1...v0.0.2
* Start trying (Timezone - detected by browser javascript)
  * https://github.com/charlietag/test_rails_timezone/compare/v0.0.2...v0.0.3

## Note
* Package 'simple_form'
  * `gem 'simple_form'`
  * `rails generate simple_form:install --bootstrap`
* References
  * Ref. https://api.rubyonrails.org/classes/Time.html#method-c-use_zone
  * Ref. https://prathamesh.tech/2019/07/11/use-time-use_zone-to-navigate-timezone
  * Ref. https://thoughtbot.com/blog/its-about-time-zones#with-user-time-zones
