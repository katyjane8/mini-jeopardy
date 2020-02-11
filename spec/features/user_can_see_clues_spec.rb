require 'rails_helper'

RSpec.describe CluesController do
  before :each do
    visit root_path
  end

  describe "list of all clues" do
    it 'gets clues' do
      expect(page).to have_content("Jeopardy!")
      expect(current_path).to eq "/"
    end
  end

  describe "clues are only from the science category" do
    it 'shows only science' do
      expect(page).to have_content("science")
      expect(page).not_to have_content("literature")
    end
  end

  describe "all clues have value" do
    it 'does not have answers with no value' do
      expect(page).not_to have_content("Value:''")
    end
  end
end
