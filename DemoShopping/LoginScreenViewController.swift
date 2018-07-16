//
//  LoginScreenViewController.swift
//  DemoShopping
//
//  Created by Shelly Pritchard on 15/07/18.
//  Copyright © 2018 Shelly Pritchard. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    
    @IBOutlet weak var vwUsername: UIView!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var vwPAssword: UIView!
    @IBOutlet weak var vwRegister: UIView!
    
    @IBOutlet weak var vwFb: UIView!
    @IBOutlet weak var vwGoogle: UIView!
    
    @IBOutlet weak var btnForgot: UIButton!
    
    @IBOutlet weak var txtVwUsername: UITextField!
    @IBOutlet weak var txtVwEmail: UITextField!
    @IBOutlet weak var txtVwPassword: UITextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func setup() -> Void {
        
        vwUsername.layer.cornerRadius = self.vwUsername.frame.size.height/2
        vwUsername.layer.borderColor = UIColor.black.cgColor
        vwUsername.layer.borderWidth = 1.0
        
        vwEmail.layer.cornerRadius = self.vwEmail.frame.size.height/2
        vwEmail.layer.borderColor = UIColor.black.cgColor
        vwEmail.layer.borderWidth = 1.0
        
        vwPAssword.layer.cornerRadius = self.vwPAssword.frame.size.height/2
        vwPAssword.layer.borderColor = UIColor.black.cgColor
        vwPAssword.layer.borderWidth = 1.0
        
        vwRegister.layer.cornerRadius = self.vwRegister.frame.size.height/2
        vwRegister.layer.borderColor = UIColor.black.cgColor
        vwRegister.layer.borderWidth = 1.0
        
        
        
        let gradientLayer = CAGradientLayer()
        
        var gradBount = vwRegister.bounds
        gradBount.size.width = self.view.frame.width - 50
        gradientLayer.frame = gradBount
        gradientLayer.colors = [
            UIColor.init(red: 252.0/255.0, green: 47.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor,
            UIColor.init(red: 255.0/255.0, green: 13.0/255.0, blue: 31.0/255.0, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = vwRegister.frame.size.height/2
        vwRegister.layer.addSublayer(gradientLayer)

        
        vwFb.layer.cornerRadius = self.vwFb.frame.size.height/2
        vwFb.layer.borderColor = UIColor.init(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0).cgColor
        vwFb.layer.borderWidth = 1.0

        vwGoogle.layer.cornerRadius = self.vwGoogle.frame.size.height/2
        vwGoogle.layer.borderColor = UIColor.init(red: 221.0/255.0, green: 75.0/255.0, blue: 57.0/255.0, alpha: 1.0).cgColor
        vwGoogle.layer.borderWidth = 1.0

        
        txtVwUsername.setValue(UIColor.init(red: 252.0/255.0, green: 48.0/255.0, blue: 139.0/255.0, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        txtVwEmail.setValue(UIColor.init(red: 252.0/255.0, green: 48.0/255.0, blue: 139.0/255.0, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        txtVwPassword .setValue(UIColor.init(red: 252.0/255.0, green: 48.0/255.0, blue: 139.0/255.0, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(navigateToHomeScreen))
        vwRegister.addGestureRecognizer(gesture)

    }
    
    @objc func navigateToHomeScreen() -> Void {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        app.navigateToHome()
        
        
    }

}
