require_relative '../class/genre'

describe Genre do
 context "Test for the Genre" do 
  it "Should test the attribute of the genre class" do
   genre = Genre.new('comedy')
   expect(genre.name).to eq 'comedy'
  end
 end
end