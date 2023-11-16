//
//  BaseEx.swift
//  Calculis Aenigmate
//
//  Created by Shohzod Rajabov on 02/11/23.
//

import UIKit


struct Const {
    static let isDark = "isDark1"
    static let correct = "correct"
    static let countQuiz = "countQuiz"
    static let selectCo = "selectCo11"
    static let appId = "000000000000"  // Write App ID
    static let wd = UIScreen.main.bounds.width
}

enum Rang {
    case tifanyBack, tifanyNav, tifanyText, tifanyBroun
    
    var color: UIColor {
        switch self {
        case .tifanyBack: return UserDefaults.standard.bool(forKey: Const.isDark) ? UIColor.Rang.tifDark : UIColor.Rang.tifLight
        case .tifanyNav: return UserDefaults.standard.bool(forKey: Const.isDark) ? UIColor.Rang.tifNavLight : UIColor.Rang.tifNavLight
        case .tifanyText: return UserDefaults.standard.bool(forKey: Const.isDark) ? UIColor.Rang.tifTextLight : UIColor.Rang.tifTextDark
        case .tifanyBroun: return UserDefaults.standard.bool(forKey: Const.isDark) ? UIColor.Rang.tifBrounDark : UIColor.Rang.tifBrounLight
//        default: return UIColor.white
        }
    }
    
    
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    enum Rang {
        
        static let tifLight = UIColor.rgb(red: 209, green: 240, blue: 239)
        static let tifDark = UIColor.rgb(red: 3, green: 3, blue: 35)
        
        static let tifNavLight = UIColor.rgb(red: 85, green: 113, blue: 241)
        static let tifNavDark = UIColor.rgb(red: 10, green: 35, blue: 85)
        
        static let tifTextLight = UIColor.rgb(red: 209, green: 240, blue: 239)
        static let tifTextDark = UIColor.rgb(red: 3, green: 3, blue: 35)
        
        static let tifBrounLight = UIColor.rgb(red: 188, green: 174, blue: 190)
        static let tifBrounDark = UIColor.rgb(red: 163, green: 134, blue: 139)
        
        static let zodiacDark = UIColor.rgb(red: 2, green: 4, blue: 20)
        static let zodiaclight = UIColor.rgb(red: 218, green: 241, blue: 247)
        static let zodiacPurple = UIColor.rgb(red: 72, green: 58, blue: 88)
        static let zodiacRed = UIColor.rgb(red: 201, green: 93, blue: 99)
        
        static let zodiacGreen = UIColor.rgb(red: 152, green: 206, blue: 0)
        static let zodiacCyan = UIColor.rgb(red: 115, green: 210, blue: 222)
        static let zodiacYellow = UIColor.rgb(red: 255, green: 188, blue: 66)
        static let zodiacGray = UIColor.rgb(red: 108, green: 111, blue: 127)
        static let zodiacLink = UIColor.rgb(red: 223, green: 234, blue: 239)
        
        static let progressRed = UIColor.rgb(red: 251, green: 16, blue: 68)
        static let progressGreen = UIColor.rgb(red: 67, green: 213, blue: 82)
        static let progressPurple = UIColor.rgb(red: 70, green: 58, blue: 205)
        static let progressYellow = UIColor.rgb(red: 252, green: 196, blue: 9)
        static let progressBlue = UIColor.rgb(red: 10, green: 96, blue: 253)
        static let progressOrange = UIColor.rgb(red: 251, green: 128, blue: 7)
        static let progressGray = UIColor.rgb(red: 188, green: 186, blue: 194)
        static let bg = UIColor.rgb(red: 30, green: 34, blue: 35)
        static let logoRed = UIColor.rgb(red: 167, green: 16, blue: 35)
        
        static let tabBackground = UIColor.rgb(red: 203, green: 190, blue: 176)
        static let navBackground = UIColor.rgb(red: 159, green: 150, blue: 171)
        
        static let darkPink = UIColor.rgb(red: 235, green: 71, blue: 83)
        static let lightPink = UIColor.rgb(red: 231, green: 111, blue: 120)
        
        static let darkBlue = UIColor.rgb(red: 36, green: 79, blue: 209)
        static let lightBlue = UIColor.rgb(red: 97, green: 139, blue: 244)
        
        static let darkYellow = UIColor.rgb(red: 206, green: 169, blue: 13)
        static let lightYellow = UIColor.rgb(red: 237, green: 217, blue: 105)
        
        static let darkGreen = UIColor.rgb(red: 24, green: 182, blue: 93)
        static let lightGreen = UIColor.rgb(red: 63, green: 236, blue: 148)
        
        static let darkBack = UIColor.rgb(red: 31, green: 31, blue: 36)
        static let lightBack = UIColor.rgb(red: 222, green: 225, blue: 232)
        
        static let lightRed = UIColor.rgb(red: 240, green: 0, blue: 31)
        
        static let backgroundGray = UIColor.rgb(red: 235, green: 235, blue: 242)
        static let borderColor = UIColor.rgb(red: 189, green: 189, blue: 189)
    }
}

extension UIView {
   func roundCorners(corners:CACornerMask, radius: CGFloat) {
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = corners
   }
}

extension UIButton {
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    func flash(){
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        layer.add(flash, forKey: nil)
    }
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: nil)
    }
}

