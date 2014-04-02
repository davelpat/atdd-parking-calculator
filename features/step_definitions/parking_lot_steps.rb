When(/^I park my car in the Valet Parking Lot for (.*)$/) do |duration|
  $parkcalc.select_location('Valet Parking')
  $parkcalc.enter_parking_duration(duration)
end

Then(/^I will have to pay (.*)$/) do |expected_price|
  $parkcalc.calculated_fee.should eq(expected_price)
end