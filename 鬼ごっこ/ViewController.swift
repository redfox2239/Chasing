//
//  ViewController.swift
//  鬼ごっこ
//
//  Created by HARADA REO on 2015/07/24.
//  Copyright (c) 2015年 reo harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImage: UIImageView!
    var timer: NSTimer!
    @IBOutlet weak var catchLabel: UILabel!
    @IBOutlet weak var oneMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveImage", userInfo: nil, repeats: true)
        self.catchLabel.hidden = true
        self.oneMoreButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func moveImage(){
        let randomNumber = arc4random() % 8
        if(randomNumber == 0){
            // 右に動く
            self.moveRight()
        }
        else if(randomNumber == 1){
            // 左に動く
            self.moveLeft()
        }
        else if(randomNumber == 2){
            // 上に動く
            self.moveUp()
        }
        else if(randomNumber == 3){
            // 下に動く
            self.moveDown()
        }
        else if(randomNumber == 4){
            // 右上斜め
            self.moveRightUp()
        }
        else if(randomNumber == 5){
            // 左上斜め
            self.moveLeftUp()
        }
        else if(randomNumber == 6){
            // 右下斜め
            self.moveRightDown()
        }
        else if(randomNumber == 7){
            // 左下斜め
            self.moveLeftDown()
        }
    }
    
    func moveRight(){
        if(self.dogImage.frame.origin.x < 240){
            UIView.animateWithDuration(1.0, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.x += 100
            }, completion: { (Bool) -> Void in
                
            })
        }else{
            //self.moveLeft()
        }
    }
    
    func moveLeft(){
        if(self.dogImage.frame.origin.x > -110){
            UIView.animateWithDuration(1.0, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.x -= 100
                }, completion: { (Bool) -> Void in
                    
            })
        }else{
            self.moveRight()
        }
    }

    func moveUp(){
        if(self.dogImage.frame.origin.y > -50){
            UIView.animateWithDuration(1.0, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.y -= 100
                }, completion: { (Bool) -> Void in
                    
            })
        }else{
            self.moveDown()
        }
    }
    
    func moveDown(){
        if(self.dogImage.frame.origin.y < 520){
            UIView.animateWithDuration(1.0, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.y += 100
                }, completion: { (Bool) -> Void in
                    
            })
        }else{
            self.moveUp()
        }
    }

    func moveRightUp(){
        if(self.dogImage.frame.origin.y > -50 && self.dogImage.frame.origin.x < 240){
            UIView.animateWithDuration(0.5, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.x += 100
                self.dogImage.frame.origin.y -= 100
                }, completion: { (Bool) -> Void in
                    
            })
        }
    }

    func moveLeftUp(){
        if(self.dogImage.frame.origin.y > -50 && self.dogImage.frame.origin.x > -110){
            UIView.animateWithDuration(0.5, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.x -= 100
                self.dogImage.frame.origin.y -= 100
                }, completion: { (Bool) -> Void in
                    
            })
        }
    }

    func moveRightDown(){
        if(self.dogImage.frame.origin.y < 520 && self.dogImage.frame.origin.x < 240){
            UIView.animateWithDuration(0.5, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.x += 100
                self.dogImage.frame.origin.y += 100
                }, completion: { (Bool) -> Void in
                    
            })
        }
    }

    func moveLeftDown(){
        if(self.dogImage.frame.origin.y < 520 && self.dogImage.frame.origin.x > -50){
            UIView.animateWithDuration(0.5, delay: 0, options: .AllowUserInteraction, animations: { () -> Void in
                self.dogImage.frame.origin.x -= 100
                self.dogImage.frame.origin.y += 100
                }, completion: { (Bool) -> Void in
                    
            })
        }
    }

    @IBAction func tapDogImage(sender: AnyObject) {
        self.catchLabel.hidden = false
        self.oneMoreButton.hidden = false
        self.timer.invalidate()
    }
    
    @IBAction func tapOneMoreButton(sender: AnyObject) {
        self.catchLabel.hidden = true
        self.oneMoreButton.hidden = true
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchPosition = touch!.locationInView(self.view)
        
        let layer = self.dogImage.layer.presentationLayer()! as! CALayer
        
        let minX = layer.position.x - CGRectGetWidth(self.dogImage.frame)/2
        let maxX = layer.position.x + CGRectGetWidth(self.dogImage.frame)/2
        let minY = layer.position.y - CGRectGetHeight(self.dogImage.frame)/2
        let maxY = layer.position.y + CGRectGetHeight(self.dogImage.frame)/2
        
        if(touchPosition.x > minX && touchPosition.x < maxX){
            if(touchPosition.y > minY && touchPosition.y < maxY){
                self.catchLabel.hidden = false
                self.oneMoreButton.hidden = false
                self.timer.invalidate()
            }
        }
    }
}

