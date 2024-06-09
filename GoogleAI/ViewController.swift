//
//  ViewController.swift
//  GoogleAI
//
//  Created by Sonali Bhattacharjee on 6/5/24.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    // Outlet properties
    @IBOutlet weak var lb_speech: UILabel!
    @IBOutlet weak var view_color: UIView!
    @IBOutlet weak var btn_start: UIButton!
    
    // local properties
    let audioEngine = AVAudioEngine()
    let speechRecognizer : SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var task : SFSpeechRecognitionTask!
    var isStart : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view_color.layer.cornerRadius = 10
    }
    
    @IBAction func btn_start_stop(_ sender: Any) {
        // start and stop speech recognition
    }
    
    func requestPermission() {
        SFSpeechRecognizer.requestAuthorization { (authState) in
            OperationQueue.main.addOperation {
                if authState == .authorized {
                    print("ACCEPTED")
                    self.btn_start.isEnabled = true
                } else if authState == .denied {
                    self.alertView(message: "User denied the permission")
                } else if authState == .notDetermined {
                    self.alertView(message: "In user phone there is no speech recognization")
                } else if authState == .restricted {
                    self.alertView(message: "User has been restricted for using the speech recognization")
                }
            }
        }
    }
    
    func alertView(message: String) {
        let controller = UIAlertController.init(title: "Error occurred...!", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            controller.dismiss(animated: true, completion: nil)
        }))
        self.present(controller, animated: true, completion: nil)
    }
}
