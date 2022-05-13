Feature: AddFeature
    Test add features


    Scenario: Tests queue status
        Given I test the initial state of the app
        When I click the Parque Estacionamento 1 button
        Then I enter the queue and see the status Bom
    
    Scenario: Tests queue capacity
        Given I test the initial state of the app
        When I click the Parque Estacionamento 1 button
        Then I enter the queue and see the 3 capacity values: 525,200 and 325