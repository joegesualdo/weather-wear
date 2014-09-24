class Claritin 
  # Retrieve the claritin forecast for a given zipcode
  #
  # @param latitude [String] Latitude.
  # @param longitude [String] Longitude.
  def self.forecast(zipcode)
    raise "Zipcode must be a string" if !zipcode.is_a? String 

    url = URI.parse("http://www.claritin.com/weatherpollenservice/weatherpollenservice.svc/getforecast/#{zipcode}")
    response = Net::HTTP.get_response(URI(url.to_s))
    response_body = response.body
    
    # response is retured is a format that can not be parsed by JSON
    # This code will format the response string so it can be parsed by json
    #  1) remove unneccessary \ slashes. (replaces '\\\' with '\')
    #  2) Strips the leading and trailing quotes (")
    response_body.gsub!(/\\/,"")
    response_body.slice!(0)
    response_body.slice!(-1)

    response_body
  end
end
