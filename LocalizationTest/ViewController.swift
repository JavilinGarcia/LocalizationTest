//
//  ViewController.swift
//  LocalizationTest
//
//  Created by Javier Garcia Castro on 21/3/18.
// Copyright © 2018 Javier Garcia Castro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = NSLocalizedString("welcome", comment: "")
        
        let langStr = Locale.current.languageCode
        
        let when = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            if langStr == "es" {
                self.changeIcon(to: "AppIcon-2")
            }
            else {
                self.changeIcon(to: nil)
            }
        }
    }

    func changeIcon(to name: String?) {
        //Check if the app supports alternating icons
        guard UIApplication.shared.supportsAlternateIcons else {
            return;
        }
        
        //Change the icon to a specific image with given name
        UIApplication.shared.setAlternateIconName(name) { (error) in
            //After app icon changed, print our error or success message
            if let error = error {
                print("App icon failed to due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully.")
            }
        }
    }

}

