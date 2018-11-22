Given(/^that a post exists$/) do
  @post = create(:post)
end

When(/^visiting the blog index$/) do
  visit posts_path
end

When(/^visiting the post page$/) do
  visit post_path(@post)
end

And(/^the text "([^"]*)" must be showing$/) do |arg|
  page.has_content? arg
end

And(/^the post ([^ ]*) must be showing$/) do |method|
  page.has_content? @post.send(method)
end

And(/^clicking the link "([^"]*)"$/) do |text|
  click_link text
end

And(/^filling the field "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

And(/^clicking the button "([^"]*)"$/) do |arg|
  click_button arg
end