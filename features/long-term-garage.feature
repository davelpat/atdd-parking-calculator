Feature: Long-Term Garage Parking feature
  The parking lot calculator calculates costs for Long-Term Garage Parking.

  @garage
  Scenario Outline: Calculate Long-Term Garage Parking Cost
    When I park my car in the Long-Term Garage Parking Lot for <duration>
    Then I will have to pay <expected_price>

  Examples:
    | duration      | expected_price |
    | 30 minutes    | $ 2.00         |
    | 1 hour        | $ 2.00         |
    | 3 hours       | $ 6.00         |
    | 6 hours       | $ 12.00        |
    | 7 hours       | $ 12.00        |
    | 24 hours      | $ 12.00        |
    | 1 day 1 hour  | $ 14.00        |
    | 1 day 3 hours | $ 18.00        |
    | 1 day 7 hours | $ 24.00        |
    | 6 days        | $ 72.00        |
    | 6 days 1 hour | $ 72.00        |
    | 7 days        | $ 72.00        |
    | 1 week 2 days | $ 96.00        |
    | 3 weeks       | $ 216.00       |