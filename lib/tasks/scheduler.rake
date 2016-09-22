require 'app/workers/load_companies_worker'
require 'app/workers/load_platorms_worker'
require 'app/workers/load_games_worker'

desc "Load Gaming Data"
task :update_data do
  puts "Updating data..."
  DataSaver.new.save_companies
  DataSaver.new.save_platforms
  DataSaver.new.save_games
  puts "done."
end
