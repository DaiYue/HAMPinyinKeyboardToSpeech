//
//  vowelCollectionViewCell.swift
//  TalkingKeyboard
//
//  Created by yue.dai on 14-10-26.
//  Copyright (c) 2014年 MeowGoo Group. All rights reserved.
//

import UIKit

class VowelCollectionViewCell: PinyinPartCollectionViewCell {
    
    //TODO: replace this with block
    weak var viewController:VowelViewController!
    
    //TODO: singleton
    let pinyin = PinYin()
    
    func initData () {
    }
    
    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initData()
    }
    
    override func textAtOrder(order: Int) -> String {
        let vowel = pinyin.vowelAtOrder(order)
        if vowel == nil {
            return "?"
        }
        return vowel!;
    }
    
    @IBAction func vowelPulledAction(sender: AnyObject, forEvent event: UIEvent) {
        let touchSet = event.touchesForView(sender as UIView)
        if touchSet == nil {
            return
        }
        let touch = touchSet?.anyObject() as UITouch
        let touchLocation = touch.locationInView(self)
        
        let tone = pulledDirection(touchLocation: touchLocation, frameSize: self.frame.size)
        
        let vowel = pinyin.vowelAtOrder(sender.tag)!
        
        viewController.readAndGotoConsonant(vowel: vowel, tone: tone)
    }
    
    //1 - up 2 - right 3 - down 4 - left 5 - none
    //TODO: replace this with enum
    func pulledDirection(#touchLocation:CGPoint, frameSize:CGSize) -> String {
        let horizontalOffset = offsetFromRange(target: touchLocation.x, rangeStart: 0, rangeEnd: frameSize.width)
        let verticalOffset = offsetFromRange(target: touchLocation.y, rangeStart: 0, rangeEnd: frameSize.height)
        
        if fabs(horizontalOffset) < 0.1 && fabs(verticalOffset) < 0.1 {
            return "5"
        }
        
        if fabs(horizontalOffset) >= fabs(verticalOffset) {
            return horizontalOffset > 0 ? "2" : "4"
        }
        return verticalOffset > 0 ? "3" : "1"
    }
    
    func offsetFromRange(#target:CGFloat, rangeStart: CGFloat, rangeEnd: CGFloat) -> CGFloat{
        var start:CGFloat, end:CGFloat
        if rangeStart <= rangeEnd {
            start = rangeStart
            end = rangeEnd
        } else {
            start = rangeEnd
            end = rangeStart
        }
        
        if target >= start && target <= end {
            return 0
        }
        if target > end {
            //bigger - positive
            return target - end
        }
        //smaller - negative
        return target - start
    }
}
