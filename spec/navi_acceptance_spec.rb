
feature "Basic navigation" do

  scenario "Go from Values, to CF, to Rates" do
    visit '/'
    click_link 'How We Work', match: :first
    expect(page).to have_content 'Our values'

    click_link 'What We Do', match: :first
    expect(page).to have_content 'We offer holistic services'

    click_link 'Rates', match: :first
    expect(page).to have_content 'Because we value honesty and transparency'
  end

end
