Feature: Long-Term Surface Parking feature
  The parking lot calculator calculates costs for Long-Term Surface Parking.

  @surface
  Scenario Outline: Calculate Long-Term Surface Parking Cost
    When I park my car in the Long-Term Surface Parking Lot for <duration>
    Then I will have to pay <expected_price>

  Examples:
    | duration      | expected_price |
    | 30 minutes    | $ 2.00         |
    | 1 hour        | $ 2.00         |
    | 5 hours       | $ 10.00        |
    | 6 hours       | $ 10.00        |
    | 24 hours      | $ 10.00        |
    | 1 day 1 hour  | $ 12.00        |
    | 1 day 3 hours | $ 16.00        |
    | 1 day 6 hours | $ 20.00        |
    | 6 days        | $ 60.00        |
    | 6 days 1 hour | $ 60.00        |
    | 7 days        | $ 60.00        |
    | 1 week 2 days | $ 80.00        |
    | 3 weeks       | $ 180.00       |