# Sale Management

A small administrative system that enables sales management and sales 
representatives to be **Manager** and **Salesperson**.
* The seller can make sales, register customers and see their commissions,
* Manager can create products, discounts and other users.
* Export data to PDF using graphics.

## Prerequisites

>You just need have docker-compose installed in your machine.

## Getting Started
>To get the app running, run the following commands:

  ```docker
    docker-compose build
    docker-compose run --rm webiste bundle install
    docker-compose run --rm website bundle exec rails db:create
    docker-compose run --rm website bundle exec rails db:migrate
    docker-compose up
  ```

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Dependency Management
* [Rails Admin](https://github.com/sferik/rails_admin) - Dependency Management

## Authors

* **Lucas Brandão** - [brandaoplaster](https://github.com/brandaoplaster)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details