//
//  ViewController.swift
//  Application1
//
//  Created by Hovo on 8/10/20.
//  Copyright © 2020 Hovo. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    let session = AVAudioSession.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        auth()
    }

    @IBAction func pay(_ sender: UIButton) {
        guard let upUrl = URL(string: "myapp2://urlscheme?appshceme=myapp") else {return}
        UIApplication.shared.open(upUrl) { (result) in
            if result {
            }
        }
    }
    
    func auth() {
        switch AVAudioSession.sharedInstance().recordPermission{
        case AVAudioSessionRecordPermission.granted:
            print("Permission granted")
        case AVAudioSessionRecordPermission.denied:
            showAlert()
        case AVAudioSessionRecordPermission.undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                // Handle granted
            })
        }
    }
    func showAlert() {
        let alert = UIAlertController(title: "Don't use microphone", message: "GoToSetting", preferredStyle: .alert)
         let action = UIAlertAction(title: "Setting", style: .default, handler: { (action) in
            guard let url = URL(string: "App-Prefs:root=LOCATION_SERVICES") else {return}
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

