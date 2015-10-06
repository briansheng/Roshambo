//
//  ViewController.swift
//  Roshambo
//
//  Created by rsbrian on 2015/10/5.
//  Copyright © 2015年 Institute for Information Industry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Randomly generate an opponent's play
    func opponentPlayer() -> String {
        let randomPlay = arc4random() % 3
        
        switch(randomPlay) {
            case 0: return String("scissors")
            case 1: return String("rock")
            case 2: return String("paper")
            default: return String("Shits Happens")
        }
    }

    // Compare the user's play with the randomly generated play to determine a winner
    func compare2Plays(player: String) -> Int {

        let play = opponentPlayer()
        if player == play {
            return Int(0)
        }
        
        if player == "scissor" {
            if play == "rock" {
                return Int(-1)
            }
            else {
                return Int(1)
            }
        } else if player == "rock" {
            if play == "scissor" {
                return Int(1)
            } else {
                return Int(-1)
            }
        } else {
            if play == "rock" {
                return Int(1)
            } else {
                return Int(-1)
            }
        }
    }

    // All code: Scissors button
    @IBAction func scissorsPressed() {
        var controller: ResultViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        let result = compare2Plays("scissors")
        
        switch(result) {
            case -1:
                controller.resultString = "Rock crash scissors. You lose!"
                controller.resultImage = UIImage(named:"rockCrushScissors")
            case 0:
                controller.resultString = "It is a tie!"
                controller.resultImage = UIImage(named:"itsATie")
            case 1:
                controller.resultString = "Scissors cut paper. You win!"
                controller.resultImage = UIImage(named:"scissorsCutPaper")
            default: print("scissorsPressed Error")
        }
        
        presentViewController(controller, animated: true, completion: nil)
    }

    // Segue by Identifier
    @IBAction func rockPressed() {
        performSegueWithIdentifier("rocksPressed", sender: self)
    }
    
    // Segue only
    @IBAction func paperPressed(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        
        if segue.identifier == "paperPressed" {
            
            let result = compare2Plays("paper")
            
            switch(result) {
            case -1:
                controller.resultString = "Scissors cut paper. You lose!"
                controller.resultImage = UIImage(named:"scissorsCutPaper")
            case 0:
                controller.resultString = "It is a tie!"
                controller.resultImage = UIImage(named:"itsATie")
            case 1:
                controller.resultString = "Paper cover rock. You win!"
                controller.resultImage = UIImage(named:"paperCoversRock")
            default: print("paperPressed Error")
            }
        } else if segue.identifier == "rocksPressed" {
            let result = compare2Plays("rock")
            
            switch(result) {
            case -1:
                controller.resultString = "Paper cover rock. You lose!"
                controller.resultImage = UIImage(named:"paperCoversRock")
            case 0:
                controller.resultString = "It is a tie!"
                controller.resultImage = UIImage(named:"itsATie")
            case 1:
                controller.resultString = "Rock crash scissors. You win!"
                controller.resultImage = UIImage(named:"rockCrushScissors")
            default: print("rockPressed Error")
            }
        }
    }
    
}

