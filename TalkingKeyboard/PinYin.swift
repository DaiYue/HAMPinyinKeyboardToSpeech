//
//  PinYin.swift
//  TalkingKeyboard
//
//  Created by yue.dai on 14/10/28.
//  Copyright (c) 2014年 MiaoGoo Group. All rights reserved.
//

import UIKit

class PinYin: NSObject {
    let vowelArray = ["a", "e", "i", "o", "u", "v", "ai", "an", "ao", "ei", "en", "er", "ia", "ie", "in", "iu", "ou", "ua", "ue", "ui", "un", "uo", "ian", "iao", "uai", "uan", "ang", "eng", "ing", "ong", "iang", "uang", "iong"]
    
    let consonantArray = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "w", "x", "y", "z", "ch", "sh", "zh", ""]
   
    func vowelAtOrder(order: Int) -> String?{
        return partAtOrder(order: order, array: vowelArray)
    }
    
    func consonantAtOrder(order: Int) -> String?{
        return partAtOrder(order: order, array: consonantArray)
    }
    
    func partAtOrder(#order: Int, array: Array<String>) -> String?{
        if (order < array.count) {
            return array[order]
        }
        return nil
    }
}
