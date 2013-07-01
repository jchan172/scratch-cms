# To disable unicorn, remove this unicorn.rb file and remove this line from the Procfile:
# web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb

worker_processes 4
		timeout 30