//
//  RandomColor.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/19.
//

import Foundation
import UIKit

struct Helper {
    
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0...1) // 如果不需要透明度，可以將 alpha 設定為 1
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

