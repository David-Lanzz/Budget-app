bundle install;
bundle exec rake assets:precompile;
bundle exec rake assets:clean;
rails active_storage:install;
bundle exec rake db:migrate
