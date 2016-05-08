//
//  CardsViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 5/3/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var gameController: BlackJackViewController?
    
    
    
    @IBOutlet weak var dealerHandStackView: UIStackView!
    @IBOutlet weak var playerHandStackView: UIStackView!
    
    @IBOutlet weak var dealerCard1: UIImageView!
    @IBOutlet weak var dealerCard2: UIImageView!
    @IBOutlet weak var dealerCard3: UIImageView!
    @IBOutlet weak var dealerCard4: UIImageView!
    @IBOutlet weak var dealerCard5: UIImageView!

    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playercard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerCard5: UIImageView!
    
    @IBOutlet weak var dealerInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealerInformationLabel.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func reloadCards(){
        if(gameController != nil){
            hideAllCards()
            if(gameController?.game.state != .Betting){
                let playerHand = gameController?.game.playerHand
                let dealerHand = gameController?.game.dealerHand
            
                for card in (playerHand?.getCardImageNames())!{
                    //print("player card:\(card)")
                    setNextPlayerCard(card)
                }
            
                for card in (dealerHand?.getCardImageNames())!{
                    //print("dealer card:\(card)")
                    setNextDealerCard(card)
                }
            }
        }
    }
    
    func setNextPlayerCard(cardImageName: String){
        if(playerCard1.hidden == true){
            setCardImage(cardImageName, imageView: playerCard1)
            return
        }
        if(playerCard2.hidden == true){
            setCardImage(cardImageName, imageView: playerCard2)
            return
        }
        if(playercard3.hidden == true){
            setCardImage(cardImageName, imageView: playercard3)
            return
        }
        if(playerCard4.hidden == true){
            setCardImage(cardImageName, imageView: playerCard4)
            return
        }
        if(playerCard5.hidden == true){
            setCardImage(cardImageName, imageView: playerCard5)
            return
        }
    }
    
    func animateReveal(){
        //self.dealerCard1.alpha = 0
        self.dealerCard2.alpha = 0
        self.dealerCard3.alpha = 0
        self.dealerCard4.alpha = 0
        self.dealerCard5.alpha = 0
        
        dealerCard2.hidden = true
        dealerCard3.hidden = true
        dealerCard4.hidden = true
        dealerCard5.hidden = true
        
        for cardImageName in (gameController?.game.dealerHand.getCardImageNames())! {
            
            if(dealerCard1.hidden == true){
                //setCardImage(cardImageName, imageView: playerCard1)
                dealerCard1.hidden = false
            }
            if(dealerCard2.hidden == true){
                self.dealerCard2.image = UIImage(named: cardImageName)
                dealerCard2.hidden = false
                UIView.animateWithDuration(1.0, animations: {
                    self.dealerCard2.alpha = 1
                })
                
                
                
            }
            if(dealerCard3.hidden == true){
                self.dealerCard3.image = UIImage(named: cardImageName)
                dealerCard3.hidden = false
                UIView.animateWithDuration(1.0, animations: {
                    self.dealerCard3.alpha = 1
                })
            }
            if(dealerCard4.hidden == true){
                self.dealerCard4.image = UIImage(named: cardImageName)
                dealerCard4.hidden = false
                UIView.animateWithDuration(1.0, animations: {
                    self.dealerCard4.alpha = 1
                })
            }
            if(dealerCard5.hidden == true){
                self.dealerCard5.image = UIImage(named: cardImageName)
                dealerCard5.hidden = false
                UIView.animateWithDuration(1.0, animations: {
                    self.dealerCard5.alpha = 1
                })
            }
        }
    }
    func setCardImage(name: String, imageView: UIImageView){
        imageView.image = UIImage(named: name)
        imageView.hidden = false
    }
    
    
    func setNextDealerCard(cardImageName: String){
        
        if(dealerCard1.hidden == true){
            setCardImage(cardImageName, imageView: dealerCard1)
            return
        }
        if(dealerCard2.hidden == true){
            if(gameController != nil){
                if(gameController?.game.state != State.Revealing && gameController?.game.state != State.Payout ){
                    setCardImage("CardBack", imageView: dealerCard2)
                    return

                } else {
                    setCardImage(cardImageName, imageView: dealerCard2)
                    return
                }
            }
        }
        if(dealerCard3.hidden == true){
            setCardImage(cardImageName, imageView: dealerCard3)
            return
        }
        if(dealerCard4.hidden == true){
            setCardImage(cardImageName, imageView: dealerCard4)
            return
        }
        if(dealerCard5.hidden == true){
            setCardImage(cardImageName, imageView: dealerCard5)
            return
        }
    }
    
    
    
    
    func setInfoLabel(message: String){
        hideAllCards()
        setLabel(false, message: message, color: UIColor.redColor(), label: dealerInformationLabel)

    }
    
    func setLabel(isHidden: Bool, message: String, color: UIColor, label: UILabel){
        label.text = message
        label.hidden = false
        label.sizeToFit()
        label.textColor = color
    }
    
    func animateMessageAndClearCards(message: String){
        hideAllCards()
        UIView.animateWithDuration(4.0, animations: {
            self.dealerCard1.alpha = 0
            self.dealerCard2.alpha = 0
            self.dealerCard3.alpha = 0
            self.dealerCard4.alpha = 0
            self.dealerCard5.alpha = 0
            self.playerCard1.alpha = 0
            self.playerCard2.alpha = 0
            self.playercard3.alpha = 0
            self.playerCard4.alpha = 0
            self.playerCard5.alpha = 0
        })
        
        
        
        self.dealerInformationLabel.alpha = 0
        setInfoLabel(message)
        UIView.animateWithDuration(4.0) {
            self.dealerInformationLabel.alpha = 1
        }
        
        sleep(1)
//        UIView.animateWithDuration(1.0) {
//            self.dealerInformationLabel.alpha = 0
//        }
        
    }
    
    func removeMessageAndReset(){
        UIView.animateWithDuration(1.0) {
            self.dealerInformationLabel.alpha = 0
        }
        self.dealerInformationLabel.hidden = true
        self.dealerCard1.alpha = 1
        self.dealerCard2.alpha = 1
        self.dealerCard3.alpha = 1
        self.dealerCard4.alpha = 1
        self.dealerCard5.alpha = 1
        self.playerCard1.alpha = 1
        self.playerCard2.alpha = 1
        self.playercard3.alpha = 1
        self.playerCard4.alpha = 1
        self.playerCard5.alpha = 1
    }
    
    
    func reset(){
        self.dealerCard1.alpha = 1
        self.dealerCard2.alpha = 1
        self.dealerCard3.alpha = 1
        self.dealerCard4.alpha = 1
        self.dealerCard5.alpha = 1
        
        self.playerCard1.alpha = 1
        self.playerCard2.alpha = 1
        self.playercard3.alpha = 1
        self.playerCard4.alpha = 1
        self.playerCard5.alpha = 1
    }
    
    func hideAllCards(){
        dealerCard1.hidden = true
        dealerCard2.hidden = true
        dealerCard3.hidden = true
        dealerCard4.hidden = true
        dealerCard5.hidden = true
        
        playerCard1.hidden = true
        playerCard2.hidden = true
        playercard3.hidden = true
        playerCard4.hidden = true
        playerCard5.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
