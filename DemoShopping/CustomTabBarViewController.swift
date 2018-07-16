//
//  CustomTabBarViewController.swift
//  Genie
//
//  Created by Todor Brachkov on 11/11/2015.
//  Copyright © 2015 Nodes. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    static let newTabBarHeight:CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabBar()
        self.delegate = self
        
        self.addCenterButton()
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.view.setNeedsLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        
//        let newTabBarY = self.tabBar.frame.origin.y + (self.tabBar.frame.height - CustomTabBarViewController.newTabBarHeight)
//     self.tabBar.frame.height = CustomTabBarViewController.newTabBarHeight
//        self.tabBar.frame.y = newTabBarY
//
//        var tabFrame = self.tabBar.frame
//        tabFrame.size.height = CustomTabBarViewController.newTabBarHeight
//        tabFrame.origin.y = newTabBarY
//        self.tabBar.frame = tabFrame

        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    func setupTabBar() {
        
        self.edgesForExtendedLayout = UIRectEdge.bottom
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        UITabBar.appearance().shadowImage = UIImage()
        
        let attributesTab = [
            NSAttributedStringKey.foregroundColor: UIColor(white: 0.0, alpha: 0.4),
            NSAttributedStringKey.font : UIFont(name: "HelveticaNeue", size: 11)!
        ]
        let selectedAttributesTab = [
            NSAttributedStringKey.foregroundColor: UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0),
            NSAttributedStringKey.font : UIFont(name: "HelveticaNeue", size: 11)!
        ]

        UITabBarItem.appearance().setTitleTextAttributes(attributesTab, for: UIControlState())
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributesTab, for: UIControlState.selected)

        var controllers = [UIViewController]()

        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let nc1 = UINavigationController.init(rootViewController: vc1)
        nc1.setNavigationBarHidden(true, animated: false)
        if let icon = UIImage(named: "home") {
            nc1.tabBarItem.title = "Home"
            nc1.tabBarItem.selectedImage = icon.imageWithColor(UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            nc1.tabBarItem.image = icon.imageWithColor(UIColor(white: 0.0, alpha: 0.4)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        controllers.append(nc1)

        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ServiceViewController") as! ServiceViewController
        
        let nc2 = UINavigationController.init(rootViewController: vc2)
        nc2.setNavigationBarHidden(true, animated: false)
        if let icon = UIImage(named: "service") {
            nc2.tabBarItem.title = "Service"
            nc2.tabBarItem.selectedImage = icon.imageWithColor(UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            nc2.tabBarItem.image = icon.imageWithColor(UIColor(white: 0.0, alpha: 0.4)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        controllers.append(nc2)

        let vc3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        let nc3 = UINavigationController.init(rootViewController: vc3)
        nc3.setNavigationBarHidden(true, animated: false)
        /*
        if let icon = UIImage(named: "center") {
            nc3.tabBarItem.title = "     "
            nc3.tabBarItem.selectedImage = icon.imageWithColor(UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            nc3.tabBarItem.image = icon.imageWithColor(UIColor(white: 0.0, alpha: 0.4)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        */
        
        controllers.append(nc3)

        let vc4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TherapistViewController") as! TherapistViewController
        let nc4 = UINavigationController.init(rootViewController: vc4)
        nc4.setNavigationBarHidden(true, animated: false)
        if let icon = UIImage(named: "therapist") {
            nc4.tabBarItem.title = "Therapist"
            nc4.tabBarItem.selectedImage = icon.imageWithColor(UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            nc4.tabBarItem.image = icon.imageWithColor(UIColor(white: 0.0, alpha: 0.4)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        controllers.append(nc4)

        let vc5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        let nc5 = UINavigationController.init(rootViewController: vc5)
        nc5.setNavigationBarHidden(true, animated: false)

        if let icon = UIImage(named: "message") {
            nc5.tabBarItem.title = "Message"
            nc5.tabBarItem.selectedImage = icon.imageWithColor(UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            nc5.tabBarItem.image = icon.imageWithColor(UIColor(white: 0.0, alpha: 0.4)).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        controllers.append(nc5)

        self.viewControllers = controllers
        self.selectedIndex = 0

    }
    
    
    func addCenterButton() -> Void {
        

        let paddingBottom : CGFloat = 20.0
        
        let button = UIButton(type: .custom)
        button.autoresizingMask = [.flexibleRightMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin]
        button.frame = CGRect.init(x: 0.0, y: 0.0, width: 50.0, height: 50.0)


        //button.backgroundColor = UIColor.init(red: 255.0/255.0, green: 23.0/255.0, blue: 45.0/255.0, alpha: 1.0)

        
        let rectBoundTabbar = self.tabBar.bounds
        let xx = rectBoundTabbar.midX
        let yy = rectBoundTabbar.midY - paddingBottom
        button.center = CGPoint(x: xx, y: yy)
        

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = button.bounds
        gradient.colors = [
            UIColor.init(red: 252.0/255.0, green: 47.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor,
            UIColor.init(red: 255.0/255.0, green: 13.0/255.0, blue: 31.0/255.0, alpha: 1.0).cgColor
        ]
        gradient.cornerRadius = button.frame.size.height/2

        gradient.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint.init(x: 1.0, y: 0.5)

        
        button.layer.insertSublayer(gradient, at: 0)
        
        button.setImage(UIImage.init(named: "center"), for: .normal)
        button.bringSubview(toFront: button.imageView!)
        
        self.tabBar.addSubview(button)
        self.tabBar.bringSubview(toFront: button)

    }
    
}

extension UIImage {
    func imageWithColor(_ tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
