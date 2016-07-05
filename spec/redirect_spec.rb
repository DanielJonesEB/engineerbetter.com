describe "/bad" do
  it "serves an HTML meta redirect" do
    visit '/bad'
    expect(page).to have_content '<meta http-equiv="refresh" content="0; url=/update/2016/07/01/brain-aligned-delivery.html">'
  end  
end