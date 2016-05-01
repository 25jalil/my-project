require 'spec_helper'

RSpec.feature "Post", :type => :feature do
  scenario "Create a new post" do
    visit "/posts/new"

    fill_in "Заголовок", :with => "text23"
    fill_in "Тело", :with => "This file should contain all the record creation needed to seed the database with its default values
   The data can then be loaded with the rake db:seed"

    click_button "Добавить"

    expect(page).to have_text("text23")
  end
end
