//
//  testViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 1/20/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
var numOfPreloads = 0
var allianceColorBlue = false
var allianceColorRed = false
var startingPos = 0 //1 = farLeft -- 2 = midLeft ...

class testViewController: UIViewController {
    
    @IBOutlet weak var teamNumLabel: UILabel!
    @IBOutlet weak var farLeftButton: UIButton!
     @IBOutlet weak var farLeft: UIButton!
    @IBOutlet weak var midLeft: UIButton!
    @IBOutlet weak var centerLeft: UIButton!
    @IBOutlet weak var centerRight: UIButton!
    @IBOutlet weak var midRight: UIButton!
    @IBOutlet weak var farRight: UIButton!
    @IBOutlet weak var numberOfPreloads: UILabel!
    @IBOutlet weak var numberOfPreloadSelector: UISegmentedControl!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var rightSideFieldFlipped: UIImageView!
    
    @IBOutlet weak var leftSideFieldFlipped: UIImageView!
    @IBOutlet weak var rightSideField: UIImageView!
    @IBOutlet weak var leftSideView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did load")
        print(redLeft)
        teamNumLabel.text = String(teamNumber)
        nextButton.isHidden = true
        if(scoutID < 4){
             allianceColorBlue = true
             allianceColorRed = false
        }
        if(scoutID > 3){
             allianceColorBlue = false
             allianceColorRed = true
        }
        print(allianceColorRed)
        if(redLeft && allianceColorRed){
            leftSideFieldFlipped.isHidden = false
            rightSideField.isHidden = true
            rightSideFieldFlipped.isHidden = true
            leftSideView.isHidden = true
        }
        else if(redLeft && allianceColorBlue){
            leftSideFieldFlipped.isHidden = true
            rightSideField.isHidden = true
            rightSideFieldFlipped.isHidden = false
            leftSideView.isHidden = true
        }
        else if(!redLeft && allianceColorBlue){
            leftSideFieldFlipped.isHidden = true
            rightSideField.isHidden = false
            rightSideFieldFlipped.isHidden = true
            leftSideView.isHidden = true
        }
        else if(!redLeft && allianceColorBlue){
            leftSideFieldFlipped.isHidden = true
            rightSideField.isHidden = true
            rightSideFieldFlipped.isHidden = true
            leftSideView.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func farLeftPressed(_ sender: Any) {
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            startingPos = 1
        }
        else{
            startingPos = 6
        }
        nextButton.isHidden = false
        print("farLeft")

    }
    
    @IBAction func midLeftPressed(_ sender: Any) {
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            startingPos = 2
        }
        else{
            startingPos = 5
        }
        nextButton.isHidden = false

    }
    
    @IBAction func centerLeftPressed(_ sender: Any) {
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            startingPos = 3
        }
        else{
            startingPos = 4
        }
        nextButton.isHidden = false

    }
    
    @IBAction func centerRightPressed(_ sender: Any) {
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            startingPos = 4
        }
        else{
            startingPos = 3
        }
        nextButton.isHidden = false

    }
    
    @IBAction func midRightPressed(_ sender: Any) {
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            startingPos = 5
        }
        else{
            startingPos = 2
        }
        nextButton.isHidden = false

    }
    
    @IBAction func farRightPressed(_ sender: Any) {
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            startingPos = 6
        }
        else{
            startingPos = 1
        }
        nextButton.isHidden = false

    }
    
    @IBAction func nextPressed(_ sender: Any) {
        numOfPreloads = numberOfPreloadSelector.selectedSegmentIndex
        print(numOfPreloads)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
