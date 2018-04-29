//
//  ViewController.swift
//  Alert
//
//  Created by Irena Guerrero on 4/28/18.
//  Copyright © 2018 Irena Guerrero. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var panicButton: UIButton!
    @IBOutlet weak var ALERTLbl: UILabel!
    @IBOutlet weak var panicLbl: UILabel!
    
    var panicSound: AVAudioPlayer!
    
    var startTimer = Timer()
    var timerMaxSeconds: Double!
    var textColor: String!
    var timeSpent: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textColor = "White"
        timerMaxSeconds = 8.0
        timeSpent = timerMaxSeconds
        let path = Bundle.main.path(forResource: "Siren Noise", ofType: ".mp3")
        let panicSoundURL = URL(fileURLWithPath: path!)
        
        do{
            try panicSound = AVAudioPlayer(contentsOf: panicSoundURL)
            panicSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func panicPressed(_ sender: Any) {
        panicSound.play()
        
        startTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeTextColor), userInfo: nil, repeats: true)
        
        let number = URL(string: "tel://\(411)")
        UIApplication.shared.open(number!, options: [:], completionHandler: nil)
    }
    
    @objc func changeTextColor() {
        if textColor == "White" {
            panicLbl.textColor = UIColor.white
            ALERTLbl.textColor = UIColor.white
            textColor = "Red"
        } else {
            panicLbl.textColor = UIColor.red
            ALERTLbl.textColor = UIColor.red
            textColor = "White"
        }
        timeSpent = timeSpent - 0.2
        if timeSpent <= 0 {
            startTimer.invalidate()
            textColor = "White"
            timeSpent = timerMaxSeconds
        }
    }
    
}

