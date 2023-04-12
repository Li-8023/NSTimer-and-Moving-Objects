//
//  ViewController.swift
//  Lab8_Li
//
//  Created by 贺力 on 4/11/23.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer?
    var counter = 0
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var timeVal: UILabel!
    @IBOutlet weak var apple4: UIImageView!
    @IBOutlet weak var apple3: UIImageView!
    @IBOutlet weak var apple2: UIImageView!
    @IBOutlet weak var apple1: UIImageView!
    @IBOutlet weak var monkey: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.result.text = ""
        // Do any additional setup after loading the view.
        self.monkey.image = UIImage(named:"appleMonkey.jpg")
        self.apple1.image = UIImage(named:"apple.jpg")
        self.apple2.image = UIImage(named:"apple.jpg")
        self.apple3.image = UIImage(named:"apple.jpg")
        self.apple4.image = UIImage(named:"apple.jpg")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
    }


    @IBAction func down(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.y += 10
        self.monkey.frame = frame
        if(viewIntersectsView(monkey, second_View: apple1))
        {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4))
        {
            self.apple4.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3))
        {
            self.apple3.isHidden = true
        }
    }
    @IBAction func done(_ sender: Any) {
        timer?.invalidate()
        if(Int(timeVal.text ?? "") ?? 0 <= 10)
        {
            result.text = "You Win!"
        }
        else
        {
            result.text = "You lose!"
        }
    }
    @IBAction func left(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.x -= 10
        self.monkey.frame = frame
        if(viewIntersectsView(monkey, second_View: apple1))
        {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4))
        {
            self.apple4.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3))
        {
            self.apple3.isHidden = true
        }
    }
    @IBAction func right(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.x += 10
        self.monkey.frame = frame
        if(viewIntersectsView(monkey, second_View: apple1))
        {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4))
        {
            self.apple4.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3))
        {
            self.apple3.isHidden = true
        }
    }
    @IBAction func up(_ sender: Any) {
        var frame = self.monkey.frame
        frame.origin.y -= 10
        self.monkey.frame = frame
        if(viewIntersectsView(monkey, second_View: apple1))
        {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4))
        {
            self.apple4.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3))
        {
            self.apple3.isHidden = true
        }
    }
    
    @objc func count()
    {
        counter = counter + 1
        let hours = Int(counter) / 3600
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        timeVal.text  = String(format:"%02i", seconds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewIntersectsView(_ first_View: UIView, second_View:UIView) -> Bool
    {
        return first_View.frame.intersects(second_View.frame)
   }
}

