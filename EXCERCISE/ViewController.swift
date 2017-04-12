//
//  ViewController.swift
//  EXCERCISE
//
//  Created by Christopher Fonseka on 01/03/2017.
//  Copyright © 2017 ChristopherFonseka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    @IBOutlet weak var repLabel:   UILabel!
    @IBOutlet weak var speedLabel: UISlider!
    @IBOutlet weak var breakLabel: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        repLabel.text = "5"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func repSliderValueChanged(_ sender: Any)
    {
        guard let slider = sender as? UISlider else { return }
        let value = Int(slider.value)

        repLabel.text = String(value)
    }

    @IBAction func speedSliderValueChanged(_ sender: Any)
    {
        print("Speed changed")
    }

    @IBAction func breakSliderValueChanged(_ sender: Any)
    {
        print("Break Slider Changed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let countingView = segue.destination as? CountingViewController else { return }
        countingView.start(withCounter: Counter(reps: 5))
    }
}








