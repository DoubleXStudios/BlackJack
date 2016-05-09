import Foundation

//the game of BlackJack is played in a particular sequence represented by states in the program
public enum State{
    case Betting
    case Playing
    case Payout
    case Revealing
    
}

//Class Game holds the functions representing the basic actions in the game of BlackJack
public class Game {
    
    public var deck: Deck
    public var player: Player
    public var dealerHand: Hand
    public var playerHand: Hand
    
    public var hasWon: Bool? = nil //represents whether the user has won or not
    public var hasSurrendered: Bool = false //represents whether the user has surrendered or not
    
    public var dealerRevealed: Bool //represents if the second card in the dealers hand is visible or not
    public var currentBet : Int = 0 //represents the current bid of the user
    
    public var state: State //represents the state that the game is in

    public init(newPlayer:Player){
        deck = Deck()
        dealerHand = Hand(cardDeck: deck)
        playerHand = Hand(cardDeck: deck)
        state = .Betting
        dealerRevealed = false //initially set the 2nd card to not visible
        player = newPlayer
        hasSurrendered = false //the user has not surrendered yet
    }
    
    //this function increases the currentBet of the user by the amount specified and takes that same amount of money out of that players bank (by calling withdraw)
    public func betMoney(amount: Int)->Bool{
        if(player.withdraw(amount)){
            currentBet += amount
            return true
        }
        return false
    }
    
    //generate a new deck of cards, create the player and dealer hands, and change the state of the game from betting to playing
    public func deal(){
        print()
        if(state == .Betting){
            deck.generateDeckOfCards()
            dealerHand.createHand()
            playerHand.createHand()
            state = .Playing
        }
        
    }
    
    //hit function adds another card to the players hand. Players cannot hit after they doubleDowned
    public func playerHit(){
        if(state == .Playing){
            if(!playerHand.hasDoubled){
                let card = deck.getRandomCard()
                playerHand.hand.append(card)
            }
        }
        //if the hand value is over 21: the player busts
        if(playerHand.getHandValue()>21){
            reveal()
        }
    }
    
    //adds a card to the dealer hand
    public func dealerHit(){
            let card = deck.getRandomCard()
            dealerHand.hand.append(card)
    }
    
    //doubleDown doubles the players bet and puts one more card into their hand
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
            state = .Revealing //change the state, after you double down nothing else happens in .playing state
            reveal()
        }
        
    }
    
    //this function allows a player to lose only half of their bet if they feel they are going to lose the game
    public func surrender(){
        if(state == .Playing){
            if(currentBet > 1){
                let toReturn = Int(currentBet / 2)
                player.bank += toReturn
                currentBet += toReturn + (currentBet % 2)
            }
            hasSurrendered = true //if the player surrenders nothing else happens in .playing state
            state = .Revealing
        }
    }
    
    //reveal shows the hidden dealer card, and hits on the dealers hand until the dealer has a score of over 17 or busts.
    public func reveal(){
            dealerRevealed = true
            state = .Revealing
            //check for bust
            if(playerHand.getHandValue() < 22){
                while(dealerHand.getHandValue() < 17){
                    dealerHit()
                    
                }
                //decide whether the player has won or lost based on the values of the player and dealer hands
                if(dealerHand.getHandValue() < playerHand.getHandValue() || dealerHand.getHandValue() > 21){
                    hasWon = true
                } else if (dealerHand.getHandValue() > playerHand.getHandValue()) {
                    hasWon = false
                }
            } else {
                hasWon = false
            }
    }
    public func payout(){
        if((playerHand.getHandValue() > dealerHand.getHandValue()) && !(playerHand.getHandValue() > 21)){
            hasWon = true
        } else {
            hasWon = false
        }
    }
    
    //stand ends the playing state and changes the state to revealing. This done when the player is satisfied with their hand and wants to end their turn
    public func stand(){
        if(state == .Playing){
        playerHand.hasStood = true
        state = .Revealing
        reveal()
        }
    }
    
}