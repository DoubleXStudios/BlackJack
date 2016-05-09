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
    public var hasSurrendered: Bool = false
    
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
        hasSurrendered = false
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
                print("bank prior to double down \(player.bank)")
                if(player.withdraw(self.currentBet)){
                    print("bank after double down \(player.bank)")
                    print("bet before double down \(self.currentBet)")
                    self.currentBet += currentBet
                    print("bet after double down \(self.currentBet)")
                    let card = deck.getRandomCard()
                    playerHand.hand.append(card)
                    playerHand.hasDoubled = true
                }
            }
            state = .Revealing
            reveal()
        }
        
    }
    
    public func surrender(){
        if(state == .Playing){
            if(currentBet > 1){
                let toReturn = Int(currentBet / 2)
                player.bank += toReturn
                currentBet += toReturn + (currentBet % 2)
            }
            hasSurrendered = true
            state = .Revealing
        }
    }
    
    public func reveal(){
            //print("Hi")
            dealerRevealed = true
            state = .Revealing
            if(playerHand.getHandValue() < 22){
                while(dealerHand.getHandValue() < 17){
                    dealerHit()
                    
                }
                if(dealerHand.getHandValue() < playerHand.getHandValue() || dealerHand.getHandValue() > 21){
                    hasWon = true
                } else if (dealerHand.getHandValue() > playerHand.getHandValue()) {
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