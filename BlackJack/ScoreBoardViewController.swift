//
//  ScoreBoardViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/26/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {
    
    var scoreBoardList: HighScores?
    

    @IBOutlet weak var firstPlaceLabel: UILabel!
    @IBOutlet weak var topScoreNameLabel: UILabel!
    @IBOutlet weak var topScoreValueLabel: UILabel!
    var topScoreSet = false {
        didSet{
            if(topScoreSet){
                firstPlaceLabel.text = "1"
            } else {
                firstPlaceLabel.text = ""
            }
        }
    }
    
    @IBOutlet weak var secondPlaceLabel: UILabel!
    @IBOutlet weak var secondScoreNameLabel: UILabel!
    @IBOutlet weak var secondScoreValueLabel: UILabel!
    var secondScoreSet = false {
        didSet{
            if(secondScoreSet){
                secondPlaceLabel.text = "2"
            } else {
                secondPlaceLabel.text = ""
            }
        }
    }
    
    @IBOutlet weak var thirdPlaceLabel: UILabel!
    @IBOutlet weak var thirdScoreNameLabel: UILabel!
    @IBOutlet weak var thirdScoreValueLabel: UILabel!
    var thirdScoreSet = false {
        didSet{
            if(thirdScoreSet){
                thirdPlaceLabel.text = "3"
            } else {
                thirdPlaceLabel.text = ""
            }
        }
    }
    
    @IBOutlet weak var fourthPlaceLabel: UILabel!
    @IBOutlet weak var fourthScoreNameLabel: UILabel!
    @IBOutlet weak var fourthScoreValueLabel: UILabel!
    var fourthScoreSet = false  {
        didSet{
            if(fourthScoreSet){
                fourthPlaceLabel.text = "4"
            } else {
                fourthPlaceLabel.text = ""
            }
        }
    }
    
    @IBOutlet weak var fifthPlaceLabel: UILabel!
    @IBOutlet weak var fifthScoreNameLabel: UILabel!
    @IBOutlet weak var fifthScoreValueLabel: UILabel!
    var fifthScoreSet = false {
        didSet{
            if(fifthScoreSet){
                fifthPlaceLabel.text = "5"
            } else {
                fifthPlaceLabel.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        scoreBoardList = HighScores()
        print("2")
        scoreBoardList!.populateHighScoresFromRealm()
        print("3")
        updateLabels()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("1")
        scoreBoardList = HighScores()
        print("2")
        scoreBoardList!.populateHighScoresFromRealm()
        print("3")
        updateLabels()

    }

    func updateLabels(){
        clearScoreBoard()
        let top5 = scoreBoardList?.highScores
        for pair in top5!{
            if(!topScoreSet){
                topScoreSet = true
                topScoreNameLabel.text = pair.name
                topScoreValueLabel.text = "$\(pair.score)"
            } else if(!secondScoreSet){
                secondScoreSet = true
                secondScoreNameLabel.text = pair.name
                secondScoreValueLabel.text = "$\(pair.score)"
            } else if(!thirdScoreSet){
                thirdScoreSet = true
                thirdScoreNameLabel.text = pair.name
                thirdScoreValueLabel.text = "$ \(pair.score)"
            } else if(!fourthScoreSet){
                fourthScoreSet = true
                fourthScoreNameLabel.text = pair.name
                fourthScoreValueLabel.text = "$\(pair.score)"
            } else if(!fifthScoreSet){
                fifthScoreSet = true
                fifthScoreNameLabel.text = pair.name
                fifthScoreValueLabel.text = "$\(pair.score)"
            }

        }
    }
    
    func getTop5()->[String:Int]{
        var scores = scoreBoardList?.highScores
        var top5: [String:Int] = [:]
        for _ in 0 ..< 6{
            if let score = scores?.popLast(){
                top5[score.name] = score.score
            }
        }
        scoreBoardList?.populateHighScoresFromRealm()
        return top5
    }
    
    func clearScoreBoard(){
        topScoreNameLabel.text = ""
        topScoreValueLabel.text = ""
        topScoreSet = false
        secondScoreNameLabel.text = ""
        secondScoreValueLabel.text = ""
        secondScoreSet = false
        thirdScoreNameLabel.text = ""
        thirdScoreValueLabel.text = ""
        thirdScoreSet = false
        fourthScoreNameLabel.text = ""
        fourthScoreValueLabel.text = ""
        fourthScoreSet = false
        fifthScoreNameLabel.text = ""
        fifthScoreValueLabel.text = ""
        fifthScoreSet = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
