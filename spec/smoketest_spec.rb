
feature "Visit Homepage" do

  scenario "default view" do
    visit '/'
    expect(page).to have_content 'DELIVER YOUR CORE VALUE'
  end
end
