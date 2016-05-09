import UIKit

import Foundation

//class to represent the playing cards in the dealer and players posetion
public class Hand {
    
    public var deck: Deck?
    public var hasDoubled : Bool = false
    public var hasStood : Bool = false
    
    //array of cards representing a hand
    public var hand: [Card] = []
    
    public init(cardDeck: Deck, cards: [Card]? = nil) {
        deck = cardDeck
        if(cards != nil){
            self.hand = cards!
        }
        
    }
    
    //select two random cards out of the deck and append them to the hand object
    public func createHand(){
        var card : Card
        while hand.count < 2 {
            card = deck!.getRandomCard()
            //prevent the same card from being selected again
            if card.inDeck{
                hand.append(card)
                card.inDeck = false
            }
        }
    }

    //pull a string representation of a card. used to match image with card
    public func getCardImageName(card: Card)->String{
        if(card.rank.rawValue > 9 && card.rank != .ten){
            return "card_\(card.rank)_\(card.suit)s"
        } else {
            return "card_\(card.rank.rawValue)_\(card.suit)s"
        }
    }
    
    //get an array of card names all in lowercase
    public func getCardImageNames()->[String]{
        var cardNames:[String] = []
        for card in hand{
            cardNames.append(getCardImageName(card).lowercaseString)
        }
        return cardNames
    }
    
    //this function returns the values of the cards in a hand
    public func getHandValue()-> Int{
        var sum = 0
        var aceCount = 0
        for card in self.hand{
            if(card.rank == Rank.Ace){
                aceCount+=1
            } else {
                sum += card.rank.cardsValue()
            }
        }
        //aces can be either a value of 1 or 11
        while(aceCount>0){
            if(sum>10){
                sum += 1
            } else {
                sum += 11
            }
            aceCount -= 1
        }
        return sum
    }
}