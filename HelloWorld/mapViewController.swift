//
//  mapViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 1/20/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
var highGoalScores: Array<Int> = Array()
var highGoalScoresAuto: Array<Int> = Array()
var lowGoalScores: Array<Int> = Array()
var lowGoalScoresAuto: Array<Int> = Array()
var highGoalMisses: Array<Int> = Array()
var highGoalMissesAuto: Array<Int> = Array()
var lowGoalMisses: Array<Int> = Array()
var lowGoalMissesAuto: Array<Int> = Array()
var intakeOpposingSector: Array<Int> = Array()
var shortShotHighGoals: Array<Int> = Array()
var shortShotLowGoals: Array<Int> = Array()
var intakeOpposingSectorAuto: Array<Int> = Array()
var intakeAlliancesSectorAuto: Array<Int> = Array()
var intakeAlliancesSector: Array<Int> = Array()
var intakeAlliancesTrench: Array<Int> = Array()
var intakeOpposingTrench: Array<Int> = Array()
var intakeAlliancesTrenchAuto: Array<Int> = Array()
var intakeOpposingTrenchAuto: Array<Int> = Array()
var numOfShotBlocked = 0
var autonomousString = ""
var teleopString = ""
var generalString=""
var climbSuccess = 0
var numOfBallsGivenToTeam = 0
var numOfBallsGivenToTeamAuto = 0

class mapViewController: UIViewController {
    var movedFromLine = false
    var timeMovedFromLine = 0
    var numOfAutoFouls = 0
    var secToClimb = 0
    var running = false
    var runCount = 150
    var tooManyContinue = false
    var rotationControlFailed = 0
    var positionControlFailed = 0
    var timeToRotation = 0
    var timeToPosition = 0
    var startTime = 0
    var x = 100
    var numFarScoredHigh = 0
    var numFarScoredLow = 0
    var numShortScoredHigh = 0
    var numShortScoredLow = 0
    var numFarMissedHigh = 0
    var numFarMissedLow = 0
    var numShortMissedHigh = 0
    var numShortMissedLow = 0
    
    var numFarScoredHighAuto = 0
    var numFarScoredLowAuto = 0
    var numShortScoredHighAuto = 0
    var numShortScoredLowAuto = 0
    var numFarMissedHighAuto = 0
    var numFarMissedLowAuto = 0
    var numShortMissedHighAuto = 0
    var numShortMissedLowAuto = 0
    
    var numOfBallsDropped = 0
    var numFromTransferTop = 0
    var numFromTransferLow = 0
    var numShotFromGoalLow = 0
    var numShotFromSectorLow = 0
    var numShotFromOppSectorLow = 0
    var numShotFromGoalHigh = 0
    var numShotFromSectorHigh = 0
    var numShotFromOppSectorHigh = 0
    var numShotFromGoalLowAuto = 0
    var numShotFromSectorLowAuto = 0
    var numShotFromOppSectorLowAuto = 0
    var numShotFromGoalHighAuto = 0
    var numShotFromSectorHighAuto = 0
    var numShotFromOppSectorHighAuto = 0
    var positionControllSuccess = 0
    var rotationControllSuccess = 0
    var shotFromGoal = false
    var shotFromSector = false
    var shotFromOppSector = false
    var shotFromOppTrench = false
    var shotFromAllyTrench = false
    var timeInDefense = 0
    var numOfFouls = 0
    var teleop = false
    var timer:Timer?

    @IBOutlet weak var switchModeButton: UIButton!
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var climbButton: UIButton!
    @IBOutlet weak var bottomTrenchButton: UIButton!
    @IBOutlet weak var shotBlockedPressed: UIButton!
    @IBOutlet weak var defenseCancelButton: UIButton!
    @IBOutlet weak var defensePenaltiesButton: UIButton!
    @IBOutlet weak var defenseButton: UIButton!
    @IBOutlet weak var leftGoalButton: UIButton!
    @IBOutlet weak var transferLeftButton: UIButton!
    @IBOutlet weak var positionControlSuccess: UIButton!
    @IBOutlet weak var positionControlFailure: UIButton!
    @IBOutlet weak var positionControlCancel: UIButton!
    @IBOutlet weak var positionControlButton: UIButton!
    @IBOutlet weak var upperTransferPressed: UIButton!
    @IBOutlet weak var lowerTransferPressed: UIButton!
    @IBOutlet weak var shotButton: UIButton!
    
