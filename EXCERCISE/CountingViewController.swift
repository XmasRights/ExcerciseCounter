//
//  CountingViewController.swift
//  EXCERCISE
//
//  Created by Christopher Fonseka on 04/03/2017.
//  Copyright © 2017 ChristopherFonseka. All rights reserved.
//

import UIKit
import AVFoundation

class CountingViewController: UIViewController
{
    @IBOutlet weak var largeLabel: UILabel!
    
    private var counter: Counter!
    
    private var timer = Timer()
    private let synth = AVSpeechSynthesizer()

    func start(withCounter counter: Counter)
    {
        say("Ready?")
        
        self.counter = counter
        self.timer   = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc private func update()
    {
        if let next = self.counter.next()
        {
            updateView(withInfo: next)
            say(String(next))
        }
        else
        {
            self.timer.invalidate()
        }
    }
    
    private func updateView(withInfo info: Int)
    {
        largeLabel.text = String(info)
    }
    
    private func say(_ phrase: String)
    {
        let utterance   = AVSpeechUtterance(string: phrase)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        
        synth.speak(utterance)
    }
}
