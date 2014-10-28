//
//  consonantCollectionViewCell.swift
//  TalkingKeyboard
//
//  Created by yue.dai on 14-10-26.
//  Copyright (c) 2014年 MiaoGoo Group. All rights reserved.
//

import UIKit

class ConsonantCollectionViewCell: PinyinPartCollectionViewCell {
    
    //TODO: replace this with block
    var viewController:ConsonantViewController!
    
    //TODO: singleton
    let pinyin = PinYin()
    
    let validConsonantCount = 23
    
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
        let consonant = pinyin.consonantAtOrder(order)
        if consonant == nil {
            return "无"
        }
        return consonant!;
    }
    
    @IBAction func consonantClickedAction(sender: UIButton) {
        //TODO: refactor this. save consonant
        var consonant = pinyin.consonantAtOrder(order)
        if consonant == nil {
            consonant = ""
        }
        
        viewController.gotoVowel(consonant!);
    }
}
