Feature: Economy Parking feature
  The parking lot calculator calculates costs for Economy Parking.

  @economy
  Scenario Outline: Calculate Economy Parking Cost
    When I park my car in the Economy Parking Lot for <duration>
    Then I will have to pay <expected_price>

  Examples:
    | duration      | expected_price |
    | 30 minutes    | $ 2.00         |
    | 1 hour        | $ 2.00         |
    | 4 hours       | $ 8.00         |
    | 5 hours       | $ 9.00         |
    | 6 hours       | $ 9.00         |
    | 24 hours      | $ 9.00         |
    | 1 day 1 hour  | $ 11.00        |
    | 1 day 3 hours | $ 15.00        |
    | 1 day 5 hours | $ 18.00        |
    | 6 days        | $ 54.00        |
    | 6 days 1 hour | $ 54.00        |
    | 7 days        | $ 54.00        |
    | 1 week 2 days | $ 72.00        |
    | 3 weeks       | $ 162.00       |