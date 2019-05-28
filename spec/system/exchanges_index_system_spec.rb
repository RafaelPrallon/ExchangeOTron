require 'rails_helper'

# teste para simular o processo de conversão de moedas a partir do index
RSpec.describe 'Exchange Currency Process', :type => :system, js: true do
  it 'exchanges value' do
    visit '/'
    within('#exchange_form') do
      select('EUR', from: 'source_currency')
      select('UDS', from: 'target_currency')
      fill_in 'amount', with: rand(1..9999)
    end
    click_button 'CONVERTER'

    expect(page).to have_content('value')
  end
end
