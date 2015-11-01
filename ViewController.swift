//
//  ViewController.swift
//  MusicGame
//
//  Created by 篠田弥樹 on 2015/08/03.
//  Copyright (c) 2015年 篠田弥樹. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    //@IBOutlet var kakushiLabel: UILabel!
    //@IBOutlet var kaisuLabel: UILabel!
    //@IBOutlet var tyuuiLabel: UILabel!
    //@IBOutlet var imageView: UIImageView!
    //@IBOutlet var taimaLabel: UILabel!
    
    //var kazu: Int = 0
    var hantei1: Int = 0
    var hantei2: Int = 0
    var hantei3: Int = 0
    var hantei4: Int = 0
    var hantei5: Int = 0
    var hantei6: Int = 0
    var hantei7: Int = 0
    var hantei8: Int = 0
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    var speed: Float = 0.0
    var label: UILabel!
    
//    var nisespeed: Float = 0.0
//    var niselabel: UILabel!
    
//    var takaraspeed: Float = 0.0
//    var takaralabel: UILabel!
    
    var audio:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,target: self,selector: Selector("up"),userInfo: nil,repeats: true)
        }
        
        label = UILabel(frame: CGRectMake(0, 0, 50, 50))
        label.text = ""
        label.font = UIFont.systemFontOfSize(50)
        label.backgroundColor = UIColor.clearColor()
        self.view.addSubview(label)
        
//        niselabel = UILabel(frame: CGRectMake(0, 0, 50, 50))
//        niselabel.text = ""
//        niselabel.font = UIFont.systemFontOfSize(50)
//        niselabel.textColor = UIColor.redColor()
//        niselabel.backgroundColor = UIColor.clearColor()
//        self.view.addSubview(niselabel)
        
//        takaralabel = UILabel(frame: CGRectMake(0, 0, 25, 25))
//        takaralabel.text = ""
//        takaralabel.font = UIFont.systemFontOfSize(50)
//        takaralabel.textColor = UIColor.yellowColor()
//        takaralabel.backgroundColor = UIColor.clearColor()
//        self.view.addSubview(takaralabel)
        
        var appframe: CGRect = UIScreen.mainScreen().applicationFrame
        speed = Float(appframe.size.height) / 0.9
        
//        nisespeed = Float(appframe.size.height) / 0.7
//        
//        takaraspeed = Float(appframe.size.height) / 0.1
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sc01", ofType: "mp3")!)
        audio = AVPlayer(URL: audioPath)
        audio.play()
    }

    func up() {
        count = count + 0.01
        timeLabel.text = String(format:"%.2f" , count)
        
        if 2.0 - 1.2 <= count  && 5.0 - 1.2 >= count {
            label.text = "◼︎"
            var y:Float = (count - 3.0 + 1.2) * speed - 75
            label.frame = CGRectMake(135, CGFloat(y), 50, 50)
        }
//        else if 5.0 - 1.2 <= count && 8.0 - 1.2 >= count {
//            niselabel.text = "▲"
//            var y:Float = (count - 6.0 + 1.2) * nisespeed - 75
//            niselabel.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
//        else if 8.0 - 1.2 <= count && 11.0 - 1.2 >= count {
//            label.text = "⚫️"
//            var y:Float = (count - 9.0 + 1.2) * speed - 75
//            label.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
        
//        else if 11.0 - 1.2 <= count && 14.0 - 1.2 >= count {
//            label.text = "▲"
//            var y:Float = (count - 12.0 + 1.2) * speed - 75
//            label.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
        
//        else if 14.0 - 1.2 <= count && 17.0 - 1.2 >= count {
//            takaralabel.text = "◼︎"
//            var y:Float = (count - 15.0 + 1.2) * takaraspeed - 75
//            takaralabel.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
        
//        else if 17.0 - 1.2 <= count && 20.0 - 1.2 >= count {
//            label.text = "⚫️"
//            var y:Float = (count - 18.0 + 1.2) * speed - 75
//            label.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
        
//        else if 20.0 - 1.2 <= count && 23.0 - 1.2 >= count {
//            niselabel.text = "◼︎"
//            var y:Float = (count - 21.0 + 1.2) * nisespeed - 75
//            niselabel.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
        
//        else if 23.0 - 1.2 <= count && 26.0 - 1.2 >= count {
//            niselabel.text = "◼︎"
//            var y:Float = (count - 24.0 + 1.2) * nisespeed - 75
//            niselabel.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
        
//        else if 26.0 - 1.2 <= count {
//            label.text = "◼︎"
//            var y:Float = (count - 27.0 + 1.2) * speed - 75
//            label.frame = CGRectMake(135, CGFloat(y), 50, 50)
//        }
    }
    
    func hantei(number: Float) -> String {
        
        if count > number - 0.20 && count < number + 0.20 {
            return "PERFECT!"
        } else if count > number - 0.30 && count < number + 0.30 {
            return "GREAT!"
        } else if count > number - 0.50 && count < number + 0.50 {
            return "GOOD!"
        } else {
            return "BAD"
        }
    }
    
