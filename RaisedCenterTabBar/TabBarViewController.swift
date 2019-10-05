//
//  TabBarViewController.swift
//  RaisedCenterTabBar
//
//  Created by Alex Lee on 2018-04-15.
//  Copyright © 2018 Alex Lee. All rights reserved.
//

import UIKit

class TabBarTopBorderView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let offsetX: CGFloat = 25.0
        let yPos: CGFloat = 15.0
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.gray.cgColor)
        
        context.move(to: CGPoint(x: 0, y: yPos))
        context.addLine(to: CGPoint(x: rect.size.width / 2 - offsetX, y: yPos))
        
        let radius: CGFloat = (offsetX * offsetX / 13 + 13) / 2
        let startAngle = CGFloat(Double.pi / 180) * 215
        let endAngle = CGFloat(Double.pi / 180) * 325
        let center = CGPoint(x: rect.size.width / 2, y: yPos + 17)
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        context.addLine(to: CGPoint(x: rect.size.width, y: yPos))
        context.strokePath()
    }
}

extension UIDevice {
    //MARK:- iPhone
    static let iPhone4 = "iPhone 4"
    static let iPhone4s = "iPhone 4s"
    static let iPhone5 = "iPhone 5"
    static let iPhone5c = "iPhone 5c"
    static let iPhone5s = "iPhone 5s"
    static let iPhone6 = "iPhone 6"
    static let iPhone6Plus = "iPhone6 Plus"
    static let iPhone6s = "iPhone 6s"
    static let iPhone6sPlus = "iPhone6s Plus"
    static let iPhone7 = "iPhone 7"
    static let iPhone7Plus = "iPhone7 Plus"
    static let iPhoneSE = "iPhone SE"
    static let iPhone8 = "iPhone 8"
    static let iPhone8Plus = "iPhone8 Plus"
    static let iPhoneX = "iPhone X"
    static let iPhoneXS = "iPhone XS"
    static let iPhoneXSMax = "iPhoneXS Max"
    static let iPhoneXR = "iPhone XR"
    static let iPhone11 = "iPhone 11"
    static let iPhone11Pro = "iPhone 11 Pro"
    static let iPhone11ProMax = "iPhone 11 Pro Max"
    
    //MARK:- iPod
    static let iPod = "iPod"
    
    //MARK:- iPad
    static let iPad2 = "iPad2"
    static let iPad3 = "iPad3"
    static let iPad4 = "iPad4"
    static let iPadAir = "iPad Air"
    static let iPadAir2 = "iPad Air 2"
    static let iPad5 = "iPad5"
    static let iPad6 = "iPad6"
    static let iPadMini = "iPad Mini"
    static let iPadMini2 = "iPad Mini 2"
    static let iPadMini3 = "iPad Mini 3"
    static let iPadMini4 = "iPad Mini 4"
    static let iPadPro97Inch = "iPad Pro 9.7 Inch"
    static let iPadPro129Inch = "iPad Pro 12.9 Inch"
    static let iPadPro129Inch2nd = "iPad Pro 12.9 Inch 2nd Generation"
    static let iPadPro105Inch = "iPad Pro 10.5 Inch"
    
    var isIPhoneWithHomeButton: Bool {
        let homeButtonIPhoneFamily = [UIDevice.iPod, UIDevice.iPhone4, UIDevice.iPhone4s, UIDevice.iPhone5, UIDevice.iPhone5c, UIDevice.iPhone5s,
                                      UIDevice.iPhone6, UIDevice.iPhone6Plus, UIDevice.iPhone6s, UIDevice.iPhone6sPlus, UIDevice.iPhone7,
                                      UIDevice.iPhone7Plus, UIDevice.iPhoneSE, UIDevice.iPhone8, UIDevice.iPhone8Plus]
        let isHomeButtonIPhoneFamily = homeButtonIPhoneFamily.contains(modelName)
        return isHomeButtonIPhoneFamily
    }
    
    var modelName: String {
        var identifier = ""
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            identifier = simulatorModelIdentifier
            
        } else {
            var sysinfo = utsname()
            uname(&sysinfo) // ignore return value
            identifier = String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        }
        