    @IBOutlet weak var nextScreenButton: UIButton!
    @IBOutlet weak var topTrenchButton: UIButton!
    
    @IBOutlet weak var longShotButton: UIButton!
    @IBOutlet weak var rightSideTransfer: UIButton!
    @IBOutlet weak var intakeBallDroppedButton: UIButton!
    @IBOutlet weak var rotationControlCancel: UIButton!
    @IBOutlet weak var rotationControlFailure: UIButton!
    @IBOutlet weak var rotationControlSuccess: UIButton!
    @IBOutlet weak var rotationControlButton: UIButton!
    @IBOutlet weak var topTenchButton: UIButton!
    @IBOutlet weak var bottomTrechButton: UIButton!
    @IBOutlet weak var rightSectorButton: UIButton!
    @IBOutlet weak var leftSectorButton: UIButton!
    
    @IBOutlet weak var transferCancelButton: UIButton!
    @IBOutlet weak var highGoalSuccesButton: UIButton!
    @IBOutlet weak var lowGoalSuccesButton: UIButton!
    @IBOutlet weak var highGoalMissedButton: UIButton!
    @IBOutlet weak var lowGoalMissedButton: UIButton!
    @IBOutlet weak var cancelGoalButton: UIButton!
    
    @IBOutlet weak var ballGivenToTeamButton: UIButton!
    
    @IBOutlet weak var shortShotButton: UIButton!
    @IBOutlet weak var autoFoulButton: UIButton!
    @IBOutlet weak var movedFromLineButton: UIButton!
    @IBOutlet weak var cancelIntakeButton: UIButton!
    @IBOutlet weak var ballButton: UIButton!
    @IBOutlet weak var rightGoalButton: UIButton!
    @IBOutlet weak var blueLeftMap: UIImageView!
    @IBOutlet weak var redLeftMap: UIImageView!
    @IBOutlet weak var blueRightMap: UIImageView!
    @IBOutlet weak var startTimerButton: UIButton!
    var numOfBalls = numOfPreloads;
//    var numOfBalls = 3
    let shouldBeInTeleopAlert = UIAlertController(title: "Teleop?", message: "You are 10 secs into teleop switch?", preferredStyle: .alert)
    let tooManyBallsOppAlert = UIAlertController(title: "Too many balls", message: "You have loaded over 5 balls, continue?", preferredStyle: .alert)
    let tooManyBallsHigherAlert = UIAlertController(title: "Too many balls", message: "You have loaded over 5 balls, continue?", preferredStyle: .alert)
    let tooManyBallsLowerAlert = UIAlertController(title: "Too many balls", message: "You have loaded over 5 balls, continue?", preferredStyle: .alert)
    let tooManyBallsAllyAlert = UIAlertController(title: "Too many balls", message: "You have loaded over 5 balls, continue?", preferredStyle: .alert)
    let highGoalAlert = UIAlertController(title: "Balls m8", message: "No balls loaded, score anyway?", preferredStyle: .alert)
    let lowGoalAlert = UIAlertController(title: "Balls m8", message: "No balls loaded, score anyway?", preferredStyle: .alert)
    
    let highMissAlert = UIAlertController(title: "Balls m8", message: "No balls loaded, score anyway?", preferredStyle: .alert)
    let lowMissAlert = UIAlertController(title: "Balls m8", message: "No balls loaded, score anyway?", preferredStyle: .alert)
    var sectorRightSelected = false
    var sectorLeftSelected = false
    var trenchTopSelected = false
    var trenchBottomeSelected = false
    var opponentsSector = false
    var alliancesSector = false
    @IBOutlet weak var rightSideTransferButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        shotButton.isHidden = true
        shortShotButton.isHidden = true
        longShotButton.isHidden = true
        movedFromLineButton.isHidden = true
        autoFoulButton.isHidden = true
        switchModeButton.isHidden = true
        positionControlCancel.isHidden = true
        positionControlFailure.isHidden = true
        transferCancelButton.isHidden = true
        positionControlSuccess.isHidden = true
        rotationControlSuccess.isHidden = true
        rotationControlFailure.isHidden = true
        rotationControlCancel.isHidden = true
        intakeBallDroppedButton.isHidden = true
        upperTransferPressed.isHidden = true
        lowerTransferPressed.isHidden = true
        ballButton.isHidden = true
        shotButton.isHidden = true
        cancelIntakeButton.isHidden = true
        shotBlockedPressed.isHidden = true
        shotBlockedPressed.frame.origin = CGPoint(x:500, y:280)
        defensePenaltiesButton.frame.origin = CGPoint(x:700,y:280)
        defenseCancelButton.frame.origin = CGPoint(x:500,y:380)
        defensePenaltiesButton.isHidden = true
        defenseCancelButton.isHidden = true
        ballGivenToTeamButton.isHidden = true
        popUpView.isHidden = true
        nextScreenButton.isHidden = true
        tooManyBallsHigherAlert.addAction(UIAlertAction(title:"Yes", style: .default, handler:{action in self.numOfBalls += 1; self.numFromTransferTop+=1}))
            
