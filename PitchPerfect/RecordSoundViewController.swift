//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Gondai Mgano on 30/12/2020.
//  Copyright © 2020 Gondai Mgano. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController,AVAudioRecorderDelegate {
    
    var audioRecorder:AVAudioRecorder!

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
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    @IBAction func recordPress(_ sender: Any) {
         startRecordingLabel.text = "Stop Recording"
                        startRecordingButton.isEnabled = false
                        stopRecordingButton.isEnabled = true
       
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
         
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
      }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
           // print(audioRecorder.url)
            performSegue(withIdentifier: "showRecordDetail", sender: audioRecorder.url)
        }else{
            print("audio recording failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecordDetail" {
            let psVC = segue.destination as! PlaySoundsViewController
            let url = sender as! URL
           // print("Gondai Mgano \(url)")
            psVC.recordedAudioURL = url
        }
    }
    
    
}

