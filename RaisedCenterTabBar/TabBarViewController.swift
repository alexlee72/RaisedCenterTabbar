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

class TabBarViewController: UITabBarController {

    private let tabBarHeight: CGFloat = 68.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        adjustTabBarItemsPosition()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var newFrame = tabBar.frame
        newFrame.size.height = tabBarHeight
        newFrame.origin.y = view.frame.size.height - tabBarHeight
        
        tabBar.frame = newFrame
    }
    
    private func setupUI() {
        hideTabBarBorder()
        
        let borderView = TabBarTopBorderView()
        borderView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: tabBarHeight)
        borderView.backgroundColor = UIColor.white
        tabBar.addSubview(borderView)
    
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
        path.addLine(to: CGPoint(x: rect.width, y: tabBarHeight))
        path.addLine(to: CGPoint(x: 0, y: tabBarHeight))
        path.close()
        
        layer.path = path.cgPath
        layer.fillRule = kCAFillRuleEvenOdd
        
        tabBar.layer.mask = layer
    }
    
    private func adjustTabBarItemsPosition() {
        let titleOffsetY: CGFloat = 4.0
        let imageOffsetY: CGFloat = 6.0
        
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
