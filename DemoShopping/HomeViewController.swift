//
//  ViewController.swift
//  DemoShopping
//
//  Created by Shelly Pritchard on 14/07/18.
//  Copyright © 2018 Shelly Pritchard. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var lblhome: UILabel!
    @IBOutlet weak var btnNotificationBell: UIButton!
    
    
    var gradientLayer: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        createGradientLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        for subView in view.subviews {
            if  subView is  UIPageControl {
                subView.frame.origin.y = self.view.frame.size.height - 164
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createGradientLayer() {

        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.navigationView.bounds
        gradientLayer.colors = [
            UIColor.init(red: 252.0/255.0, green: 47.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor,
            UIColor.init(red: 255.0/255.0, green: 13.0/255.0, blue: 31.0/255.0, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        self.navigationView.layer.addSublayer(gradientLayer)
    
        self.navigationView.bringSubview(toFront: btnMenu)
        self.navigationView.bringSubview(toFront: lblhome)
        self.navigationView.bringSubview(toFront: btnNotificationBell)
        
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
        if let cell: SliderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell") as? SliderTableViewCell{

            return cell
        }
        else {
            return UITableViewCell()
        }
        }
        else {
            
            if let cell: FeatureTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeatureTableViewCell") as? FeatureTableViewCell{
                
                
                if indexPath.row == 1 {
                    cell.lblTitle.text = "FEATURED SERVICES"
                    cell.imgPic.image = UIImage(named: "massage")
                }
                else {
                    cell.lblTitle.text = "FEATURED SALON"
                    cell.imgPic.image = UIImage(named: "salon")

                }
                
                cell.containerVw.layer.cornerRadius = 15.0;
                cell.containerVw.layer.borderColor = UIColor.lightGray.cgColor
                cell.containerVw.layer.borderWidth = 0.4
                cell.containerVw.layer.shadowColor = UIColor.lightGray.cgColor
                cell.containerVw.layer.shadowOpacity = 0.5
                cell.containerVw.layer.shadowOffset = CGSize.init(width: 0, height: 2)
                cell.containerVw.layer.shadowRadius = 5.0
                

                let gradientLayer = CAGradientLayer()
                gradientLayer.frame = cell.btnRs.bounds
                gradientLayer.colors = [
                    UIColor.init(red: 252.0/255.0, green: 47.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor,
                    UIColor.init(red: 255.0/255.0, green: 13.0/255.0, blue: 31.0/255.0, alpha: 1.0).cgColor
                ]
                gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
                gradientLayer.cornerRadius = cell.btnRs.frame.size.height/2
                cell.btnRs.layer.addSublayer(gradientLayer)
                cell.btnRs.backgroundColor = UIColor.clear
                

                return cell
            }
            else {
                return UITableViewCell()
            }

            
            
        }
        
    }
    
}

