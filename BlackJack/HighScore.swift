//
//  HighScore.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 5/9/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import Foundation
import RealmSwift

class HighScore: Object {
    
    dynamic var score: Int = 0
    dynamic var name: String = ""
    

}
