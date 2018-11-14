require 'rails_helper'

RSpec.describe 'posts', type: :system do
  let!(:post) { create(:post) }

  it 'shows the index' do
    visit posts_path
    expect(page).to have_selector('h1', text: 'Posts')
  end

  it 'creates a post' do
    visit posts_path
    click_on "New Post"

    fill_in "Content", with: post.content
    fill_in "Title", with: post.title
    click_on "Create Post"

    expect(page).to have_text("Post was successfully created")
    click_on "Back"
    expect(page).to have_current_path(posts_path)
  end

  it 'updates a post' do
    visit posts_path
    click_on "Edit", match: :first

    fill_in "Content", with: post.content
    fill_in "Title", with: post.title
    click_on "Update Post"

    expect(page).to have_text("Post was successfully updated")
    click_on "Back"
    expect(page).to have_current_path(posts_path)
  end

  it 'destroys a post' do
    visit posts_path
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    expect(page).to have_text("Post was successfully destroyed")
    expect(page).to have_current_path(posts_path)
  end
end