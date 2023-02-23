# rubocop:disable all
require_relative '../class/source'

describe Source do
  context 'Test for the Source' do
    it 'Should test the attribute of the genre class' do
      genre = Source.new('web')
      expect(genre.name).to eq 'web'
    end
  end
end
