feature "/bad" do
  scenario "gets redirected to Brain Aligned Delivery" do
    visit '/bad'
    expect(page).to have_content 'Brain-Aligned Delivery'
  end  
end