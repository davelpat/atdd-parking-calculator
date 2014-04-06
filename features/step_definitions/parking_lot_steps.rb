When(/^I park my car in the (\w+ Parking) Lot for (.*)$/) do |lot, duration|
  $parkcalc.select_location(lot)
  $parkcalc.enter_parking_duration(duration)
end

Then(/^I will have to pay (.*)$/) do |expected_price|
  $parkcalc.calculated_fee.should == expected_price
end