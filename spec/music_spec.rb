require_relative '../class/music'

describe MusicAlbum do
  context 'Testing for the music class ' do
    it 'Should test the attribute of the music class' do
      music = MusicAlbum.new(true, '02/04/2001')
      expect(music.on_spotify).to eq true
      expect(music.public_date).to eq '02/04/2001'
    end

    it 'Should test the attribute of the music class' do
      music = MusicAlbum.new(false, '05/19/2001')
      expect(music.on_spotify).to eq false
      expect(music.public_date).to eq '05/19/2001'
    end
  end
end


describe 'Unit Tests for Music Class' do
  before :each do
    @music = MusicAlbum.new(true, '02/05/2001')
  end

  context 'initialize object' do
    it 'should be an instance of MusicAlbum' do
      expect(@music).to be_instance_of MusicAlbum
    end

    it 'should not be an instance of Item' do
      expect(@music).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@music).to be_kind_of Item
    end
  end

  context 'music on spotify' do
    it 'should be true' do
      expect(@music.on_spotify).to eql true
    end
  end

  context 'music public date' do
    it 'should be 02/05/2001' do
      expect(@music.public_date).to eql '02/05/2001'
    end
  end
end
