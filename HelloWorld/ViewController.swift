//
//  ViewController.swift
//  HelloWorld
//
//

import UIKit
import MultipeerConnectivity
var redLeft = false
var scoutID = 1
var teamNumber = 0
var red1MatchSchedule: [Int] = []
var red2MatchSchedule: [Int] = []
var red3MatchSchedule: [Int] = []
var blue1MatchSchedule: [Int] = []
var blue2MatchSchedule: [Int] = []
var blue3MatchSchedule: [Int] = []
var matchNumber:Int = 0
var message = ""
var sentData: [String] = Array(repeating: "", count: 100)
var storedMatches: [String] = []
var peerID: MCPeerID!
   var mcSession: MCSession!
   var mcAdvertiserAssistant: MCAdvertiserAssistant!
class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    @IBOutlet weak var brButton: UIButton!
    @IBOutlet weak var rbButton: UIButton!
    @IBOutlet weak var teamNumberLabel: UILabel!
    @IBOutlet weak var retrieveMatchesButton: UIButton!
    @IBOutlet weak var reeeesendButton: UIButton!
    @IBOutlet weak var resendTextField: UITextField!
    @IBOutlet weak var bootupImage: UIImageView!
    
    @IBOutlet weak var matchNumberBox: UITextField!
    @IBOutlet weak var readyButton: UIButton!
    @IBOutlet weak var scoutIDSelect: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(withTimeInterval: 0.50, repeats: false) { timer in
            self.bootupImage.isHidden = true
        }
        reeeesendButton.layer.borderWidth = 5
        reeeesendButton.layer.borderColor = retrieveMatchesButton.tintColor.cgColor
        retrieveMatchesButton.layer.borderWidth = 5
        retrieveMatchesButton.layer.borderColor = retrieveMatchesButton.tintColor.cgColor
    peerID = MCPeerID(displayName: "Scout: "+UIDevice.current.name)
    mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
    mcSession.delegate = self
        rbButton.isHidden = true
        brButton.isHidden = false
        scoutID = scoutIDSelect.selectedSegmentIndex+1
    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(qrString.contains("|")){
        var count = 0
        var tempString = ""
        var modifiedString = qrString
            
        var index = qrString.firstIndex(of: "|")
        var distance = qrString.distance(from: qrString.startIndex, to: index!)
        print("distance:", distance)
        while(count<distance){
            var index2 = modifiedString.firstIndex(of: ",")!
            index2 = modifiedString.index(index2, offsetBy: -1)
            print("index2: \(index2)")
            let distance2 = modifiedString.distance(from: modifiedString.startIndex, to: index2)
            print("Distance 2: \(distance2)")
//        modifiedString.index(modifiedString.startIndex, offsetBy: count)
            var re = 0
            print("modifiedString: \(modifiedString)")
            while re<=distance2{
                var firstString = modifiedString.prefix(1)
                tempString = tempString + String(firstString)
                print("Temp String: \(tempString)")
                modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                print("--->\(modifiedString)")
                re += 1
            }
            red1MatchSchedule.append(Int(tempString)!)
            print("red1MatchSchedule \(red1MatchSchedule)")
            tempString = ""
            modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
            count = count + distance2 + 2
            print("Count: \(count)")
        }
        modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))

                count = 0
        var start = qrString.index(qrString.startIndex, offsetBy: distance+1)
        var end = qrString.index(qrString.endIndex, offsetBy: 0)
        qrString = String(qrString[start..<end])
        print("=========== \(qrString)")
                tempString = ""
                modifiedString = qrString
                index = qrString.firstIndex(of: "|")
                distance = qrString.distance(from: qrString.startIndex, to: index!)
                print("distance:", distance)
                while(count<distance){
                    var index2 = modifiedString.firstIndex(of: ",")!
                    index2 = modifiedString.index(index2, offsetBy: -1)
                    print("index2: \(index2)")
                    let distance2 = modifiedString.distance(from: modifiedString.startIndex, to: index2)
                    print("Distance 2: \(distance2)")
        //        modifiedString.index(modifiedString.startIndex, offsetBy: count)
                    var re = 0
                    print("modifiedString: \(modifiedString)")
                    while re<=distance2{
                        var firstString = modifiedString.prefix(1)
                        tempString = tempString + String(firstString)
                        print("Temp String: \(tempString)")
                        modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                        print("--->\(modifiedString)")
                        re += 1
                    }
                    modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                    print(tempString)
                    red2MatchSchedule.append(Int(tempString)!)
                    print("red2MatchSchedule \(red2MatchSchedule)")
                    tempString = ""
//                    modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                    count = count + distance2 + 2
                    print("Count: \(count)")
                }
        
        count = 0
        print ("rererererererrererere \(qrString)")
        start = qrString.index(qrString.startIndex, offsetBy: distance+1)
        end = qrString.index(qrString.endIndex, offsetBy: 0)
        qrString = String(qrString[start..<end])
        print("=========== \(qrString)")
                tempString = ""
                modifiedString = qrString
                index = qrString.firstIndex(of: "|")
                distance = qrString.distance(from: qrString.startIndex, to: index!)
                print("distance:", distance)
                while(count<distance){
                    var index2 = modifiedString.firstIndex(of: ",")!
                    index2 = modifiedString.index(index2, offsetBy: -1)
                    print("index2: \(index2)")
                    let distance2 = modifiedString.distance(from: modifiedString.startIndex, to: index2)
                    print("Distance 2: \(distance2)")
        //        modifiedString.index(modifiedString.startIndex, offsetBy: count)
                    var re = 0
                    print("modifiedString: \(modifiedString)")
                    while re<=distance2{
                        var firstString = modifiedString.prefix(1)
                        tempString = tempString + String(firstString)
                        print("Temp String: \(tempString)")
                        modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                        print("--->\(modifiedString)")
                        re += 1
                    }
                    red3MatchSchedule.append(Int(tempString)!)
                    print("red3MatchSchedule \(red3MatchSchedule)")
                    tempString = ""
                    modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                    count = count + distance2 + 2
                    print("Count: \(count)")
                }
        count = 0
        print ("rererererererrererere \(qrString)")
        start = qrString.index(qrString.startIndex, offsetBy: distance+1)
        end = qrString.index(qrString.endIndex, offsetBy: 0)
        qrString = String(qrString[start..<end])
        print("=========== \(qrString)")
                tempString = ""
                modifiedString = qrString
                index = qrString.firstIndex(of: "|")
                distance = qrString.distance(from: qrString.startIndex, to: index!)
                print("distance:", distance)
                while(count<distance){
                    var index2 = modifiedString.firstIndex(of: ",")!
                    index2 = modifiedString.index(index2, offsetBy: -1)
                    print("index2: \(index2)")
                    let distance2 = modifiedString.distance(from: modifiedString.startIndex, to: index2)
                    print("Distance 2: \(distance2)")
        //        modifiedString.index(modifiedString.startIndex, offsetBy: count)
                    var re = 0
                    print("modifiedString: \(modifiedString)")
                    while re<=distance2{
                        var firstString = modifiedString.prefix(1)
                        tempString = tempString + String(firstString)
                        print("Temp String: \(tempString)")
                        modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                        print("--->\(modifiedString)")
                        re += 1
                    }
                    blue1MatchSchedule.append(Int(tempString)!)
                    print("blue1MatchSchedule \(blue1MatchSchedule)")
                    tempString = ""
                    modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                    count = count + distance2 + 2
                    print("Count: \(count)")
                }
        count = 0
               print ("rererererererrererere \(qrString)")
               start = qrString.index(qrString.startIndex, offsetBy: distance+1)
               end = qrString.index(qrString.endIndex, offsetBy: 0)
               qrString = String(qrString[start..<end])
               print("=========== \(qrString)")
                       tempString = ""
                       modifiedString = qrString
                       index = qrString.firstIndex(of: "|")
                       distance = qrString.distance(from: qrString.startIndex, to: index!)
                       print("distance:", distance)
                       while(count<distance){
                           var index2 = modifiedString.firstIndex(of: ",")!
                           index2 = modifiedString.index(index2, offsetBy: -1)
                           print("index2: \(index2)")
                           let distance2 = modifiedString.distance(from: modifiedString.startIndex, to: index2)
                           print("Distance 2: \(distance2)")
               //        modifiedString.index(modifiedString.startIndex, offsetBy: count)
                           var re = 0
                           print("modifiedString: \(modifiedString)")
                           while re<=distance2{
                               var firstString = modifiedString.prefix(1)
                               tempString = tempString + String(firstString)
                               print("Temp String: \(tempString)")
                               modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                               print("--->\(modifiedString)")
                               re += 1
                           }
                           blue2MatchSchedule.append(Int(tempString)!)
                           print("blue2MatchSchedule \(blue2MatchSchedule)")
                           tempString = ""
                           modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                           count = count + distance2 + 2
                           print("Count: \(count)")
                       }
        count = 0
               print ("rererererererrererere \(qrString)")
               start = qrString.index(qrString.startIndex, offsetBy: distance+1)
               end = qrString.index(qrString.endIndex, offsetBy: 0)
               qrString = String(qrString[start..<end])
               print("=========== \(qrString)")
                       tempString = ""
                       modifiedString = qrString
                       index = qrString.firstIndex(of: "|")
                       distance = qrString.distance(from: qrString.startIndex, to: index!)
                       print("distance:", distance)
                       while(count<distance){
                           var index2 = modifiedString.firstIndex(of: ",")!
                           index2 = modifiedString.index(index2, offsetBy: -1)
                           print("index2: \(index2)")
                           let distance2 = modifiedString.distance(from: modifiedString.startIndex, to: index2)
                           print("Distance 2: \(distance2)")
               //        modifiedString.index(modifiedString.startIndex, offsetBy: count)
                           var re = 0
                           print("modifiedString: \(modifiedString)")
                           while re<=distance2{
                               var firstString = modifiedString.prefix(1)
                               tempString = tempString + String(firstString)
                               print("Temp String: \(tempString)")
                               modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                               print("--->\(modifiedString)")
                               re += 1
                           }
                           blue3MatchSchedule.append(Int(tempString)!)
                           print("blue3MatchSchedule \(blue3MatchSchedule)")
                           tempString = ""
                           modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: 0))
                           count = count + distance2 + 2
                           print("Count: \(count)")
                       }
        print("red1MatchSchedule \(red1MatchSchedule)")
        print("red2MatchSchedule \(red2MatchSchedule)")
        print("red3MatchSchedule \(red3MatchSchedule)")
        print("blue1MatchSchedule \(blue1MatchSchedule)")
        print("blue2MatchSchedule \(blue2MatchSchedule)")
        print("blue3MatchSchedule \(blue3MatchSchedule)")
        }
        
        
            
 
