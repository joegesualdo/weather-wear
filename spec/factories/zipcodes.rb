FactoryGirl.define do
  factory :zipcode do
    zip "07302"
    city "Jersey City"
    state "NJ"
    latitude 40.721602
    longitude (-74.04703)
    timezone_offset (-5)
    daylight_savings_time true
  end
end
