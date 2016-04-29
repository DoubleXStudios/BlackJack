//
//  BlackJackGame.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import Foundation

enum State{
    case Betting
    
    case Game
    
    case Payout
}

class BlackJackGame{
    var currentState: State = .Betting
    var currentBet: Int = 10
    
}