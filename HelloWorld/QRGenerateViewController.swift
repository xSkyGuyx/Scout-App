//
//  QRGenerateViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 1/30/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class QRGenerateViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {

//    var peerID: MCPeerID!
//    var mcSession: MCSession!
//    var mcAdvertiserAssistant: MCAdvertiserAssistant!
//    var messageToSend: String!
    
//    func hostSession(action: UIAlertAction) {
//      mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ioscreator-chat", discoveryInfo: nil, session: mcSession)
//      mcAdvertiserAssistant.start()
//    }
//
//    func joinSession(action: UIAlertAction) {
//      let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
//      mcBrowser.delegate = self
//      present(mcBrowser, animated: true)
//    }
    
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
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
      DispatchQueue.main.async { [unowned self] in
        let message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
//        self.chatView.text = self.chatView.text + message
      }
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
    

    @IBOutlet weak var teamNumLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamNumber)
        teamNumLabel.text = String(teamNumber)
        
//          peerID = MCPeerID(displayName: UIDevice.current.name)
//          mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
//          mcSession.delegate = self
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
    
    @IBAction func sendPressed(_ sender: Any) {
        sendData()
    }
    
    func sendData(){
        if(mcSession.connectedPeers.count>0){
            print("TeleopString2: \(teleopString)")
            var messageToSend = generalString+autonomousString+teleopString
            let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
            print(mcSession.connectedPeers)
            do {
              try mcSession.send(message!, toPeers: mcSession.connectedPeers, with: .unreliable)
                print("sent \(messageToSend)")
            }
            catch {
              print("Error sending message")
            }
        }else{
            let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
            mcBrowser.delegate = self
            present(mcBrowser, animated: true)
        }
//        if(self.mcSession.connectedPeers.count>0){
//            messageToSend = autonomousString + teleopString
//            let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
//
//            do {
//              try self.mcSession.send(message!, toPeers: self.mcSession.connectedPeers, with: .unreliable)
//                sentData[matchNumber] = messageToSend
//                storedMatches.append(String(matchNumber))
//            }
//            catch {
//                ToastView.shared.short(self.view, txt_msg: "Upload Failed")
//            }
//        }else{
//            let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
//            mcBrowser.delegate = self
//            present(mcBrowser, animated: true)
//            print("there is nothing")
//        }
    }
}
