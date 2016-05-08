import UIKit

import Foundation

public class Hand {
    
    public var deck: Deck?
    public var hasDoubled : Bool = false
    public var hasStood : Bool = false
    
    
    public var hand: [Card] = []
    
    public init(cardDeck: Deck, cards: [Card]? = nil) {
        deck = cardDeck
        if(cards != nil){
            self.hand = cards!
        }
        
    }
    
    public func createHand(){
        var card : Card
        while hand.count < 2 {
            card = deck!.getRandomCard()
            if card.inDeck{
                hand.append(card)
                card.inDeck = false
            }
        }
        
    }
    
    public func getCardNames()->[String]{
        return ["KingCard", "QueenCard"]
    }

    public func getCardImageName(card: Card)->String{
        if(card.rank.rawValue > 9 && card.rank != .ten){
            return "card_\(card.rank)_\(card.suit)s"
        } else {
            return "card_\(card.rank.rawValue)_\(card.suit)s"
        }
        
    }
    
    public func getCardImageNames()->[String]{
        var cardNames:[String] = []
        for card in hand{
            cardNames.append(getCardImageName(card).lowercaseString)
        }
        return cardNames
    }
    
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