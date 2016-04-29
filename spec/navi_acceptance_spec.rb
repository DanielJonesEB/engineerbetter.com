
feature "Basic navigation" do

  scenario "Go from Values, to CF, to Rates" do
    visit '/'
    click_link 'Our Values', match: :first
    expect(page).to have_content 'Our Values Drive Us'

    click_link 'Cloud Foundry', match: :first
    expect(page).to have_content 'We offer holistic services'

    click_link 'Rates', match: :first
    expect(page).to have_content 'Because we value honesty and transparency'
  end

end
