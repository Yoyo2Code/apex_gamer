desc "Load Gaming Data"
task :update_data do
  puts "Updating data..."
  DataSaver.new.save_companies
  DataSaver.new.save_platforms
  DataSaver.new.save_games
  puts "done."
end
