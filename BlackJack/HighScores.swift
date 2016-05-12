//
//  HighScores.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/29/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import Foundation
import RealmSwift

class HighScores  {
    
    var highScores: [HighScore] = []
    
    func populateHighScoresFromRealm(){
        let realmObjects = blackJackRealm.objects(HighScore)
        for o in realmObjects{
            //print("Name: \(o.name), Score: \(o.score)")
            if(o.name == ""){
                try! blackJackRealm.write({ 
                    blackJackRealm.delete(o)
                })
            }
            appendHighScore(o.name, score: o.score)
        }
        
    }
    
    
    func updateHighScore(name: String, scoreValue: Int){
        let realmObjects = blackJackRealm.objects(HighScore)
        for o in realmObjects{
            if(o.name == name){
                try! blackJackRealm.write{
                    o.score = scoreValue
                }
                self.highScores = []
                populateHighScoresFromRealm()
                return
            }
        }
        var score: HighScore = HighScore()
        score.name = name
        score.score = scoreValue
        try! blackJackRealm.write{
            blackJackRealm.add(score)
        }
        populateHighScoresFromRealm()
    }

    
    func appendHighScore(name: String, score: Int){
        let newScore = HighScore(value: ["name": name, "score":score])
        highScores.append(newScore)
        highScores.sortInPlace(){$0.score > $1.score}

    }
    
    func getHighscoresAsDictionary()->[String:Int]{
        var scores: [String: Int] = [:]
        for i in 0 ..< (self.highScores.count){
            scores[self.highScores[i].name] = self.highScores[i].score
        }
        return scores
    }
}
