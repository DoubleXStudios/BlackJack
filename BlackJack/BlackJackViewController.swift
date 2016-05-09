//
//  BlackJackViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/19/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController {

    @IBOutlet weak var BigContainer: UIView!
    
    var game: Game = Game(newPlayer: Player(user: "Bob", deposit: 100))
    var gamePlayer: Player = Player(user: "Bob", deposit: 100)
    
    var buttonsViewController: BlackJackButtonsViewController?
    var headerViewController: BlackJackGameHeaderViewController?
    var cardsViewController: CardsViewController?
    
    func newGame(){
        game = Game(newPlayer: gamePlayer)
        let scoreBoard = HighScores()
        scoreBoard.updateHighScore(gamePlayer.name, scoreValue: gamePlayer.highScore)
        //print(game.dealerHand.getHandValue())
        buttonsViewController?.dealButton.setTitle("Deal", forState: .Normal)
        cardsViewController?.removeMessageAndReset()
        updateAll()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamePlayer = game.player
        updateAll()

        // Do any additional setup after loading the view.
    }

    func updateAll(){
        
        if buttonsViewController != nil{
            switch game.state{
            case .Betting:
                settingsForBetting()
                break
            case .Payout:
                //print("4")
                settingsForPayout()
                break
            case .Playing:
                settingsForPlaying()
                break
            case .Revealing:
                settingsForRevealing()
                //print("1")
                break
            }
        }
        
        if headerViewController != nil{
            headerViewController?.reloadValues()
        }
        if cardsViewController != nil{
            cardsViewController?.reloadCards()
        }
    }
    
    func hit(){
        game.playerHit()
        if(game.playerHand.getHandValue() > 21){
            game.state = State.Revealing
        }
        updateAll()
    }
    
    
    
    
    
    
    
    
    
    
    func settingsForBetting(){
        
        buttonsViewController?.chip100Button.enabled = true
        buttonsViewController?.chip1Button.enabled = true
        buttonsViewController?.chip5Button.enabled = true
        buttonsViewController?.chip25Button.enabled = true
        buttonsViewController?.chip500Button.enabled = true
        buttonsViewController?.clearButton.enabled = true
        buttonsViewController?.dealButton.enabled = true
        buttonsViewController?.hitButton.enabled = false
        buttonsViewController?.standButton.enabled = false
        buttonsViewController?.surrenderButton.enabled = false
        buttonsViewController?.doubleButton.enabled = false
        
        buttonsViewController?.hitButton.titleLabel!.text = "Hit"
        buttonsViewController?.surrenderButton.titleLabel!.text = "Surrender"
    }
    func settingsForPlaying(){
        buttonsViewController?.chip100Button.enabled = false
        buttonsViewController?.chip1Button.enabled = false
        buttonsViewController?.chip5Button.enabled = false
        buttonsViewController?.chip25Button.enabled = false
        buttonsViewController?.chip500Button.enabled = false
        buttonsViewController?.clearButton.enabled = false
        buttonsViewController?.dealButton.enabled = false
        buttonsViewController?.hitButton.enabled = true
        buttonsViewController?.standButton.enabled = true
        buttonsViewController?.surrenderButton.enabled = true
        buttonsViewController?.doubleButton.enabled = !game.playerHand.hasDoubled
    }
    
    
    func settingsForPayout(){
        //print("payout happening")
        self.buttonsViewController?.chip100Button.enabled = false
        self.buttonsViewController?.chip1Button.enabled = false
        self.buttonsViewController?.chip5Button.enabled = false
        self.buttonsViewController?.chip25Button.enabled = false
        self.buttonsViewController?.chip500Button.enabled = false
        self.buttonsViewController?.clearButton.enabled = false
        self.buttonsViewController?.dealButton.enabled = false
        self.buttonsViewController?.hitButton.enabled = false
        self.buttonsViewController?.standButton.enabled = false
        self.buttonsViewController?.surrenderButton.enabled = false
        self.buttonsViewController?.doubleButton.enabled = false
        
        print(game.hasWon)
        if((game.hasWon) != nil ){
            if(game.hasWon!){
                cardsViewController?.animateMessageAndClearCards("You Won!")
                gamePlayer.bank += (game.currentBet*2)
                game.currentBet = 0
            } else {
                if(game.hasSurrendered){
                    cardsViewController?.animateMessageAndClearCards("Surrendered")
                    game.currentBet = 0
                } else {
                    cardsViewController?.animateMessageAndClearCards("Game Lost")
                    game.currentBet = 0
                }
                
            }
        } else {
            if(!game.hasSurrendered){
                cardsViewController?.animateMessageAndClearCards("It was a tie!")
                gamePlayer.bank += game.currentBet
                game.currentBet = 0
            } else {
                cardsViewController?.animateMessageAndClearCards("Surrendered")
                game.currentBet = 0
            }
        }
 
        if headerViewController != nil{
            headerViewController?.reloadValues()
        }
        
        if(gamePlayer.bank > 0){
            buttonsViewController?.dealButton.enabled = true
            buttonsViewController?.dealButton.setTitle("New Game", forState: .Normal)
        } else {
            cardsViewController?.animateMessageAndClearCards("Game Over")
        }
        

    }
    func settingsForRevealing(){
        
            print("2")
        
            self.buttonsViewController?.chip100Button.enabled = false
            self.buttonsViewController?.chip1Button.enabled = false
            self.buttonsViewController?.chip5Button.enabled = false
            self.buttonsViewController?.chip25Button.enabled = false
            self.buttonsViewController?.chip500Button.enabled = false
            self.buttonsViewController?.clearButton.enabled = false
            self.buttonsViewController?.dealButton.enabled = false
            self.buttonsViewController?.hitButton.enabled = false
            self.buttonsViewController?.standButton.enabled = false
            self.buttonsViewController?.surrenderButton.enabled = false
            self.buttonsViewController?.doubleButton.enabled = false
        
            cardsViewController?.animateReveal()
        
            game.state = State.Payout
            //print("3")
            updateAll()
        

        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? BlackJackButtonsViewController
            where segue.identifier == "EmbedSegue3" {
                self.buttonsViewController = vc
                buttonsViewController?.gameController = self
                
        } else if let vc = segue.destinationViewController as? BlackJackGameHeaderViewController
            where segue.identifier == "EmbedSegue1" {
                self.headerViewController = vc
                headerViewController?.gameController = self
        } else if let vc = segue.destinationViewController as? CardsViewController
            where segue.identifier == "EmbedSegue2" {
            self.cardsViewController = vc
            cardsViewController?.gameController = self
        }
    }


}








