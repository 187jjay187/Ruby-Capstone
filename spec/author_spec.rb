require_relative '../class/author'

describe Author do
  context 'Test for the Author' do
    it 'Should test the attribute of the author class' do
      author = Author.new('jay', 'jerome')
      expect(author.first_name).to eq 'jay'
      expect(author.last_name).to eq 'jerome'
    end
  end
end
