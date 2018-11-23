Given(/^that a post exists$/) do
  @post = create(:post)
end

When(/^visiting the blog index$/) do
  visit posts_path
end

When(/^visiting the post page$/) do
  visit post_path(@post)
end

And(/^the text "([^"]*)" must be showing$/) do |text|
  page.has_content? text
end

And(/^the post ([^ ]*) must be showing$/) do |method|
  page.has_content? @post.send(method)
end

And(/^clicking the link "([^"]*)"$/) do |text|
  click_link text
end

And(/^filling the field "([^"]*)" with "([^"]*)"$/) do |label, text|
  fill_in label, with: text
end

And(/^clicking the button "([^"]*)"$/) do |name|
  click_button name
end