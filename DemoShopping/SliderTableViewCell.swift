//
//  SliderTableViewCell.swift
//  DemoShopping
//
//  Created by Shelly Pritchard on 15/07/18.
//  Copyright © 2018 Shelly Pritchard. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    @IBOutlet weak var containerView: UIView!
    var pageViewController: UIPageViewController!
    var pageControl: UIPageControl!
    
    var bannerIndex = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setup() -> Void {

        pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self

        
        //self.containerView.bringSubview(toFront: pcBg)
        //self.bringSubview(toFront: pageControl)

        pageViewController.view.frame = CGRect.init(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height+37)
        self.containerView.addSubview(pageViewController.view)
        
        let controller1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BannerViewController") as! BannerViewController
        controller1.pageIndex = 0
        
//        let controller2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BannerViewController") as! BannerViewController
//        controller2.pageIndex = 1
//
//        let controller3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BannerViewController") as! BannerViewController
//        controller3.pageIndex = 2
//
//        let controller4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BannerViewController") as! BannerViewController
//        controller4.pageIndex = 3
        
        
        let pages = [
            controller1
        ]
        
        
        pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true) { (result) in
            
        }
        
        
//        pageControl = UIPageControl.appearance()
//        pageControl.pageIndicatorTintColor = UIColor.darkGray
//        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
//        pageControl.backgroundColor = UIColor.init(red: 252.0/255.0, green: 47.0/255.0, blue: 141.0/255.0, alpha: 1.0)
//        pageControl.superview?.bringSubview(toFront: pageControl)
        
        let widowFrame = UIScreen.main.bounds
        
        let pcBG = UIView.init(frame: CGRect.init(x: 0, y: self.containerView.frame.size.height-70, width: widowFrame.size.width, height: 60))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = pcBG.bounds
        gradientLayer.colors = [
            UIColor.init(red: 252.0/255.0, green: 47.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor,
            UIColor.init(red: 255.0/255.0, green: 13.0/255.0, blue: 31.0/255.0, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        pcBG.layer.addSublayer(gradientLayer)
        self.contentView.addSubview(pcBG)
        
        let lbl = UILabel.init(frame: CGRect.init(x: 0, y: 5, width: pcBG.frame.size.width, height: 20))
        lbl.text = "Flat 30% discount on Hot Stone Massage"
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = UIFont(name: "HelveticaNeue", size: 14.0)
        lbl.textColor = UIColor.white

        pcBG.addSubview(lbl)
        
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: 10, width: pcBG.frame.size.width, height: 50))
        pageControl.pageIndicatorTintColor = UIColor.darkGray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.backgroundColor = UIColor.clear

        pageControl.customPageControl(dotFillColor: UIColor.white, dotBorderColor: UIColor.white, dotBorderWidth: 1.0)

        pageControl.numberOfPages = 4
        pcBG.addSubview(pageControl)
        
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! BannerViewController).pageIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil;
        }
        index = index-1
        
        return self.viewCOntrollerFOrIndex(index)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! BannerViewController).pageIndex
        if (index == NSNotFound) {
            return nil;
        }
        index = index+1;
        if (index == 4) {
            return nil;
        }
        
        return self.viewCOntrollerFOrIndex(index)

    }
    
//    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//
//        if let itemController = pendingViewControllers[0] as? BannerViewController {
//            self.pageControl.currentPage = itemController.pageIndex
//        }
//
//
//
//    }

    
    
//    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
//
//        return 4
//
//    }
//
//    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//
//
//        return bannerIndex
//
//
//    }
    
    
    func viewCOntrollerFOrIndex(_ index: Int) -> UIViewController {
        
        let controller1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BannerViewController") as! BannerViewController
        controller1.pageIndex = index
        self.pageControl.currentPage = index
        bannerIndex = index
        return controller1
        
    }

}


extension UIPageControl {
    
    func customPageControl(dotFillColor:UIColor, dotBorderColor:UIColor, dotBorderWidth:CGFloat) {
        for (pageIndex, dotView) in self.subviews.enumerated() {
            if self.currentPage == pageIndex {
                dotView.backgroundColor = dotFillColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
            }else{
                //dotView.backgroundColor = .clear
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
                dotView.layer.borderColor = dotBorderColor.cgColor
                dotView.layer.borderWidth = dotBorderWidth
            }
        }
    }
    
}

