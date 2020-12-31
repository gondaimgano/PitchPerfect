//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Gondai Mgano on 30/12/2020.
//  Copyright © 2020 Gondai Mgano. All rights reserved.
//

import UIKit

class RecordSoundViewController: UIViewController {

    @IBOutlet weak var startRecordingLabel: UILabel!
    

    @IBOutlet weak var startRecordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    @IBAction func stopRecording(_ sender: Any) {
        startRecordingLabel.text = "Start Recording"
        startRecordingButton.isEnabled = true
        stopRecordingButton.isEnabled = false
    }
    @IBAction func recordPress(_ sender: Any) {
         startRecordingLabel.text = "Stop Recording"
                        startRecordingButton.isEnabled = false
                        stopRecordingButton.isEnabled = true
         
      }
    
}

