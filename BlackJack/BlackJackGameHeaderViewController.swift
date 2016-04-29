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
    
    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playerBank: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadValues()
        
        
    }
    
    func reloadValues(){
        if(gameController != nil){
            playerName.text = gameController!.gamePlayer.name
            playerBank.text = "Bank: $ \(gameController!.gamePlayer.getRemainingBalance())"
            playerCurrentBet.text = "Bet: $ \(gameController!.gamePlayer.credit)"
        }
    }
    
}
