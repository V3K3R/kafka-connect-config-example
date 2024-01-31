Feature: Ride

  Background: setup
    Given we have the following empty tables created
      | db    | table     |
      | local | driver    |
      | local | passenger |
      | local | ride      |

  Scenario: happy ride
    Given we insert the following data into table "public.driver"
      | id | name | country |
      |  1 | john | de      |
    And we insert the following data into table "public.passenger"
      | id | name | country |
      |  2 | max  | de      |
    And we insert the following data into table "public.ride"
      | id | driver_id | passenger_id | distance |
      |  1 |         1 |            1 |        5 |
