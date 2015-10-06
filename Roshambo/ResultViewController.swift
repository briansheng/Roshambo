//
//  ResultViewController.swift
//  Roshambo
//
//  Created by rsbrian on 2015/10/5.
//  Copyright © 2015年 Institute for Information Industry. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var resultString: String?
    var resultImage: UIImage?
    
    @IBOutlet weak var resultView: UIImageView!
    @IBOutlet weak var resultsOfMatch: UILabel!
    
    // We need this to store the value otherwise the iboutlet value is still nil.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.resultView.image = resultImage
        self.resultsOfMatch.text = resultString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgainPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
