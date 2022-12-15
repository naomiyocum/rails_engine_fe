# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Merchants Index Page', type: :feature do
  before do
    visit merchants_path
  end

  describe 'the merchants index page' do
    it 'shows a list of merchants by name' do
      within '#merchants' do
        expect(page).to have_content('Schroeder-Jerde')
        expect(page).to have_content('Kozey Group')
      end
    end

    it 'when I click on a merchants name I am taken to their show page' do
      click_on 'Schroeder-Jerde'

      expect(current_path).to eq(merchant_path(1))
    end
  end
end