        tooManyBallsHigherAlert.addAction(UIAlertAction(title:"No", style: .default, handler:{action in self.tooManyContinue = false}))
        tooManyBallsLowerAlert.addAction(UIAlertAction(title:"Yes", style: .default, handler:{action in self.numOfBalls += 1; self.numFromTransferLow+=1}))
            
        tooManyBallsLowerAlert.addAction(UIAlertAction(title:"No", style: .default, handler:{action in self.tooManyContinue = false}))
        
        shouldBeInTeleopAlert.addAction(UIAlertAction(title:"Switch", style: .default, handler:{action in self.switchModesPressed()}))
        
        shouldBeInTeleopAlert.addAction(UIAlertAction(title:"Do nada", style: .default))
        
            
        
        tooManyBallsOppAlert.addAction(UIAlertAction(title:"Yes", style: .default, handler:{action in self.numOfBalls += 1; if(self.teleop){ intakeOpposingSector.append(self.runCount)} else{intakeOpposingSectorAuto.append(self.runCount)}}))
        
    tooManyBallsOppAlert.addAction(UIAlertAction(title:"No", style: .default, handler:{action in self.tooManyContinue = false}))
        
        tooManyBallsAllyAlert.addAction(UIAlertAction(title:"Yes", style: .default, handler:{action in self.numOfBalls += 1; if(self.teleop){ intakeAlliancesSector.append(self.runCount)} else{intakeAlliancesSectorAuto.append(self.runCount)}}))
            
