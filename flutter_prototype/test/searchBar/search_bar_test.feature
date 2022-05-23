Feature: SearchBar
    Scenario: Parking Lot Search
        Given the app is running
        When I select the search bar and search {'parque'}
        Then all the parking lot facilities will show up
    
    Scenario: Filter unwanted facilities
        Given the app is running
        When I select the search bar and search {'cantina'}
        Then all the parking lot facilities won't show up

    Scenario: Input nothing
        Given the app is running
        When I select the search bar and search {''}
        Then all the facilities show up