//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 遠山　哲 on 2020/09/10.
//  Copyright © 2020 tootootooyaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter:Int = 0
    let imageArray = [
        "0_space.jpg",
        "1_earth.jpg",
        "2_urbanarea.jpg",
        "3_nightview.jpg"
    ]
    let displayedNow = [
        "●  ○  ○  ○",
        "○  ●  ○  ○",
        "○  ○  ●  ○",
        "○  ○  ○  ●"
    ]
    var playOrPause: Bool = false
    var timer: Timer!
    var timer_sec: Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func enlargeImage(_ sender: Any) {
    }
    
    @IBOutlet weak var now: UILabel!
    
    @IBAction func nextImage(_ sender: Any) {
        counter += 1
        displayImage()
    }
    @IBAction func prevImage(_ sender: Any) {
        counter -= 1
        displayImage()
    }
    
    func displayImage() {
        
        if counter < 0 {
            counter = 3
        }
        if counter > 3 {
            counter = 0
        }
        
        let choose = imageArray[counter]
        let display = UIImage(named: choose)
        imageView.image = display
        now.text = displayedNow[counter]
    }
    
    @IBOutlet var unableEnlarge: UITapGestureRecognizer!
    @IBOutlet weak var hiddenNext: UIButton!
    @IBOutlet weak var hiddenPrev: UIButton!
    @IBOutlet weak var button: UIButton!
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        if timer_sec > 3 {
            timer_sec = 0
        }
        counter = timer_sec
        displayImage()
    }
    @IBAction func button(_ sender: Any) {
        playOrPause.toggle()
        if playOrPause == true {
            button.setTitle("停止", for: .normal)
            hiddenNext.isHidden = true
            hiddenPrev.isHidden = true
            hiddenNext.isEnabled = false
            hiddenPrev.isEnabled = false
            
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                
            }
        } else {
            button.setTitle("再生", for: .normal)
            hiddenNext.isHidden = false
            hiddenPrev.isHidden = false
            hiddenNext.isEnabled = true
            hiddenPrev.isEnabled = true
            
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let display = UIImage(named: "0_space.jpg")
        now.text = displayedNow[counter]
        imageView.image = display
        button.setTitle("再生", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.enlarge = imageArray[counter]
        if self.timer != nil {
                       self.timer.invalidate()
                       self.timer = nil
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if playOrPause == true {
            if self.timer == nil {
                       self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            }
        }
    }
      

}

