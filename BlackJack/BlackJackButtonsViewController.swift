//
//  BlackJackButtonsViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/19/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

enum Buttons{
    case Chip1
    
    case Chip5
    
    case Chip25
    
    case Chip100
    
    case Chip500
    
    case Hit
    
    case Stand
    
    case Deal
    
    case Split
    
    case Double
    
}

class BlackJackButtonsViewController: UIViewController {

    @IBOutlet weak var chip1Button: UIButton!
    @IBOutlet weak var chip5Button: UIButton!
    @IBOutlet weak var chip25Button: UIButton!
    @IBOutlet weak var chip100Button: UIButton!
    @IBOutlet weak var chip500Button: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var surrenderButton: UIButton!
    @IBOutlet weak var doubleButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    
    
    var gameController: BlackJackViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chip1Button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        chip5Button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        chip25Button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        chip100Button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        chip500Button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        updateGame()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func updateGame(){
        if gameController != nil{
            
        }
    }
    
    
    @IBAction func chip1Clicked(sender: AnyObject) {
        dealerTransaction(1)
    }

    

    @IBAction func chip5Clicked(sender: AnyObject) {
        dealerTransaction(5)
    }
    

    
    
    @IBAction func chip25Clicked(sender: AnyObject) {
        dealerTransaction(25)
    }

    
    
    @IBAction func chip100Clicked(sender: AnyObject) {
        dealerTransaction(100)
    }

    
    
    
    @IBAction func chip500Clicked(sender: AnyObject) {
        dealerTransaction(500)
    }
    
    func dealerTransaction(amount: Int){
        if gameController != nil{
            if(gameController?.gamePlayer.withdraw(amount))!{
                gameController?.game.currentBet += amount
                gameController?.updateAll()
            }
            
        }
    }
    
    @IBAction func clearTransaction(sender: AnyObject) {
        gameController?.gamePlayer.bank += (gameController?.game.currentBet)!
        gameController?.game.currentBet = 0
        gameController?.updateAll()

    }
    
    
    @IBAction func hitClicked(sender: AnyObject) {
        gameController?.hit()    }
    
    @IBAction func standClicked(sender: AnyObject) {
        gameController?.game.stand()
        gameController?.updateAll()
    }

    @IBAction func dealClicked(sender: AnyObject) {
        print(gameController?.game.state)
        if(gameController?.game.state != State.Payout && gameController?.game.state != State.Revealing){
            if gameController != nil{
                gameController?.game.deal()
                gameController?.updateAll()

            }
        } else {
            gameController?.newGame()
        }
        
    }
    
    @IBAction func surrenderClicked(sender: AnyObject) {
        gameController?.game.surrender()
        gameController?.updateAll()
    }

    
    @IBAction func doubleClicked(sender: AnyObject) {
        gameController?.game.doubleDown()
        gameController?.updateAll()
    }


}
