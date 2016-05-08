//
//  GamePlayer.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import Foundation

enum CardX{
    case Card1
    case Card2
    case Card3
}

struct HandX{
    var card1: CardX
    var card2: CardX
}

class GamePlayer{
    var name: String
    var bank: Int
    var hand: Array<HandX>
    var credit: Int
    
    
    init(name :String = "new player", bank :Int = 50){
        hand = Array<HandX>()
        hand.append(HandX(card1: .Card1, card2: .Card2))
        self.name = name
        self.bank = bank
        self.credit = 0
    }
    
    func requestMoney(amount:Int)->Int{
        if(amount > (bank - credit)){
            return 0
        } else {
            credit += amount
            return amount
        }
    }
    
    func finalizeTransaction(success:Bool){
        if(success){
            bank -= credit
            credit = 0
        } else {
            credit = 0
        }
    }
    
    func getRemainingBalance()->Int{
        return bank-credit
    }
}