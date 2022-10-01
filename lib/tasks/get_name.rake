namespace :get do
  desc "Print last user's first anem."
  task :last_user_first_name do
    c = User.last
    puts c.first_name
  end
end