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
    
    var game: BlackJackGame = BlackJackGame()
    var gamePlayer: GamePlayer = GamePlayer(name: "Bob", bank: 100)
    
    var buttonsViewController: BlackJackButtonsViewController?
    var headerViewController: BlackJackGameHeaderViewController?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func updateAll(){
        if buttonsViewController != nil{
            
        }
        
        if headerViewController != nil{
            headerViewController?.reloadValues()
        }
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
        }
    }


}
