//
//  RetrieveDataViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/10/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MultipeerConnectivity
//var message = ""
class RetrieveDataViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
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
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
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
    
    @IBAction func connectPressed(_ sender: Any) {
        let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
        }
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
        red3String.remove(at: red2String.startIndex)
        red3String.remove(at: red2String.startIndex)
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
        blue1String.remove(at: red2String.startIndex)
        blue1String.remove(at: red2String.startIndex)
        blue1MatchSchedule = []
        blue1String.remove(at: blue1String.startIndex)
        done = false
        while(!done){
            blue1MatchSchedule.append(Int(String(blue1String.prefix(upTo: blue1String.firstIndex(of: "\"")!)))!)
            if(blue1String.firstIndex(of: ",") != nil){
            blue1String = String(blue1String.suffix(from: blue1String.firstIndex(of: ",")!))
            blue1String = String(blue1String.suffix(from: blue1String.firstIndex(of: "\"")!))
            blue1String = String(blue1String.dropFirst())
            }
            else{
                done = true
            }
        }
        blue2String.remove(at: red2String.startIndex)
        blue2String.remove(at: red2String.startIndex)
        blue2MatchSchedule = []
        blue2String.remove(at: blue2String.startIndex)
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
        blue3String.remove(at: blue3String.startIndex)
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
        sendConfirmation()
        print("confirmation sent")
    }
    func sendConfirmation(){
        messageToSend = "1"
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
          try self.mcSession.send(message!, toPeers: self.mcSession.connectedPeers, with: .unreliable)
        }
        catch {
          print("Error sending message")
        }
    }
}
