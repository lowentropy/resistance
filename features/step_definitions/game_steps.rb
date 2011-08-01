When /^I start a game with (.*)$/ do |players|
  When %{I go to the new game page}
  When %{I add players #{players}}
  When %{I start the game}
end

When /^I add players (.*)$/ do |names|
  HumanList(names).each {|name| When %{I add "#{name}" as a player} }
end

When /^I start the game$/ do
  When %{I press "Start!"}
end

def input_names
  all("#players input[type=text]").map(&:value)
end

def row_names
  all("#players li").map(&:text)
end

Then /^I should see players (.*)$/ do |names|
  actual = input_names.presence || row_names
  actual.should == HumanList(names)
end

When /^I remove "([^"]*)" as a player$/ do |name|
  within :xpath, ".//input[@value='#{name}']/.." do
    click_link "remove"
  end
end

When /^I add "([^"]*)" as a player$/ do |name|
  find("#players li:last input").set name
  click_link 'Add a player'
end
