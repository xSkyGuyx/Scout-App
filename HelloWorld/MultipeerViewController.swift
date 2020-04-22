//
//  MultipeerViewController.swift
//  HelloWorld
//
//  Created by Skyhlar Myers on 2/8/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class MultipeerViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    var peerID: MCPeerID!
           var mcSession: MCSession!
           var mcAdvertiserAssistant: MCAdvertiserAssistant!
           var messageToSend: String!
    
    
    @IBOutlet weak var sendDataButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
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
        //Process Data that is recieved
        let message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
        print(message)
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sendDataButton.layer.borderWidth = 5
        sendDataButton.layer.borderColor = connectButton.tintColor.cgColor
        connectButton.layer.borderWidth = 5
        connectButton.layer.borderColor = connectButton.tintColor.cgColor
        // Do any additional setup after loading the view.
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
    }
    
    @IBAction func connectPressed(_ sender: Any) {
        let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }
    
    @IBAction func sendDataPressed(_ sender: Any) {
        print("Called")
        autonomousString = "killm e"
        messageToSend = "\(autonomousString)"
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
          try mcSession.send(message!, toPeers: mcSession.connectedPeers, with: .unreliable)

        }
        catch {
          print("Error sending message")
        }
    }
    func hostSession(action: UIAlertAction) {
      mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "ioscreator-chat", discoveryInfo: nil, session: mcSession)
      mcAdvertiserAssistant.start()
    }
    
    func joinSession(action: UIAlertAction) {
      let mcBrowser = MCBrowserViewController(serviceType: "ioscreator-chat", session: mcSession)
      mcBrowser.delegate = self
      present(mcBrowser, animated: true)
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
