import Foundation

public enum State{
    case Betting
    case Playing
    case Payout
    case Revealing
    
}

public class Game {
    
    public var deck: Deck
    public var player: Player
    public var dealerHand: Hand
    public var playerHand: Hand
    
    public var hasWon: Bool? = nil
    
    public var dealerRevealed: Bool
    public var currentBet : Int = 0
    
    public var state: State

    public init(newPlayer:Player){
        deck = Deck()
        dealerHand = Hand(cardDeck: deck)
        playerHand = Hand(cardDeck: deck)
        state = .Betting
        dealerRevealed = false
        player = newPlayer
    }
    
    public func betMoney(amount: Int)->Bool{
        if(player.withdraw(amount)){
            currentBet += amount
            return true
        }
        return false
    }
    
    public func deal(){
        print()
        if(state == .Betting){
            deck.generateDeckOfCards()
            dealerHand.createHand()
            playerHand.createHand()
            state = .Playing
        }
        
    }
    
    
    
    public func playerHit(){
        if(state == .Playing){
            if(!playerHand.hasDoubled){
                let card = deck.getRandomCard()
                playerHand.hand.append(card)
            }
        }
        if(playerHand.getHandValue()>21){
            reveal()
        }
    }
    
    public func dealerHit(){
            let card = deck.getRandomCard()
            dealerHand.hand.append(card)
    }
    
    public func doubleDown(){
        if(state == .Playing){
            if(!playerHand.hasDoubled){
                if(player.withdraw(self.currentBet)){
                    self.currentBet += currentBet
                    let card = deck.getRandomCard()
                    playerHand.hand.append(card)
                    playerHand.hasDoubled = true
                }
            }
            state = .Revealing
        }
        
    }
    
    public func surrender(){
        if(currentBet > 1){
            let toReturn = Int(currentBet / 2)
            player.bank += toReturn
            currentBet += toReturn + (currentBet % 2)
        }
        state = .Revealing
    }
    
    public func reveal(){
        
            dealerRevealed = true
            state = .Revealing
            if(playerHand.getHandValue() < 22){
                while(dealerHand.getHandValue() < 17){
                    dealerHit()
                    
                }
                if(dealerHand.getHandValue() < playerHand.getHandValue() || dealerHand.getHandValue() > 21){
                    hasWon = true
                } else {
                    hasWon = false
                }
            } else {
                hasWon = false
            }
        
        
        //state = .Payout
    }
    
    
    
    public func payout(){
        //state = .Betting
        if((playerHand.getHandValue() > dealerHand.getHandValue()) && !(playerHand.getHandValue() > 21)){
            hasWon = true
        } else {
            hasWon = false
        }
    }
    
    public func stand(){
        if(state == .Playing){
        playerHand.hasStood = true
        state = .Revealing
        reveal()
        }
    }
    
}