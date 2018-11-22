require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  before do
    create(:post)
  end

  it 'shows the index' do
    visit posts_path
    expect(page).to have_selector('h1', text: 'Posts')
  end

  it 'creates a post' do
    visit posts_path
    click_on "New Post"

    fill_in "Content", with: 'New post content'
    fill_in "Title", with: 'New post title'
    click_on "Create Post"

    expect(page).to have_text("Post was successfully created")
    click_on "Back"
    expect(page).to have_current_path(posts_path)
  end

  it 'updates a post' do
    visit posts_path
    click_on "Edit", match: :first

    fill_in "Content", with: 'New post content'
    fill_in "Title", with: 'New post title'
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

  it 'fails and shows a screenshot' do
    visit posts_path

    expect(1).to eq(0)
  end

  it 'creates a post on mobile', resolution: :mobile do
    visit posts_path
    click_on "New Post"

    fill_in "Content", with: 'New post content'
    fill_in "Title", with: 'New post title'
    click_on "Create Post"

    expect(page).to have_text("Post was successfully created")
    click_on "Back"
    expect(page).to have_current_path(posts_path)
  end
end