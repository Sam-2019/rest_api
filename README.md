# REST API

[![Test CI](https://github.com/Sam-2019/rest_api/actions/workflows/test_ci.yml/badge.svg?branch=develop)](https://github.com/Sam-2019/rest_api/actions/workflows/test_ci.yml) &nbsp; [![Maintainability](https://api.codeclimate.com/v1/badges/06cd6f35be4db723b41e/maintainability)](https://codeclimate.com/github/Sam-2019/rest_api/maintainability) &nbsp; [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) &nbsp; [![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

Simple rest api with rails

## Dependencies

- [SQLite](https://sqlite.org/index.html): lightweight disk-based database resource.
- [AASM](https://github.com/aasm/aasm): library for adding finite state machines to Ruby classes
- [Active Admin](https://activeadmin.info/): Ruby on Rails plugin for generating administration style interfaces.
- [Prawn](https://github.com/prawnpdf/prawn): fast, tiny, and nimble PDF generator for Ruby
- [PaperTrail](https://github.com/paper-trail-gem/paper_trail): track changes to your models, for auditing or versioning
- [Rubocop](https://github.com/rubocop/rubocop): Ruby static code analyzer (a.k.a. linter) and code formatter.

## Prerequisites

The setup steps expect following tools installed on the system.

- Github
- Ruby [3.0.2](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [7.0.1](https://github.com/organization/project-name/blob/master/Gemfile#L12)

#### 1. Check out the repository

```bash
git clone https://github.com/Sam-2019/rest_api.git
```

#### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

#### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000/admin

##### Linting

Just type `rubocop` in a Ruby project's folder and watch the magic happen.

```
$ cd /rest_api
$ rubocop
```