//
//  HighScores.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import Foundation
import RealmSwift

class HighScores: Object {
    
    dynamic var highScores: [Score] = [Score()]
    
    func appendHighScore(name: String, score: Int){
        let newScore = Score(value: ["name": name, "score":score])
        highScores.append(newScore)
        highScores.sortInPlace(){$0.score > $1.score}
        if(highScores.count > 5){
            highScores.dropLast()
        }
    }
    
    func getHighscoresAsDictionary()->[String:Int]{
        var scores: [String: Int] = [:]
        for i in 0 ..< (self.highScores.count){
            scores[self.highScores[i].name] = self.highScores[i].score
        }
        return scores
    }

    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}

class Score: Object {
    dynamic var name:String = "no name"
    dynamic var score:Int = 0
}