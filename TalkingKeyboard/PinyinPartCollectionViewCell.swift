//
//  PinyinPartCollectionViewCell.swift
//  TalkingKeyboard
//
//  Created by yue.dai on 14-10-26.
//  Copyright (c) 2014年 MeowGoo Group. All rights reserved.
//

import UIKit

class PinyinPartCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pinyinPartButton: UIButton!
    
    var order : Int!
    
    func setText(pinyinPart:String){
        //scale font
        let length = countElements(pinyinPart)
        var font : UIFont
        if length <= 1{
            font = UIFont.systemFontOfSize(120)
        } else if length <= 2 {
            font = UIFont.systemFontOfSize(80)
        } else if length <= 3  {
            font = UIFont.systemFontOfSize(60)
        } else {
            font = UIFont.systemFontOfSize(50)
        }
        pinyinPartButton.titleLabel?.font = font
        
        //set text
        pinyinPartButton.setTitle(pinyinPart, forState:UIControlState.Normal)
    }

    func textAtOrder(order:Int) -> String{
        println("Warning - should override func textOfOrder")
        return ""
    }
    
    func setPinyinPartOrder(order:Int) {
        self.order = order
        
        pinyinPartButton.tag = order
        
        let pinyinPart = textAtOrder(order)
        setText(pinyinPart)
    }
    
}
