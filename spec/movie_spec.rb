# rubocop:disable all
require_relative '../class/movie'

describe Movie do
  context 'Testing for the movie class ' do
    it 'Should test the attribute of the movie class' do
      movie = Movie.new(true, '02/04/1999')
      expect(movie.silent).to eq true
      expect(movie.publish_date).to eq '02/04/1999'
    end

    it 'Should test the attribute of the movie class' do
      movie = Movie.new(false, '05/19/1999')
      expect(movie.silent).to eq false
      expect(movie.publish_date).to eq '05/19/1999'
    end
  end
end

describe 'Unit Tests for movie Class' do
  before :each do
    @movie = Movie.new(true, '02/05/1999')
  end

  context 'initialize object' do
    it 'should be an instance of Movie' do
      expect(@movie).to be_instance_of Movie
    end

    it 'should not be an instance of Item' do
      expect(@movie).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@movie).to be_kind_of Item
    end
  end

  context 'movie on spotify' do
    it 'should be true' do
      expect(@movie.silent).to eql true
    end
  end

  context 'movie public date' do
    it 'should be 02/05/1999' do
      expect(@movie.publish_date).to eql '02/05/1999'
    end
  end
end