//    matchSchedule.append(String(qrString[r]))
//                qrString = String(qrString[index...])
//                qrString.remove(at: qrString.startIndex)
//                print(qrString)
//                print(matchSchedule)
        matchNumber = Int(matchNumberBox.text!)!
//        if(!matchSchedule.isEmpty){ teamNumber=Int(matchSchedule[matchNumber!*scoutID-1]) ?? 4717
        
    }
//            print(qrString[r])
//            var numberString = String(qrString[r])
//            teamNumber = Int(numberString)!
//            teamNumberLabel.text = String(teamNumber)
            
        
        
    

    @IBAction func idChanged(_ sender: Any) {
        if(!red2MatchSchedule.isEmpty){
        scoutID = scoutIDSelect.selectedSegmentIndex+1
        if(scoutIDSelect.selectedSegmentIndex == 0){
            teamNumber = red1MatchSchedule[Int(matchNumberBox.text!)!-1]
        }
        else if(scoutIDSelect.selectedSegmentIndex == 1){
            teamNumber = red2MatchSchedule[Int(matchNumberBox.text!)!-1]
        }
        else if(scoutIDSelect.selectedSegmentIndex == 2){
            teamNumber = red3MatchSchedule[Int(matchNumberBox.text!)!-1]
        }
        else if(scoutIDSelect.selectedSegmentIndex == 3){
            teamNumber = blue1MatchSchedule[Int(matchNumberBox.text!)!-1]
        }
        else if(scoutIDSelect.selectedSegmentIndex == 4){
            teamNumber = blue2MatchSchedule[Int(matchNumberBox.text!)!-1]
        }
        else if(scoutIDSelect.selectedSegmentIndex == 5){
            teamNumber = blue3MatchSchedule[Int(matchNumberBox.text!)!-1]
        }
            teamNumberLabel.text = String(teamNumber)
        print(scoutID)
        }
    }
    
    @IBAction func brButtonPressed(_ sender: UIButton) {
        brButton.isHidden = true;
        rbButton.isHidden = false;
        redLeft = true
        
    }
    @IBAction func rbButtonPressed(_ sender: UIButton) {
        brButton.isHidden = false;
        rbButton.isHidden = true;
        redLeft = false
    }
    @IBAction func readyPressed(_ sender: Any) {
//        print(qrString)
        if(qrString.contains("!")){
            print("good qr code")

            
        }
        
    }
    @IBAction func matchNumberChanged(_ sender: UITextField) {
        if(scoutIDSelect.selectedSegmentIndex == 0){
            teamNumber = red1MatchSchedule[Int(matchNumberBox.text!)!-1]
            peerID = MCPeerID(displayName: "Scout 1")

        }
        else if(scoutIDSelect.selectedSegmentIndex == 1){
            teamNumber = red2MatchSchedule[Int(matchNumberBox.text!)!-1]
            peerID = MCPeerID(displayName: "Scout 2")

        }
        else if(scoutIDSelect.selectedSegmentIndex == 2){
            teamNumber = red3MatchSchedule[Int(matchNumberBox.text!)!-1]
            peerID = MCPeerID(displayName: "Scout 3")

        }
        else if(scoutIDSelect.selectedSegmentIndex == 3){
            teamNumber = blue1MatchSchedule[Int(matchNumberBox.text!)!-1]
            peerID = MCPeerID(displayName: "Scout 4")

        }
        else if(scoutIDSelect.selectedSegmentIndex == 4){
            teamNumber = blue2MatchSchedule[Int(matchNumberBox.text!)!-1]
            peerID = MCPeerID(displayName: "Scout 5")

        }
        else if(scoutIDSelect.selectedSegmentIndex == 5){
            teamNumber = blue3MatchSchedule[Int(matchNumberBox.text!)!-1]
            peerID = MCPeerID(displayName: "Scout 6")

        }
            teamNumberLabel.text = String(teamNumber)
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
          print("Connected: \(peerID.displayName)")
        case .connecting:
          print("Connecting: \(peerID.displayName)")
        case .notConnected:
          print("Not Connected: \(peerID.displayName)")
        @unknown default:
          print("fatal error")
        }
    }
   
    var messageToSend: String!
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
        print(message)
        parseData()
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
                dismiss(animated: true)

    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
                dismiss(animated: true)

    }
    
    @IBAction func retrievePressed(_ sender: Any) {
        let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }
    
    
    func parseData(){
        var red1String = String(message.prefix(upTo: message.firstIndex(of: "|")!))
        red1String.remove(at: red1String.startIndex)
        message = String(message.suffix(from: message.firstIndex(of: "|")!))
        message = String(message.dropFirst())
        print("Message \(message)")
        var red2String = String(message.prefix(upTo: message.firstIndex(of: "|")!))
        message = String(message.suffix(from: message.firstIndex(of: "|")!))
        message = String(message.dropFirst())
        var red3String = String(message.prefix(upTo: message.firstIndex(of: "|")!))
        message = String(message.suffix(from: message.firstIndex(of: "|")!))
        message = String(message.dropFirst())
        print("Red3String: \(red3String)")
        var blue1String = String(message.prefix(upTo: message.firstIndex(of: "|")!))
        message = String(message.suffix(from: message.firstIndex(of: "|")!))
        message = String(message.dropFirst())
        var blue2String = String(message.prefix(upTo: message.firstIndex(of: "|")!))
        message = String(message.suffix(from: message.firstIndex(of: "|")!))
        message = String(message.dropFirst())
        var blue3String = String(message.prefix(upTo: message.firstIndex(of: "|")!))
        message = String(message.suffix(from: message.firstIndex(of: "|")!))
        red1MatchSchedule = []
        red1String.remove(at: red1String.startIndex)
        var done = false
        while(!done){
            red1MatchSchedule.append(Int(String(red1String.prefix(upTo: red1String.firstIndex(of: "\"")!)))!)
            if(red1String.firstIndex(of: ",") != nil){
            red1String = String(red1String.suffix(from: red1String.firstIndex(of: ",")!))
            red1String = String(red1String.suffix(from: red1String.firstIndex(of: "\"")!))
            red1String = String(red1String.dropFirst())
            }
            else{
                done = true
            }
            if(scoutIDSelect.selectedSegmentIndex == 0){
                teamNumber = red1MatchSchedule[Int(matchNumberBox.text!)!-1]
            }
            else if(scoutIDSelect.selectedSegmentIndex == 1){
                teamNumber = red2MatchSchedule[Int(matchNumberBox.text!)!-1]
            }
            else if(scoutIDSelect.selectedSegmentIndex == 2){
                teamNumber = red3MatchSchedule[Int(matchNumberBox.text!)!-1]
            }
            else if(scoutIDSelect.selectedSegmentIndex == 3){
                teamNumber = blue1MatchSchedule[Int(matchNumberBox.text!)!-1]
            }
            else if(scoutIDSelect.selectedSegmentIndex == 4){
                teamNumber = blue2MatchSchedule[Int(matchNumberBox.text!)!-1]
            }
            else if(scoutIDSelect.selectedSegmentIndex == 5){
                teamNumber = blue3MatchSchedule[Int(matchNumberBox.text!)!-1]
            }
                teamNumberLabel.text = String(teamNumber)        }
        red2MatchSchedule = []
        red2String.remove(at: red2String.startIndex)
        red2String.remove(at: red2String.startIndex)
        print("red2String \(red2String)")
        done = false
        while(!done){
            red2MatchSchedule.append(Int(String(red2String.prefix(upTo: red2String.firstIndex(of: "\"")!)))!)
            if(red2String.firstIndex(of: ",") != nil){
            red2String = String(red2String.suffix(from: red2String.firstIndex(of: ",")!))
            red2String = String(red2String.suffix(from: red2String.firstIndex(of: "\"")!))
            red2String = String(red2String.dropFirst())
            }
            else{
                done = true
            }
    }
        red3String.remove(at: red3String.startIndex)
        red3MatchSchedule = []
            red3String.remove(at: red3String.startIndex)
            done = false
            while(!done){
                red3MatchSchedule.append(Int(String(red3String.prefix(upTo: red3String.firstIndex(of: "\"")!)))!)
                if(red3String.firstIndex(of: ",") != nil){
                red3String = String(red3String.suffix(from: red3String.firstIndex(of: ",")!))
                red3String = String(red3String.suffix(from: red3String.firstIndex(of: "\"")!))
                red3String = String(red3String.dropFirst())
                }
                else{
                    done = true
                }
        }
        blue1MatchSchedule = []
        blue1String.remove(at: blue1String.startIndex)
        blue1String.remove(at: blue1String.startIndex)
        done = false
        print("blue1String:\(blue1String)")
        while(!done){
            blue1MatchSchedule.append(Int(String(blue1String.prefix(upTo: blue1String.firstIndex(of: "\"")!)))!)
            if(blue1String.firstIndex(of: ",") != nil){
            blue1String = String(blue1String.suffix(from: blue1String.firstIndex(of: ",")!))
            blue1String = String(blue1String.suffix(from: blue1String.firstIndex(of: "\"")!))
            blue1String = String(blue1String.dropFirst())
                print("blue1String:\(blue1String)")
            }
            else{
                done = true
            }
        }
        blue2String.remove(at: red2String.startIndex)
        blue2String.remove(at: red2String.startIndex)
        blue2MatchSchedule = []
        done = false
        while(!done){
            blue2MatchSchedule.append(Int(String(blue2String.prefix(upTo: blue2String.firstIndex(of: "\"")!)))!)
            if(blue2String.firstIndex(of: ",") != nil){
            blue2String = String(blue2String.suffix(from: blue2String.firstIndex(of: ",")!))
            blue2String = String(blue2String.suffix(from: blue2String.firstIndex(of: "\"")!))
            blue2String = String(blue2String.dropFirst())
            }
            else{
                done = true
            }
        }
        blue3String.remove(at: red2String.startIndex)
        blue3String.remove(at: red2String.startIndex)
        blue3MatchSchedule = []
        done = false
        while(!done){
            blue3MatchSchedule.append(Int(String(blue3String.prefix(upTo: blue3String.firstIndex(of: "\"")!)))!)
            if(blue3String.firstIndex(of: ",") != nil){
            blue3String = String(blue3String.suffix(from: blue3String.firstIndex(of: ",")!))
            blue3String = String(blue3String.suffix(from: blue3String.firstIndex(of: "\"")!))
            blue3String = String(blue3String.dropFirst())
            }
            else{
                done = true
            }
        }
        bootupImage.isHidden = true
        sendConfirmation()
        print("confirmation sent")
    }
    func sendConfirmation(){
        matchNumber = Int(matchNumberBox.text!)!
        //        if(!matchSchedule.isEmpty){ teamNumber=Int(matchSchedule[matchNumber!*scoutID-1]) ?? 4717
                if(scoutIDSelect.selectedSegmentIndex == 0 && red1MatchSchedule != []){
                    teamNumber = red1MatchSchedule[Int(matchNumberBox.text!)!-1]
                }
                else if(scoutIDSelect.selectedSegmentIndex == 1 && red2MatchSchedule != []){
                    teamNumber = red2MatchSchedule[Int(matchNumberBox.text!)!-1]
                }
                else if(scoutIDSelect.selectedSegmentIndex == 2 && red3MatchSchedule != []){
                    teamNumber = red3MatchSchedule[Int(matchNumberBox.text!)!-1]
                }
                else if(scoutIDSelect.selectedSegmentIndex == 3 && blue1MatchSchedule != []){
                    teamNumber = blue1MatchSchedule[Int(matchNumberBox.text!)!-1]
                }
                else if(scoutIDSelect.selectedSegmentIndex == 4 && blue2MatchSchedule != []){
                    teamNumber = blue2MatchSchedule[Int(matchNumberBox.text!)!-1]
                }
                else if(scoutIDSelect.selectedSegmentIndex == 5 && blue3MatchSchedule != []){
                    teamNumber = blue3MatchSchedule[Int(matchNumberBox.text!)!-1]
                }else{
                    teamNumber = red1MatchSchedule[Int(matchNumberBox.text!)!-1]
                }
        teamNumberLabel.text = String(teamNumber)
                
        bootupImage.isHidden = true
    }
    
    @IBAction func resendPressed(_ sender: Any) {
        if((storedMatches.firstIndex(of: resendTextField.text ?? "99999")) != nil){
            if(mcSession.connectedPeers.count>0){
                messageToSend = storedMatches[Int(String(resendTextField.text!))!]
                let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
                
                do {
                  try mcSession.send(message!, toPeers: mcSession.connectedPeers, with: .unreliable)
                }
                catch {
                  print("Error sending message")
                }
            }else{
                let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
                       mcBrowser.delegate = self
                       present(mcBrowser, animated: true)
            }
            
        }
    }
    
    
}

