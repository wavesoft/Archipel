Feature: Test the correct startup of Archipel

  Scenario: Waiting for the connection window
    Given the application is running
    When I enter my credentials "test@jabber.archipelproject.org" "password" "htt://jabber.archipelproject.org:5280/http-bind"
    Then connection fields must be filled
    When I press the button with title "Connect"
    Then Archipel connects
    Given Archipel is connected


