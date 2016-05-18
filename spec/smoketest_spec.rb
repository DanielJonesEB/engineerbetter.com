
feature "Visit Homepage" do

  scenario "default view" do
    visit '/'
    expect(page).to have_content 'THE UK CLOUD FOUNDRY SPECIALISTS'
  end
end
