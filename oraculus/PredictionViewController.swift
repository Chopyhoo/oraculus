//
//  PredictionViewController.swift
//  oraculus
//
//  Created by Alex Sobolevski on 10/16/16.
//  Copyright © 2016 Alex Sobolevski. All rights reserved.
//

import UIKit

class PredictionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectTopic(sender: UIButton) {
            print(sender.currentTitle)
    }    // MARK: Now this method is just for showing that we can select a topic via touching one of them on the top of the view
    
    @IBAction func rateThePrediction(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "RatingViewController")
        self.present(destinationVC, animated: true)
    }//MARK: - For my current task it is enough, later it will be modified for each topic chosen(with using "prepare for segue")
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
