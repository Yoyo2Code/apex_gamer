desc "Load Gaming Data"
task :update_data => :enviornment do
  puts "Updating data..."
  LoadCompaniesWorker.preform_async
  LoadPlatformsWorker.preform_async
  LoadGamesWorker.preform_async
  puts "done."
end
