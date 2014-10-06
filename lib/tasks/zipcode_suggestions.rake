# We’re creating a task called index and making it dependent on 
# a Rake task provided by Rails called environment, which loads 
# the Rails environment and gives us access to our SearchSuggestion 
# class. Then we’re just calling the seed() method we defined earlier 
# to seed Redis with zipcode suggestions. (We wrap this up inside a 
# namespace called search_suggestions to keep things neat and organized.)
namespace :zipcode_suggestions do

  desc 'Generate zipcode suggestions'
  task index: :environment do
    ZipcodeSuggestion.seed
  end

end
