//
//  ConfigurationViewController.swift
//  PagoEfectivoSDKSample
//
//  Created by gerardo on 30/10/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

import UIKit
import PagoEfectivoSDK
class ConfigurationViewController: UIViewController {

    @IBOutlet weak var secretKey: UITextField!
    @IBOutlet weak var accessKey: UITextField!
    @IBOutlet weak var serviceId: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnConfiguration(_ sender: UIButton) {
        let refresh = Help.createRefresh(view: self.view)
        refresh.startAnimating()
        let serviceId = Int32(self.serviceId.text!)
        PagoEfectivoSDK.config(secretKey.text , accessKey: accessKey.text, serviceId: serviceId!)
        
        let delayTime = DispatchTime.now() + 1.0
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.performSegue(withIdentifier: Global.Segue.showMainView, sender: self)
            refresh.stopAnimating()
        }
    }

}
