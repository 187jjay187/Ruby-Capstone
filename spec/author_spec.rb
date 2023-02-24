require_relative '../class/author'

describe Author do
  context 'Test for the Author' do
    it 'Should test the attribute of the author class' do
      genre = Author.new('jay')
      expect(Author.name).to eq 'ely'
    end
  end
end
