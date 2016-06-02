//
//  Common.swift
//  myphotoalbum
//
//  Created by wwll on 16/5/30.
//  Copyright © 2016年 wangshuang. All rights reserved.
//

import Foundation
import UIKit

let kWidth = UIScreen.mainScreen().bounds.width
let kHeight = UIScreen.mainScreen().bounds.height

class Common{
    static let test:String="静态做测试使用"
    let test1="动态做测试使用"
    
    class ttt: Common {
        let test4="做测试"
    }
}

class rrr: Common {
    static let test2:String="静态做测试使用"
    let test3="动态做测试使用"
}