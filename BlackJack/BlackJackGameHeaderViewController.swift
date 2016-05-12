//
//  BlackJackGameHeaderViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

class BlackJackGameHeaderViewController: UIViewController,  UITextFieldDelegate {

    var gameController: BlackJackViewController?
    

    
    @IBOutlet weak var PlayerNameTextField: UITextField!
    
    @IBAction func playerNameChangeComplete(sender: AnyObject) {
        if(!(PlayerNameTextField.text == "")){
            gameController?.gamePlayer.name = PlayerNameTextField.text!
        } else {
            gameController?.gamePlayer.name = "Unknown"
            PlayerNameTextField.text = "Unknown"
        }
    }
    
    @IBOutlet weak var playerBank: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PlayerNameTextField.delegate = self
        
        
        reloadValues()
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func reloadValues(){
        if(gameController != nil){
            PlayerNameTextField.text = gameController!.gamePlayer.name
            playerBank.text = "Bank: $ \(gameController!.gamePlayer.bank) Bet: $ \(gameController!.game.currentBet)"
        }
    }
    
}
