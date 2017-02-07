=begin
Create a RESTful microservice that implements a card shuffling algorithm, as defined below. Should have evidence of test-driven development with unit tests. Use best practices of interfaces and generics for abstraction, preferably implementing a strategy pattern for deploy-time dependency injection of a shuffling algorithm. 
Requirements: 
· Create a microservice that stores and shuffles card decks. 
· A card may be represented as a simple string such as “5-heart”, or “K-spade”. 
· A deck is an ordered list of 52 standard playing cards. 
· Expose a RESTful interface that allows a user to: 
· PUT an idempotent request for the creation of a new named deck. New decks are created in some initial sorted order. 
· POST a request to shuffle an existing named deck. 
· GET a list of the current decks persisted in the service. 
· GET a named deck in its current sorted/shuffled order. 
· DELETE a named deck. 
· Design your own data and API structure(s) for the deck. 
· Persist the decks in-memory only, but stub the persistence layer such that it can be later upgraded to a durable datastore. 
· Implement a simple shuffling algorithm that simply randomizes the deck in-place. 
· Implement a more complex algorithm that simulates hand-shuffling, i.e. splitting the deck in half and interleaving the two halves, repeating the process multiple times. 
· Allow switching the algorithms at deploy-time only via configuration.

Proposed interface Structure:
· PUT an idempotent request for the creation of a new named deck. New decks are created in some initial sorted order. 
  PUT /decks/{deck-name}.json
  -Responds with a Deck, which is JSON array of cards in order.
  { name:
    cards: [ "A-Spade", "10-Diamond",..]
  }

· POST a request to shuffle an existing named deck.
  POST /decks/shuffle/{deck-name}
  -Responds with a Deck, which is JSON array of cards in order.

· GET a list of the current decks persisted in the service.
  GET /decks
  -Responds with a list of Decks, which conists of 'name' identifier

· GET a named deck in its current sorted/shuffled order.
  GET /decks/{deck-name}.json
  -Responds with deck, JSON array of cards in order.

· DELETE a named deck.
  DELETE /decks/{deck-name}

=end

require 'rspec/autorun'

#stores decks in memory, can add, retrieve, delete deck in memory
class DeckStorage
end

class DeckShuffler
  def shuffle(cards)
    throw 'Not Implement Exception'
  end
end

class InPlaceShuffler < DeckShuffler
  def shuffle(cards)
    (0..cards.length - 1).each do |i|
      r = rand(0..i)
      cards[i], cards[r] = cards[r], cards[i]
    end
  end
end

class HandShuffler < DeckShuffler
  def shuffle(cards)
    #simulates hand-shuffling, i.e. splitting the deck in half and interleaving the two halves, repeating the process multiple times.
  end
end

class Deck
  attr_reader :name, :cards

  def initialize(name)
    @name = name
    fill_deck
  end

  def shuffle(shuffler)
    shuffler.shuffle(@cards)
  end

  private

  def fill_deck
    @cards = []

    CardSuit::valid_suits.each do |s|
      CardValue::valid_values.each do |v|
        @cards << Card.new(v, s)
      end
    end

  end
end

class Card
  def initialize(value, suit)
    @suit, @value = suit, value
  end

  def to_s
    "#{@value.to_s}-#{@suit.to_s}"
  end
end

class CardSuit
  def initialize(suit)
    @suit = suit
  end

  def self.valid_suits
    [:heart, :spade, :diamond, :club]
  end

  def to_s
    @suit.to_s
  end
end

class CardValue
  def initialize(value)
    @value = value
  end

  def self.valid_values
    values = (2..10).map(&:to_s)
    values += ['J','Q','K','A']
  end

  def to_s
    @value
  end
end

RSpec.describe HandShuffler do
  it "shuffles deck in-place" do
    deck = Deck.new('deck')
    in_place_shuffler = InPlaceShuffler.new

    srand(1234)
    in_place_shuffler.shuffle(deck.cards)

    expect(deck.cards.first.to_s).to eq '7-diamond'
    expect(deck.cards.last.to_s).to eq 'K-spade'
    srand
  end
end

RSpec.describe InPlaceShuffler do
  it "shuffles deck in-place" do
    deck = Deck.new('deck')
    in_place_shuffler = HandShuffler.new

    srand(1234)
    in_place_shuffler.shuffle(deck.cards)

    expect(deck.cards.first.to_s).to eq '7-diamond'
    expect(deck.cards.last.to_s).to eq 'K-spade'
    srand
  end
end

RSpec.describe Deck do
  it "identified by a name" do
    deck = Deck.new('awesome')
    expect(deck.name).to eq 'awesome'
  end

  it "includes cards in order" do
    deck = Deck.new('standard')
    expect(deck.cards.count).to eq 52
  end

  it "shuffles cards with shuffler" do
    deck = Deck.new('standard')
    in_place_shuffler = InPlaceShuffler.new

    srand(1234)
    deck.shuffle(in_place_shuffler)

    expect(deck.cards.first.to_s).to eq '7-diamond'
    expect(deck.cards.last.to_s).to eq 'K-spade'
    srand
  end
end

RSpec.describe Card do
  #Identified by simple string such as “5-heart”, or “K-spade”
  it "identifies itself with a simple string" do
    heart_suit = CardSuit.new(:heart)
    spade_suit = CardSuit.new(:spade)
    five_value = CardValue.new('5')
    king_value = CardValue.new('K')

    expect(Card.new(five_value, heart_suit).to_s).to eq "5-heart"
    expect(Card.new(king_value, spade_suit).to_s).to eq "K-spade"
  end
end

RSpec.describe CardSuit do
  it "includes standard card suits" do
    expect(CardSuit::valid_suits).to eq [:heart, :spade, :diamond, :club]
  end
end

RSpec.describe CardValue do
  it "includes standard card values" do
    expect(CardValue::valid_values).to eq ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
  end
end



