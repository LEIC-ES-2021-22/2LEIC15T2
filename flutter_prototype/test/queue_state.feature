Feature: QueueState
    Scenario: Test queue state
        Given the app is running
        When I see {'Parque 1 (Estacionamento) 🚗'} text
        When  I tap {'Parque 1 (Estacionamento) 🚗'} text
        Then I see {'Bom'} text

    Scenario: Test queue capacity
        Given the app is running
        When I see {'Parque 1 (Estacionamento) 🚗'} text
        When  I tap {'Parque 1 (Estacionamento) 🚗'} text
        Then I see {'525'} text
        
    Scenario: Report State
        Given the app is running
        When I see {'Parque 1 (Estacionamento) 🚗'} text
        When  I tap {'Parque 1 (Estacionamento) 🚗'} text
        And I see {'Bom'} text
        And I see {'Reportar'} text
        And I tap {'Reportar'} text
        And I see {'Mau'} text
        And I tap {'Mau'} text
        And I see {'Submeter'} text
        And I tap {'Submeter'} text
        And I see {'Parque 1 (Estacionamento) 🚗'} text
        And  I tap {'Parque 1 (Estacionamento) 🚗'} text
        Then I see {'Mau'} text