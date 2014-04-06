Feature: Valet Parking feature
  The parking lot calculator calculates costs for Valet Parking.

  @valet
  Scenario Outline: Calculate Valet Parking Cost for half an hour
    When I park my car in the Valet Parking Lot for <duration>
    Then I will have to pay <expected_price>
  Examples:
    | duration         | expected_price |
    | 30 minutes       | $ 12.00        |
    | 3 hours          | $ 12.00        |
    | 5 hours          | $ 12.00        |
    | 5 hours 1 minute | $ 18.00        |
    | 12 hours         | $ 18.00        |
    | 24 hours         | $ 18.00        |
    | 1 day 1 minute   | $ 36.00        |
    | 3 days           | $ 54.00        |
    | 1 week           | $ 126.00       |

  @short-term
  Scenario Outline: Calculate Short-Term Parking Cost
    When I park my car in the Short-Term Parking Lot for <duration>
    Then I will have to pay <expected_price>

  Examples:
    | duration            | expected_price |
    | 30 minutes          | $ 2.00         |
    | 1 hour              | $ 2.00         |
    | 1 hour 30 minutes   | $ 3.00         |
    | 2 hours             | $ 4.00         |
    | 3 hours 30 minutes  | $ 7.00         |
    | 12 hours 30 minutes | $ 24.00        |
    | 1 day 30 minutes    | $ 25.00        |
    | 1 day 1 hour        | $ 26.00        |
