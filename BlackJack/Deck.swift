import UIKit

import Foundation

//Class Deck holds an array of playing cards and information about the cards such as their value and rank in BlackJack
public class Deck {
    
    //array of cards representing the deck
    var cards: [Card] = [Card]()
    public init(){
        
    }
    
    public func generateDeckOfCards(){
        //var myDeckofCards: Array = [Card]()
        let maxRank =  Rank.Ace.rawValue
        let aSuit: Array = [Suit.club.rawValue, Suit.diamond.rawValue, Suit.heart.rawValue, Suit.spade.rawValue]
        
        //goes through ranks and suits
        for count  in 2...maxRank{
            for suit in aSuit{
                let aRank = Rank.init(rawValue: count)
                let aSuit = Suit.init(rawValue: suit)
                let myCard = Card(rank: aRank!, suit: aSuit!, inDeck: true) //this acts as an init
                cards.append(myCard)
            }
        }
    }
    
    //function to return information on a particular card
    public func cardsInfo(playingCard:Card) -> (name: String, suit: String, Points: Int){
        let description = playingCard.rank.rankDescription()
        let mySuit = playingCard.suit.rawValue
        let cardValue = playingCard.rank.cardsValue()
        let card = (description,mySuit,cardValue)
        return card
    }
    
    //this func is used as a replacment for shuffle.
    //instead of shuffling the deck, the program will select a random card from the deck
    public func getRandomCard()-> Card{
        
        let rand =  Int(arc4random_uniform(10000)%52)
        let card = self.cards[rand]
        return card
    }
}

//rank assigns rawValues to each card
public enum Rank: Int{
    case two = 2
    case three, four, five, six, seven, eight, nine, ten
    case Jack, Queen, King, Ace
    
    //each card is assigned it's name
    public func rankDescription() -> String{
        switch self{
        case .Jack: return "Jack"
        case .Queen: return "Queen"
        case .King: return "King"
        case .Ace: return "Ace"
        default: return String(self.rawValue)
        }
    }
    
    //These values that are assigned to the cards represent the values used in the game of BlackJack
    public func cardsValue() -> Int{
        switch self{
        case .Jack: return 10
        case .Queen: return 10
        case .King: return 10
        case .Ace: return 11 //default to 11 (may change to 1 in game)
        default: return rawValue
        }
        
    }
}
public enum Suit: String{    //assign suits their names
    case spade = "Spades"
    case heart = "Hearts"
    case diamond = "Diamonds"
    case club = "Clubs"
}

//class to represent card object. Every card object will have it's own rank and suit
public class Card{
    public let rank: Rank
    public let suit: Suit
    
    //this boolean keeps track of whether or not a card has been taken out of the deck (to prevent the same card being selected twice)
    public var inDeck: Bool
    
    public init(rank: Rank, suit: Suit, inDeck: Bool){
        self.rank = rank
        self.suit = suit
        self.inDeck = inDeck
    }
}


