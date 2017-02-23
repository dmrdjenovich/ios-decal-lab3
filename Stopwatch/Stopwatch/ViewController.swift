//
//  ViewController.swift
//  Stopwatch
//
//  Created by David Mrdjenovich on 2/16/17.
//  Copyright © 2017 David Mrdjenovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeDisp: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    let model = Stopwatch()
    var timer : Timer?
    var running : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerTic (_ timer: Timer) -> Void {
        let toDisp : String = model.getTimeString()
        timeDisp.text = toDisp
    }
    
    @IBAction func clickedStartReset(_ sender: UIButton) {
        if (!running) {
            model.start()
            sender.setTitle("Reset", for : .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(self.timerTic(_:)),
                             userInfo: nil,
                             repeats: true)
            running = true
        }
        else {
            sender.setTitle("Start", for : .normal)
            timer?.invalidate()
            model.reset()
            timeDisp.text = "00:00.00"
            running = false
        }
    }
    
    @IBAction func clickedStop(_ sender: UIButton) {
        if (running) {
            startButton.setTitle("Start", for : .normal)
            timer?.invalidate()
            model.stop()
            running = false
        }
    }


}

