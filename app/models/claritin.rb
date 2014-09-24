class Claritin 
  # Retrieve the claritin forecast for a given zipcode
  #
  # @param zipcode [String] 
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

    # Response Description:
    # You'll get back an array of 4 data points: \"forecast\":[0.6,1.0,8.3,9.0] 
    # This is your 4 day forecast. The first one is current pollen count. The scale 
    # is from 0 -12 if you'd like to make a thermometer or other GUI element. 
    # It also has the primary type of pollen: \"pp\":\" Birch and Sweetgum.\" 
    response_body
  end
end