//    func nisehantei(number: Float) -> String {
//        
//        if count > number - 0.50 && count < number + 0.50 {
//            return "Regrettable"
//        } else {
//            return ""
//        }
//    }
//    
//    func takarahantei(number: Float) -> String {
//        
//        if count > number - 0.10 {
//            return "Splendid!!"
//        } else {
//            return ""
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func kaisuu() {
//        
//        kazu = kazu + 1
//        kaisuLabel.text = String(kazu)
//        if 2 < kazu && 5 > kazu {
//            tyuuiLabel.text = "押しすぎです"
//        } else if 4 < kazu && 7 > kazu {
//            tyuuiLabel.text = "押しすぎ"
//        } else if 6 < kazu && 9 > kazu {
//            tyuuiLabel.text = "話聞け"
//        } else if 8 < kazu {
//            tyuuiLabel.text = "因果応報"
//            audio.pause()
//            imageView.image = UIImage(named:"bakuhatu.jpg")
//            timer.invalidate()
//            kakushiLabel.text = ""
//            label.text = ""
//            hanteiLabel.text = ""
//            kaisuLabel.text = ""
//        }
//    }
    
    @IBAction func pushButton() {
//        if hanteiLabel.text != "Regrettable" {
        
             2.0 - 1.2 <= count  && 5.0 - 1.2 >= count
                hanteiLabel.text = self.hantei(3.0)
//                self.kaisuu()
            
//            else if 5.0 - 1.2 <= count && 8.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei1 == 0 {
//                    kazu = 0
//                }
//                hantei1 = hantei1 + 1
//                hanteiLabel.text = self.nisehantei(6.0)
//                self.kaisuu()
//            }
//            else if 8.0 - 1.2 <= count && 11.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei2 == 0 {
//                    kazu = 0
//                }
//                hantei2 = hantei2 + 1
//                hanteiLabel.text = self.hantei(9.0)
//                self.kaisuu()
//            }
//            else if 11.0 - 1.2 <= count && 14.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei3 == 0 {
//                    kazu = 0
//                }
//                hantei3 = hantei3 + 1
//                hanteiLabel.text = self.hantei(12.0)
//                self.kaisuu()
//            }
//            else if 14.0 - 1.2 <= count && 17.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei4 == 0 {
//                    kazu = 0
//                }
//                hantei4 = hantei4 + 1
//                kakushiLabel.text = self.takarahantei(15.0)
//                self.kaisuu()
//            }
//            else if 17.0 - 1.2 <= count && 20.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei5 == 0 {
//                    kazu = 0
//                }
//                hantei5 = hantei5 + 1
//                hanteiLabel.text = self.hantei(18.0)
//                self.kaisuu()
//            }
//            else if 20.0 - 1.2 <= count && 23.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei6 == 0 {
//                    kazu = 0
//                }
//                hantei6 = hantei6 + 1
//                hanteiLabel.text = self.nisehantei(21.0)
//                self.kaisuu()
//            }
//            else if 23.0 - 1.2 <= count && 26.0 - 1.2 >= count {
//                tyuuiLabel.text = ""
//                if hantei7 == 0 {
//                    kazu = 0
//                }
//                hantei7 = hantei7 + 1
//                hanteiLabel.text = self.nisehantei(24.0)
//                self.kaisuu()
//            }
//            else if 26.0 - 1.2 <= count {
//                tyuuiLabel.text = ""
//                if hantei8 == 0 {
//                    kazu = 0
//                }
//                hantei8 = hantei8 + 1
//                hanteiLabel.text = self.hantei(27.0)
//                self.kaisuu()
//                audio.pause()
//                if timer.valid {
//                    timer.invalidate()
//                }
//            }
        }
//    }

//    @IBAction func yarinaoshi() {
//        count = 0.0
//        timeLabel.text = String(format:"%.2f" , count)
//        
//        if !timer.valid {
//            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,target: self,selector: Selector("up"),userInfo: nil,repeats: true)
//        }
//        kakushiLabel.text = ""
//        kazu = 0
//        label.text = ""
//        hanteiLabel.text = ""
//        kaisuLabel.text = ""
//        tyuuiLabel.text = ""
//        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sc01", ofType: "mp3")!)
//        audio = AVPlayer(URL: audioPath)
//        audio.play()
//    }
}