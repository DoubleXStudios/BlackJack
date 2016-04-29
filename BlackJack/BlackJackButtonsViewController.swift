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
//    @IBAction func chip1Remove(sender: AnyObject) {
//        UIView.animateWithDuration(1.0,
//            animations: {
//                self.chip1Button.titleLabel?.textColor = UIColor.redColor()
//                self.chip1Button.transform = CGAffineTransformMakeScale(0.6, 0.6)
//                
//            },
//            completion: { finish in
//                UIView.animateWithDuration(1.0){
//                    self.chip1Button.transform = CGAffineTransformIdentity
//                    self.chip1Button.titleLabel?.textColor = UIColor.whiteColor()
//                }
//        })
//        gameController?.game.currentBet -= 1
//        gameController?.gamePlayer.bank += 1
//        gameController?.updateAll()
//    }
    
    

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
            gameController?.game.currentBet += (gameController?.gamePlayer.requestMoney(amount))!
            gameController?.updateAll()
        }
    }
    
    @IBAction func clearTransaction(sender: AnyObject) {
        gameController?.gamePlayer.finalizeTransaction(false)
        gameController?.updateAll()

    }
    
    
    @IBAction func hitClicked(sender: AnyObject) {
        
    }
    
    @IBAction func standClicked(sender: AnyObject) {
        
        
    }

    @IBAction func dealClicked(sender: AnyObject) {
        if gameController != nil{
           gameController?.gamePlayer.finalizeTransaction(true)
           gameController?.updateAll()

        }
        
    }
    
    @IBAction func splitClicked(sender: AnyObject) {
        
    }

    
    @IBAction func doubleClicked(sender: AnyObject) {
    }


}
