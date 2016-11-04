//
//  ViewController.swift
//  iOS10 StopWatch
//
//  Created by don't touch me on 11/4/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
        
        
        
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        // the isPlaying boolean property is used to check if the timer of the stopwatch is running
        if(isPlaying) {
            return
        }
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    func UpdateTimer() {
        
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        // the invalidate method of the NSTimer class is used to stop the timer
        timer.invalidate()
        isPlaying = false
        
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
        
    }
    
    
    
    

}