    tooManyBallsAllyAlert.addAction(UIAlertAction(title:"No", style: .default, handler:{action in self.tooManyContinue = false}))
        highGoalAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{action in highGoalScoresAuto.append(self.runCount);
            if(self.teleop){if(self.shotFromSector){
            self.numShotFromSectorHigh += 1
        }
        else if(self.shotFromOppSector){
            self.numShotFromOppSectorHigh += 1
        }
        else if(self.shotFromGoal){
            self.numShotFromGoalHigh += 1
                }}else{if(self.shotFromSector){
                    self.numShotFromSectorHighAuto += 1
                }
                else if(self.shotFromOppSector){
                    self.numShotFromOppSectorHighAuto += 1
                }
                else if(self.shotFromGoal){
                    self.numShotFromGoalHighAuto += 1
                        }}}))
    highGoalAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        allianceColorBlue = true
        lowGoalAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{action in lowGoalScores.append(self.runCount); if(self.teleop){if(self.shotFromSector){
            self.numShotFromSectorLow += 1
        }
        else if(self.shotFromOppSector){
            self.numShotFromOppSectorLow += 1
        }
        else if(self.shotFromGoal){
            self.numShotFromGoalLow += 1
            }}else{
            if(self.shotFromSector){
                self.numShotFromSectorLowAuto += 1
            }
            else if(self.shotFromOppSector){
                self.numShotFromOppSectorLowAuto += 1
            }
            else if(self.shotFromGoal){
                self.numShotFromGoalLowAuto += 1
            }
            }}))
    lowGoalAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        highMissAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{action in if(self.teleop){highGoalMisses.append(self.runCount)}else{highGoalMissesAuto.append(self.runCount)}}))
    highMissAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        lowMissAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{action in if(self.teleop){lowGoalMisses.append(self.runCount)}else{lowGoalMissesAuto.append(self.runCount)}}))
    lowMissAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            allianceColorBlue = true
            allianceColorBlue = true
        highGoalSuccesButton.isHidden = true
        lowGoalSuccesButton.isHidden = true
        highGoalMissedButton.isHidden = true
        lowGoalMissedButton.isHidden = true
        cancelGoalButton.isHidden = true
        if(redLeft){
            redLeftMap.isHidden = false
            blueLeftMap.isHidden = true
        }
        else{
            redLeftMap.isHidden = true
            blueLeftMap.isHidden = false
        }
        
        positionControlButton.isHidden = true
        rotationControlButton.isHidden = true
        defenseButton.isHidden = true
        climbButton.isHidden = true
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shotBlockedPressed(_ sender: Any) {
        numOfShotBlocked += 1
    }
    
    
    @IBAction func leftTransferButtonPressed(_ sender: UIButton) {
        hideShit()
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
        upperTransferPressed.frame.origin = CGPoint(x:100, y:475)
        lowerTransferPressed.frame.origin = CGPoint(x:100, y:575)
        transferCancelButton.frame.origin = CGPoint(x:100, y:675)
            upperTransferPressed.isHidden = false
            lowerTransferPressed.isHidden = false
        transferCancelButton.isHidden = false
        }
    }
    
    @IBAction func rightTransferButtonPressed(_ sender: UIButton) {
        hideShit()
        print("rightSidePressed")
        if(redLeft && allianceColorBlue || !redLeft && allianceColorRed){
        upperTransferPressed.frame.origin = CGPoint(x:750, y:275)
        lowerTransferPressed.frame.origin = CGPoint(x:750, y:375)
        transferCancelButton.frame.origin = CGPoint(x:750, y:475)
            upperTransferPressed.isHidden = false
            lowerTransferPressed.isHidden = false
        transferCancelButton.isHidden = false
        }
    }
    
    @IBAction func defenseButtonPressed(_ sender: Any) {
        hideShit()
        startTime = runCount
        defensePenaltiesButton.frame.origin = CGPoint(x:846, y:20)
        shotBlockedPressed.frame.origin = CGPoint(x:731, y:20)
        defensePenaltiesButton.isHidden = false
        defenseCancelButton.isHidden = true
        shotBlockedPressed.isHidden = false
    }
    
    
    //lol you're bad and stupid
    
    @IBAction func foulButtonPressed(_ sender: Any) {
        numOfFouls += 1
    }
    @IBAction func defenseCancelButtonPressed(_ sender: UIButton) {
        timeInDefense += startTime - runCount
        defensePenaltiesButton.isHidden = true
        defenseCancelButton.isHidden = true
        shotBlockedPressed.isHidden = true

    }
    @IBAction func transferCancelButtonPressed(_ sender: UIButton) {
        
        upperTransferPressed.isHidden = true
            lowerTransferPressed.isHidden = true
        transferCancelButton.isHidden = true
    }
    @IBAction func upperTransferButtonPressed(_ sender: UIButton) {
        hideShit()
        if(numOfBalls<5){
            numOfBalls += 1
            numFromTransferTop += 1
        }
        else{
    self.present(tooManyBallsHigherAlert, animated: true)
        }
    }
    @IBAction func lowerTransferButtonPressed(_ sender: UIButton) {
        hideShit()
        if(numOfBalls < 5){
            numOfBalls += 1
            numFromTransferLow += 1
        }
        else{
        self.present(tooManyBallsLowerAlert, animated:true)
        }
    }
    
    @IBAction func topTrenchPressed(_ sender: UIButton) {
        hideShit()
        x = 300
        print("topTrench")
        ballButton.frame.origin = CGPoint(x:300, y:275)
        intakeBallDroppedButton.frame.origin = CGPoint(x:300, y:525)
        cancelIntakeButton.frame.origin = CGPoint(x:300, y:600)
        ballButton.isHidden = false
        intakeBallDroppedButton.isHidden = false
        cancelIntakeButton.isHidden = false
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            shotFromOppSector = false
            shotFromSector = false
            shotFromGoal = false
            shotFromOppTrench = true
            shotFromAllyTrench = false
        }
    }
    
    
    
    
    @IBAction func leftTrenchPressed(_ sender: UIButton) {
        hideShit()
        x = 100
        print("leftTrench")
        ballButton.frame.origin = CGPoint(x:100, y:275)
        intakeBallDroppedButton.frame.origin = CGPoint(x:100, y:525)
        cancelIntakeButton.frame.origin = CGPoint(x:100, y:600)
        ballButton.isHidden = false
        intakeBallDroppedButton.isHidden = false
        cancelIntakeButton.isHidden = false
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            alliancesSector = true
            shotFromOppSector = false
            shotFromGoal = true
            shotFromSector = true
        }
        else{
            opponentsSector = true
            shotFromOppSector = true
            shotFromGoal = false
            shotFromSector = false
            shotFromOppTrench = false
            shotFromAllyTrench = false
        }
    }
    
    @IBAction func bottomTrenchPressed(_ sender: UIButton) {
        hideShit()
        x = 400
        print("bottomTrench")
        ballButton.frame.origin = CGPoint(x:400, y:275)
        intakeBallDroppedButton.frame.origin = CGPoint(x:400, y:525)
        cancelIntakeButton.frame.origin = CGPoint(x:400, y:600)
        ballButton.isHidden = false
        intakeBallDroppedButton.isHidden = false
        cancelIntakeButton.isHidden = false
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            shotFromOppSector = false
            shotFromSector = false
            shotFromGoal = false
            shotFromOppTrench = false
            shotFromAllyTrench = true
        }
    }
    
    
    @IBAction func rightTrenchPressed(_ sender: UIButton) {
        hideShit()
        x = 700
        print("rightTrench")
        ballButton.frame.origin = CGPoint(x:700, y:275)
        intakeBallDroppedButton.frame.origin = CGPoint(x:700, y:525)
        cancelIntakeButton.frame.origin = CGPoint(x:700, y:600)
        ballButton.isHidden = false
        intakeBallDroppedButton.isHidden = false
        cancelIntakeButton.isHidden = false
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
            opponentsSector = true
            shotFromOppSector = true
            shotFromGoal = false
            shotFromSector = false
        }
        else{
            alliancesSector = true
            shotFromOppSector = false
            shotFromGoal = false
            shotFromSector = true
            shotFromOppTrench = false
            shotFromAllyTrench = false
        }
    }
    
    
    @IBAction func ballDroppedButtonPressed(_ sender: UIButton) {
        if(numOfBalls>0){
            numOfBalls -= 1
        }
        numOfBallsDropped += 1
    }
    var numOfIntake = 0
    @IBAction func ballButtonPressed(_ sender: UIButton) {
        if(teleop){
            numOfIntake += 1
        }
        else{
            numOfIntakeAuto += 1
        }
        }
    
    var numOfIntakeAuto = 0
    @IBAction func cancelIntakePressed(_ sender: UIButton) {
        ballButton.isHidden = true
        cancelIntakeButton.isHidden = true
        opponentsSector = false
        alliancesSector = false
        intakeBallDroppedButton.isHidden = true
    }
    @IBAction func shotButtonPressed(_ sender: Any) {
        hideShit()
        shortShotButton.isHidden = false
        longShotButton.isHidden = false
    }
    var isShort = false
    @IBAction func longShotPressed(_ sender: Any) {
        isShort = false
        x=400
        highGoalSuccesButton.frame.origin = CGPoint(x:x, y:300)
        highGoalMissedButton.frame.origin = CGPoint(x:x+150, y:300)
        lowGoalSuccesButton.frame.origin = CGPoint(x:x, y:400)
        lowGoalMissedButton.frame.origin = CGPoint(x:x+150, y:400)
        cancelGoalButton.frame.origin = CGPoint(x:x, y:500)
            ballButton.isHidden = true
        intakeBallDroppedButton.isHidden = true
            cancelIntakeButton.isHidden = true
            highGoalSuccesButton.isHidden = false
            lowGoalSuccesButton.isHidden = false
            highGoalMissedButton.isHidden = false
            lowGoalMissedButton.isHidden = false
            cancelGoalButton.isHidden = false
    }
    
    @IBAction func shortShotPressed(_ sender: Any) {
        isShort = true
        x=400
        highGoalSuccesButton.frame.origin = CGPoint(x:x, y:300)
        highGoalMissedButton.frame.origin = CGPoint(x:x+150, y:300)
        lowGoalSuccesButton.frame.origin = CGPoint(x:x, y:400)
        lowGoalMissedButton.frame.origin = CGPoint(x:x+150, y:400)
        cancelGoalButton.frame.origin = CGPoint(x:x, y:500)
            ballButton.isHidden = true
        intakeBallDroppedButton.isHidden = true
            cancelIntakeButton.isHidden = true
            highGoalSuccesButton.isHidden = false
            lowGoalSuccesButton.isHidden = false
            highGoalMissedButton.isHidden = false
            lowGoalMissedButton.isHidden = false
            cancelGoalButton.isHidden = false
    }
    
    @IBAction func shotPressed(_ sender: UIButton) {
        highGoalSuccesButton.frame.origin = CGPoint(x:x, y:300)
        highGoalMissedButton.frame.origin = CGPoint(x:x+150, y:300)
        lowGoalSuccesButton.frame.origin = CGPoint(x:x, y:400)
        lowGoalMissedButton.frame.origin = CGPoint(x:x+150, y:400)
        cancelGoalButton.frame.origin = CGPoint(x:x, y:500)
            ballButton.isHidden = true
        intakeBallDroppedButton.isHidden = true
            cancelIntakeButton.isHidden = true
            highGoalSuccesButton.isHidden = false
            lowGoalSuccesButton.isHidden = false
            highGoalMissedButton.isHidden = false
            lowGoalMissedButton.isHidden = false
            cancelGoalButton.isHidden = false
        
    }
    
    @IBAction func leftGoalPressed(_ sender: UIButton) {
        isShort = true
        if(redLeft && allianceColorBlue || !redLeft && allianceColorRed){
        highGoalSuccesButton.isHidden = false
        lowGoalSuccesButton.isHidden = false
        highGoalMissedButton.isHidden = false
        lowGoalMissedButton.isHidden = false
        cancelGoalButton.isHidden = false
        highGoalSuccesButton.frame.origin = CGPoint(x:100, y:300)
        highGoalMissedButton.frame.origin = CGPoint(x:250, y:300)
        lowGoalSuccesButton.frame.origin = CGPoint(x:100, y:400)
        lowGoalMissedButton.frame.origin = CGPoint(x:250, y:400)
        cancelGoalButton.frame.origin = CGPoint(x:100, y:500)
            shotFromOppSector = false
            shotFromGoal = true
            shotFromSector = false
        }
    }
    @IBAction func rightGoalPressed(_ sender: UIButton) {
        isShort = true
        if(redLeft && allianceColorRed || !redLeft && allianceColorBlue){
        highGoalSuccesButton.isHidden = false
        lowGoalSuccesButton.isHidden = false
        highGoalMissedButton.isHidden = false
        lowGoalMissedButton.isHidden = false
        cancelGoalButton.isHidden = false
        highGoalSuccesButton.frame.origin = CGPoint(x:700, y:300)
        highGoalMissedButton.frame.origin = CGPoint(x:850, y:300)
        lowGoalSuccesButton.frame.origin = CGPoint(x:700, y:400)
        lowGoalMissedButton.frame.origin = CGPoint(x:850, y:400)
        cancelGoalButton.frame.origin = CGPoint(x:700, y:500)
            shotFromOppSector = false
            shotFromGoal = true
            shotFromSector = false
        }
    }
    
    @IBAction func cancelGoalPressed(_ sender: UIButton) {
        highGoalSuccesButton.isHidden = true
        lowGoalSuccesButton.isHidden = true
        highGoalMissedButton.isHidden = true
        lowGoalMissedButton.isHidden = true
        cancelGoalButton.isHidden = true
    }
    
    @IBAction func highGoalPressed(_ sender: UIButton) {
        if(teleop){
            if(isShort){
                numShortScoredHigh += 1
            }
            else{
                    numFarScoredHigh += 1
            }
            }
           
        
    else{
            if(isShort){
                numShortScoredLow += 1
            }
            else{
                    numFarScoredHighAuto += 1
            }
        }
            
        
    }
    @IBAction func lowGoalPressed(_ sender: UIButton) {
        if(teleop){
                if(isShort){
                    numShortScoredLow += 1
                }
                else{
                    numFarScoredLow += 1
                }
        }
        else{
            
                if(isShort){
                    numShortScoredLowAuto += 1
                }
                else{
                    numFarScoredLowAuto += 1
                }
        }
    }
    @IBAction func highGoalMissed(_ sender: UIButton) {
        if(teleop){
                if(isShort){
                    numShortMissedHigh += 1
                }else{
                    numFarMissedHigh += 1
                }
        }
        else{
                if(isShort){
                    numShortMissedHighAuto += 1
                }else{
                    numFarMissedHighAuto += 1
                }
                
        }
    }
    @IBAction func lowGoalMissed(_ sender: UIButton) {
        if(teleop){
                if(isShort){
                    numShortMissedLow += 1
                }else{
                    numFarMissedLow += 1
                }

            }
        
        else{
                if(isShort){
                    numShortMissedLowAuto += 1
                }else{
                    numFarMissedLowAuto += 1
                }

            
        }
    }
    
    
    @IBAction func startTimerPressed(_ sender: Any) {
        shotButton.isHidden = false
        if(!running){
            running = true
    startTimerButton.setTitle("Pause", for: UIControl.State.normal)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            print(self.runCount)
            self.runCount -= 1
            if(self.runCount==125 && !self.teleop){
                self.present(self.shouldBeInTeleopAlert, animated: true)
            }
           
            self.timerLabel.text = String(self.runCount)
            
            if (self.runCount == 0 || self.running == false){
                timer.invalidate()
            }
            }
        }
        else{
            self.running = false
            startTimerButton.setTitle("Resume", for: UIControl.State.normal)
        }
        if(!teleop){
            ballGivenToTeamButton.isHidden = false
                   switchModeButton.isHidden = false
                   movedFromLineButton.isHidden = false
                   autoFoulButton.isHidden = false
        }
    }
    
    @IBAction func rotationControlPressed(_ sender: UIButton) {
        hideShit()
        rotationControlSuccess.isHidden = false
        rotationControlFailure.isHidden = false
        rotationControlSuccess.frame.origin = CGPoint(x:257,y:20)
        rotationControlFailure.frame.origin = CGPoint(x:372,y:20)
        rotationControlCancel.frame.origin = CGPoint(x:400,y:250)
         startTime = runCount
    }
    
    func hideShit(){
        shortShotButton.isHidden = true
        longShotButton.isHidden = true
        popUpView.isHidden = true
        positionControlCancel.isHidden = true
        positionControlFailure.isHidden = true
        transferCancelButton.isHidden = true
        positionControlSuccess.isHidden = true
        rotationControlSuccess.isHidden = true
        rotationControlFailure.isHidden = true
        rotationControlCancel.isHidden = true
        intakeBallDroppedButton.isHidden = true
        upperTransferPressed.isHidden = true
        lowerTransferPressed.isHidden = true
        ballButton.isHidden = true
        cancelIntakeButton.isHidden = true
        shotBlockedPressed.isHidden = true
        defensePenaltiesButton.isHidden = true
        defenseCancelButton.isHidden = true
        
    }
    @IBAction func rotationControlCancelPressed(_ sender: UIButton) {
        rotationControlSuccess.isHidden = true
        rotationControlFailure.isHidden = true
        rotationControlCancel.isHidden = true
    }
    @IBAction func rotationControlFailPressed(_ sender: UIButton) {
        rotationControlFailed += 1
    }
    
    @IBAction func rotationSuccessPressed(_ sender: UIButton) {
        rotationControllSuccess = 1
        timeToRotation = startTime - runCount
    }
    
    @IBAction func positionControlPressed(_ sender: UIButton) {
        hideShit()
        positionControlCancel.isHidden = true
        positionControlFailure.isHidden = false
        positionControlSuccess.isHidden = false
        positionControlSuccess.frame.origin = CGPoint(x:494,y:20)
        positionControlFailure.frame.origin = CGPoint(x:609,y:20)
        positionControlCancel.frame.origin = CGPoint(x:600,y:250)
         startTime = runCount
    }
    
    @IBAction func positionControlSuccess(_ sender: UIButton) {
        timeToPosition = startTime - runCount
        positionControlCancel.isHidden = true
        positionControlFailure.isHidden = true
        positionControlSuccess.isHidden = true
        positionControllSuccess = 0
        print(timeToPosition)
    }
    
    @IBAction func positionControlFail(_ sender: UIButton) {
        positionControlFailed += 1
    }
    @IBAction func positionControlCancel(_ sender: UIButton) {
        positionControlCancel.isHidden = true
        positionControlFailure.isHidden = true
        positionControlSuccess.isHidden = true
    }
    
    @IBAction func switchModesPressed(_ sender: UIButton) {
        if(teleop){
            teleop = false
            positionControlButton.isHidden = true
            rotationControlButton.isHidden = true
            defenseButton.isHidden = true
            climbButton.isHidden = true
            positionControlButton.isHidden = true
            rotationControlButton.isHidden = true
            defenseButton.isHidden = true
            climbButton.isHidden = true
            movedFromLineButton.isHidden = false
            autoFoulButton.isHidden = false
            
        }
        else{
            teleop = true
            positionControlButton.isHidden = false
            rotationControlButton.isHidden = false
            defenseButton.isHidden = false
            climbButton.isHidden = false
            positionControlButton.isHidden = false
            rotationControlButton.isHidden = false
            defenseButton.isHidden = false
            climbButton.isHidden = false
            movedFromLineButton.isHidden = true
            autoFoulButton.isHidden = true
            
        }
        print(teleop)
    }
    
    func switchModesPressed(){
        if(teleop){
            switchModeButton.setTitle("Switch", for: UIControl.State.normal)
            teleop = false
        }
        else{
            switchModeButton.setTitle("Switch", for: UIControl.State.normal)
            teleop = true
        }
    }
    
    @IBAction func climbButtonPressed(_ sender: UIButton) {

        hideShit()
        popUpView.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    @objc func onTimerFires()
    {
        secToClimb+=1
    }
    
    @IBAction func climbCancelPressed(_ sender: Any) {
        popUpView.isHidden = true
        timer?.invalidate()
        secToClimb=0
        nextScreenButton.isHidden = false

    }
    @IBAction func climbSuccessfulPressed(_ sender: Any) {
        timer?.invalidate()
        popUpView.isHidden = true
        print(secToClimb)
        climbSuccess = 2
        timer?.invalidate()
        nextScreenButton.isHidden = false

    }
    @IBAction func climbFailedPressed(_ sender: Any) {
        timer?.invalidate()
        popUpView.isHidden = true
        climbSuccess = 1
        nextScreenButton.isHidden = false
    }
    
    @IBAction func movedFromLinePressed(_ sender: Any) {
        movedFromLine = true
        timeMovedFromLine = 135 - runCount
        movedFromLineButton.setTitleColor(UIColor.black, for: .disabled)
        movedFromLineButton.isEnabled = false
    }
    
    @IBAction func autoFoulPressed(_ sender: Any) {
        numOfAutoFouls += 1
    }
    
    @IBAction func ballGivenToTeamPressed(_ sender: Any) {
        hideShit()
        if(teleop){
            numOfBallsGivenToTeam += 1
        }
        else{
            numOfBallsGivenToTeamAuto += 1
        }
    }
    
    @IBAction func nextScreenPressed(_ sender: Any) {
        //^High Goal Makes
        //ë High Goal Misses
        //æ Low Goal Makes
        //â Low Goal Misses
        //ø Intake Opposing Trench
        //ę Intake Alliances Trench
        //ÿ Intake Alliances Sector
        //č Intake Opposing Sector
        
        //ç Climb attempted/Climb successful
        
        //For non-optional Values
        generalString = "?\(scoutID)|\(matchNumber)|\(teamNumber)|\(numOfPreloads)|\(startingPos)|"
        
        var number = 0

        //For auto values
        autonomousString = "\(movedFromLine)|\(timeMovedFromLine)|\(numOfAutoFouls)|\(numOfBallsGivenToTeamAuto)|\(numFarScoredHighAuto)|\(numFarScoredLowAuto)|\(numFarMissedHighAuto)|\(numFarMissedLowAuto)|\(numShortScoredHighAuto)|\(numShortScoredLowAuto)|\(numShortMissedHighAuto)|\(numShortMissedLowAuto)|\(numOfIntakeAuto)|"
        
        secToClimb = 5
        //For teleop values
        teleopString = "\(secToClimb)|\(rotationControllSuccess)|\(timeToRotation)|\(rotationControlFailed)|\(positionControllSuccess)|\(timeToPosition)|\(positionControlFailed)|\(numOfBallsDropped)|\(numFromTransferTop)|\(numFromTransferLow)|\(numFarScoredHigh)|\(numFarMissedHigh)|\(numFarScoredLow)|\(numFarMissedHigh)|\(numShortScoredHigh)|\(numShortMissedHigh)|\(numShortScoredLow)|\(numShortMissedHigh)|\(numOfBallsGivenToTeam)|\(numOfIntake)|"
        
            print("TeleOP: \(teleopString)")
        print("numFarScoredHigh \(numFarScoredHigh)")
    }
    
    
    
}
