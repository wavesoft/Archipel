Given /^the application is running$/ do
  windows = app.gui.wait_for "//TNModalWindow[title='Connection']"

  raise "Application didn't start" if windows.nil?
end


When /^I enter my credentials "([^\"]*)" "([^\"]*)" "([^\"]*)"$/ do |arg1, arg2, arg3|
    app.gui.fill_in arg1, "//CPTextField[tag='2']"
    app.gui.fill_in arg2, "//CPTextField[tag='3']"
    app.gui.fill_in arg3, "//CPTextField[tag='4']"
end

Then /^connection fields must be filled$/ do
    valueJID = app.gui.text_for "//CPTextField[tag='2']"
    valuePassword= app.gui.text_for "//CPTextField[tag='3']"
    valueBOSH = app.gui.text_for "//CPTextField[tag='4']"

    raise "Cannot enter JID" if valueJID.nil?
    raise "Cannot enter password" if valuePassword.nil?
    raise "Cannot enter BOSH" if valueBOSH.nil?
end

When /^I press the button with title "([^\"]*)"$/ do | arg1 |
    app.gui.press "//CPButton[title='#{arg1}']"
end

Then /^Archipel connects$/ do
   app.gui.text_for("//CPButton[title='Cancel']")
end

Given /^Archipel is connected$/ do
    raise "Cannot connect" if  app.gui.find("//CPWindow[title='Archipel']").empty?
end