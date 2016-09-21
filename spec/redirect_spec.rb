feature "/bad" do
  scenario "gets redirected to Brain Aligned Delivery" do
    visit '/bad'
    expect(page).to have_content 'Brain-Aligned Delivery'
  end

  scenario 'Values redirects to How We Work' do
    visit '/business-values.html'
    expect(page).to have_content 'Our values'
  end

  scenario 'Engineer redirects to How We Work' do
    visit '/engineering-values.html'
    expect(page).to have_content 'Our engineering'
  end
end