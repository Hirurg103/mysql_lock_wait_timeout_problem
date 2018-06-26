# Initialize application

```
bundle install
bundle exec rake db:create
bundle exec rails db:migrate
bundle exec rspec spec/lib/users/update_name_spec.rb
```

it should fail with

```
F

Failures:

  1) Users::UpdateName should update first name of an archived user
     Failure/Error: users.each { |u| u.update_columns(first_name: 'John') }

     ActiveRecord::StatementInvalid:
       Mysql2::Error: Lock wait timeout exceeded; try restarting transaction: UPDATE `users` SET `users`.`first_name` = 'John' WHERE `users`.`id` = 10
     # ./app/lib/users/update_name.rb:21:in `block in update_all'
     # ./app/lib/users/update_name.rb:21:in `each'
     # ./app/lib/users/update_name.rb:21:in `update_all'
     # ./app/lib/users/update_name.rb:16:in `block (2 levels) in update_batch'
     # ------------------
     # --- Caused by: ---
     # Mysql2::Error:
     #   Lock wait timeout exceeded; try restarting transaction
     #   ./app/lib/users/update_name.rb:21:in `block in update_all'

```

See [this gist](https://gist.github.com/Hirurg103/0425c41a09b298f22484dfc61666949e) for the details
