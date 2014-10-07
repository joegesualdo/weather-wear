class CitySuggestion
  def self.seed
   Zipcode.order(city: :asc).uniq.pluck(:city, :state).each do |city_and_state|
      city_and_state_string = city_and_state.join(", ")
      city = city_and_state[0]
      # loop over the zipcode name n times, where n is the number 
      # of characters in zipcode minus 1 
      # Why do we add the minus 1?
      # Note that we don’t create a last set called “search-suggestions:07758” 
      # (where 07758 is the full zipcode) because there is no point in returning “07758” 
      # as a suggested term when a user types “07758”. That’s why we added the minus 1 
      # to the length of the name.
      1.upto(city.length - 1) do |n|
        prefix = city[0, n]
        # Redis ZADD command is used to create a Sorted Set 
        # called “zipcode-suggestions” then ":" and whatever the prefix
        # is (i.e. "07", "07730", "077")
        # What is a sorted set?
        # Sorted Sets are very similar to Sets because they both 
        # store collections of strings, but a Sorted Set also 
        # stores an associated score with each string that is then used for sorting. 
        # We are making all the scores identical right now (i.e 1), but they can be 
        # incremented later to increase the ranking of popular zipcodes.
        $redis.zadd "city-suggestions:#{prefix.downcase}", 1, city_and_state_string
      end
    end
  end

  # this method accepts a prefix variable and uses ZREVRANGE to 
  # return the first 10 elements of a sorted set containing the specified prefix value. 
  def self.terms_for(prefix)
    # zrevrange extracts values from a set. It returns a range of 
    # elements sorted by score (with the highest scores listed first).
    # Change this is you want move results per search
    $redis.zrange "city-suggestions:#{prefix.downcase}", 0, 9 
  end
end
