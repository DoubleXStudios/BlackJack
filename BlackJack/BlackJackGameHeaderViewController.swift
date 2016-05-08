//
//  BlackJackGameHeaderViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

class BlackJackGameHeaderViewController: UIViewController {

    var gameController: BlackJackViewController?
    

    @IBOutlet weak var playerCurrentBet: UILabel!
    
    @IBOutlet weak var PlayerNameTextField: UITextField!
    
    @IBAction func playerNameChanged(sender: AnyObject) {
        gameController?.game.player.name = PlayerNameTextField.text!
    }
    
    @IBOutlet weak var playerBank: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadValues()
        
        
    }
    
    func reloadValues(){
        if(gameController != nil){
            PlayerNameTextField.text = gameController!.gamePlayer.name
            playerBank.text = "Bank: $ \(gameController!.gamePlayer.bank)"
            playerCurrentBet.text = "Bet: $ \(gameController!.game.currentBet)"
        }
    }
    
}
