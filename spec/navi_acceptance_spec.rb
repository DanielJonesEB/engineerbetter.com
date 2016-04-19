
feature "Basic navigation" do

  scenario "Go from Values, to CF, to Rates" do
    visit '/'
    click_link 'Our Values'
    expect(page).to have_content 'OUR VALUES DRIVE US'

    click_link 'Cloud Foundry', match: :first
    expect(page).to have_content 'We offer holistic services'

    click_link 'Rates', match: :first
    expect(page).to have_content 'Because we value honesty and transparency'
  end

end
