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
  expect(page).to have_content(text)
end

And(/^the post ([^ ]*) must be showing$/) do |method|
  expect(page).to have_content(@post.send(method))
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

And(/^confirming the dialog after clicking "([^"]*)"$/) do |name|
  accept_confirm do
    click_link name
  end
end

And(/^the text "([^"]*)" must not be showing$/) do |text|
  expect(page).not_to have_content(text)
end