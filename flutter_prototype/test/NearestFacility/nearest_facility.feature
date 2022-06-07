Feature:NearestFacility
    Scenario:See Distance in a Queue page
        Given the app is running
        When I enter the {'Cantina'}
        Then the distance between me and the facility appears

    Scenario: No closest Queue in main page
        Given the app is running
        Then I see {'Não há fila mais proxima'}