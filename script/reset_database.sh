sudo service postgresql start
rake db:drop
rake db:create
rake db:migrate
rake db:seed
