# We’re creating a task called index and making it dependent on 
# a Rake task provided by Rails called environment, which loads 
# the Rails environment and gives us access to our CitySuggestion 
# class. Then we’re just calling the seed() method we defined earlier 
# to seed Redis with city suggestions. (We wrap this up inside a 
# namespace called city_suggestions to keep things neat and organized.)
namespace :city_suggestions do

  desc 'Generate city suggestions'
  task index: :environment do
    CitySuggestion.seed
  end

end
