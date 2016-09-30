
feature "Visit Homepage" do
  let(:company_number) { '10141478' }
  let(:vat_number) { 'GB244944977' }

  scenario "default view" do
    visit '/'
    expect(page).to have_content 'THE UK CLOUD FOUNDRY SPECIALISTS'
    expect(page).to have_content company_number
    expect(page).to have_content vat_number
  end
end