        switch identifier {
        // For iPhone
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return UIDevice.iPhone4
        case "iPhone4,1":                               return UIDevice.iPhone4s
        case "iPhone5,1", "iPhone5,2":                  return UIDevice.iPhone5
        case "iPhone5,3", "iPhone5,4":                  return UIDevice.iPhone5c
        case "iPhone6,1", "iPhone6,2":                  return UIDevice.iPhone5s
        case "iPhone7,2":                               return UIDevice.iPhone6
        case "iPhone7,1":                               return UIDevice.iPhone6Plus
        case "iPhone8,1":                               return UIDevice.iPhone6s
        case "iPhone8,2":                               return UIDevice.iPhone6sPlus
        case "iPhone9,1", "iPhone9,3":                  return UIDevice.iPhone7
        case "iPhone9,2", "iPhone9,4":                  return UIDevice.iPhone7Plus
        case "iPhone8,4":                               return UIDevice.iPhoneSE
        case "iPhone10,1", "iPhone10,4":                return UIDevice.iPhone8
        case "iPhone10,2", "iPhone10,5":                return UIDevice.iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                return UIDevice.iPhoneX
        case "iPhone11,2":                              return UIDevice.iPhoneXS
        case "iPhone11,4", "iPhone11,6":                return UIDevice.iPhoneXSMax
        case "iPhone11,8":                              return UIDevice.iPhoneXR
        case "iPhone12,1":                              return UIDevice.iPhone11
        case "iPhone12,3":                              return UIDevice.iPhone11Pro
        case "iPhone12,5":                              return UIDevice.iPhone11ProMax
            
        // For iPod
        case "iPod1,1", "iPod2,1", "iPod3,1", "iPod4,1", "iPod5,1", "iPod7,1", "iPod9,1": return UIDevice.iPod
            
        // For iPad
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return UIDevice.iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":           return UIDevice.iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":           return UIDevice.iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":           return UIDevice.iPadAir
        case "iPad5,3", "iPad5,4":                      return UIDevice.iPadAir2
        case "iPad6,11", "iPad6,12":                    return UIDevice.iPad5
        case "iPad7,5", "iPad7,6":                      return UIDevice.iPad6
        case "iPad2,5", "iPad2,6", "iPad2,7":           return UIDevice.iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":           return UIDevice.iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":           return UIDevice.iPadMini3
        case "iPad5,1", "iPad5,2":                      return UIDevice.iPadMini4
        case "iPad6,3", "iPad6,4":                      return UIDevice.iPadPro97Inch
        case "iPad6,7", "iPad6,8":                      return UIDevice.iPadPro129Inch
        case "iPad7,1", "iPad7,2":                      return UIDevice.iPadPro129Inch2nd
        case "iPad7,3", "iPad7,4":                      return UIDevice.iPadPro105Inch
        default:
            return identifier
        }
    }
}

class TabBarViewController: UITabBarController {
    private var tabBarExtraHeight: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        adjustTabBarItemsPosition()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tabBarHeight = updatedTabBarHeight(fromTabBarHeight: tabBar.frame.height)
        
        var newFrame = tabBar.frame
        newFrame.size.height = tabBarHeight
        newFrame.origin.y = view.frame.size.height - tabBarHeight
        
        tabBar.frame = newFrame
    }
    
    private func updatedTabBarHeight(fromTabBarHeight height: CGFloat) -> CGFloat {
        return height + tabBarExtraHeight
    }
    
    private func setupUI() {
        hideTabBarBorder()
        
        let borderView = TabBarTopBorderView()
        tabBar.addSubview(borderView)
        borderView.backgroundColor = .white
        
        borderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            borderView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            borderView.widthAnchor.constraint(equalTo: tabBar.widthAnchor),
            borderView.heightAnchor.constraint(equalTo: tabBar.heightAnchor)
            ])
        
        makeMaskTopAreaOfTabBar()
    }
    
    private func makeMaskTopAreaOfTabBar() {
        let yPos: CGFloat = 15.0 - 1
        let rect = tabBar.bounds
        let offsetX: CGFloat = 25.0
        
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: yPos))
        path.addLine(to: CGPoint(x: rect.width / 2 - offsetX, y: yPos))
        
        // https://www.raywenderlich.com/33193/core-graphics-tutorial-arcs-and-paths
        // http://www.mathopenref.com/chordsintersecting.html
        let radius: CGFloat = (offsetX * offsetX / 13 + 13 ) / 2
        let startAngle = CGFloat(Double.pi / 180) * 215
        let endAngle = CGFloat(Double.pi / 180) * 325
        let center = CGPoint(x: rect.size.width / 2, y: yPos + 17)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.addLine(to: CGPoint(x: rect.width / 2 + offsetX, y: yPos))
        path.addLine(to: CGPoint(x: rect.width, y: yPos))
        let tabBarHeight = updatedTabBarHeight(fromTabBarHeight: tabBar.frame.height)
        path.addLine(to: CGPoint(x: rect.width, y: tabBarHeight))
        path.addLine(to: CGPoint(x: 0, y: tabBarHeight))
        path.close()
        
        layer.path = path.cgPath
        layer.fillRule = kCAFillRuleEvenOdd
        
        tabBar.layer.mask = layer
    }
    
    private func adjustTabBarItemsPosition() {
        let titleOffsetY: CGFloat = 4.0
        let imageOffsetY: CGFloat = 7.0
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -titleOffsetY)
        
        tabBar.items?.forEach({ (item) in
            item.imageInsets = UIEdgeInsetsMake(imageOffsetY, 0, -imageOffsetY, 0)
        })
    }
    
    private func hideTabBarBorder() {
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.layer.masksToBounds = true
    }
}

