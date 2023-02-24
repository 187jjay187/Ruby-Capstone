require_relative '../class/game'

describe Game do
  context 'Testing for the game class ' do
    it 'Should test the attribute of the game class' do
      game = Game.new(true, '2001')
      expect(game.multiplayer).to eq true
      expect(game.publish_date).to eq '2001'
    end

    it 'Should test the attribute of the game class' do
      game = Game.new(false, '2001')
      expect(game.multiplayer).to eq false
      expect(game.public_date).to eq '2001'
    end
  end
end

describe 'Unit Tests for Game Class' do
  before :each do
    @game = Game.new(true, '2001')
  end

  context 'initialize object' do
    it 'should be an instance of Game' do
      expect(@game).to be_instance_of Game
    end

    it 'should not be an instance of Item' do
      expect(@game).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@game).to be_kind_of Item
    end
  end

  context 'multiplayer' do
    it 'should be true' do
      expect(@game.multiplayer).to eql true
    end
  end

  context 'game publish date' do
    it 'should be 2001' do
      expect(@game.public_date).to eql '2001'
    end
  end
end
