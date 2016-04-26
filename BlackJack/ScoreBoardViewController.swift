//
//  ScoreBoardViewController.swift
//  BlackJack
//
//  Created by Quincy McCarthy on 4/26/16.
//  Copyright © 2016 AppFactory. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    @IBOutlet weak var topScoreNameLabel: UILabel!
    @IBOutlet weak var topScoreValueLabel: UILabel!
    
    @IBOutlet weak var secondScoreNameLabel: UILabel!
    @IBOutlet weak var secondScoreValueLabel: UILabel!
    
    @IBOutlet weak var thirdScoreNameLabel: UILabel!
    @IBOutlet weak var thirdScoreValueLabel: UILabel!
    
    @IBOutlet weak var fourthScoreNameLabel: UILabel!
    @IBOutlet weak var fourthScoreValueLabel: UILabel!
    
    @IBOutlet weak var fifthScoreNameLabel: UILabel!
    @IBOutlet weak var fifthScoreValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
