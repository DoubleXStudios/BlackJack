//
//  BlackJackGame.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import Foundation

enum StateX{
    case Betting
    
    case Game
    
    case Payout
}

class BlackJackGameX{
    var currentState: StateX = .Betting
    var currentBet: Int = 10
    
}