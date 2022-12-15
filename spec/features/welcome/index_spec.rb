require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  before do
    visit root_path
  end

  describe 'the welcome page' do
    it 'I see a search bar and can search all merchants by a name fragment' do
      fill_in :search, with: 'hand'
      click_on 'Submit'

      expect(current_path).to eq(root_path)

      expect(page).to have_content("Merchants matching 'hand'")

      within '#merchants' do
        expect(page).to have_content('Hand-Spencer')
        expect(page).to have_content('Hand, Boyer and Mitchell')
      end

      expect(page).to_not have_content('Schroeder-Jerde')
      expect(page).to_not have_content('Kozey Group')
    end

    it 'gives an error message if user tries searching with an empty text field' do
      fill_in :search, with: ''
      click_on 'Submit'

      expect(page).to have_content('Text field must be filled in')
    end

    it 'does not show Merchant search if nothing has been searched' do
      expect(page).to_not have_content('Merchants matching')
    end
  end
end