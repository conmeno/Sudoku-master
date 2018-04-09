//
//  AdManagerView.swift
//  Gummy Fighter
//
//  Created by Phuong Nguyen on 2/4/16.
//  Copyright © 2016 PhuongNguyen. All rights reserved.
//

import Foundation
import UIKit



class AdManagerView: UIViewController
{
    
    
    //    var isAd1 = true//admob full
    //    var isAd2 = false//charbootst
    //    var isAd3 = false//auto chartboost
    //    var isAd4 = true//admob banner
    //    var isAd5 = false//adcolony
    //    var isAd6 = true//amazon
    //    var isAd7 = true//Admob Edit
    //    var isAd8 = true//ChartBoost Edit
    
    @IBOutlet weak var sw1: UISwitch!
    
    @IBOutlet weak var sw2: UISwitch!
    
    @IBOutlet weak var sw3: UISwitch!
    
    @IBOutlet weak var sw4: UISwitch!
     @IBOutlet weak var sw5: UISwitch!
     @IBOutlet weak var sw6: UISwitch!
     @IBOutlet weak var sw7: UISwitch!
    @IBOutlet weak var sw8: UISwitch!
  @IBOutlet weak var CheckVPN: UISwitch!
    
    @IBOutlet weak var CheckAdOnline: UISwitch!
    
    @IBOutlet weak var textDevice: UITextView!

    @IBOutlet weak var txtVersion: UILabel!
    @IBAction func sw1Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad1")
        UserDefaults.standard.synchronize()
        Utility.isAd1 = sender.isOn
        
    }
    
    @IBAction func sw2Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad2")
        UserDefaults.standard.synchronize()
        Utility.isAd2 = sender.isOn
    }
    
    
    @IBAction func sw3Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad3")
        UserDefaults.standard.synchronize()
        Utility.isAd3 = sender.isOn
    }
    
    
    @IBAction func sw4Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad4")
        UserDefaults.standard.synchronize()
        Utility.isAd4 = sender.isOn
    }
    
    @IBAction func sw5Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad5")
        UserDefaults.standard.synchronize()
        Utility.isAd5 = sender.isOn
    }
    
    
    @IBAction func sw6Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad6")
        UserDefaults.standard.synchronize()
        Utility.isAd6 = sender.isOn
    }
    
    
    @IBAction func sw7Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad7")
        UserDefaults.standard.synchronize()
        Utility.isAd7 = sender.isOn
    }
    
    @IBAction func sw8Action(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"ad8")
        UserDefaults.standard.synchronize()
        Utility.isAd8 = sender.isOn
    }
    
    @IBAction func CheckVPN (sender: UISwitch) {
                UserDefaults.standard.set(sender.isOn, forKey:"check-VPN")
                UserDefaults.standard.synchronize()
        Utility.CheckVPN = sender.isOn
//        NSUserDefaults.standardUserDefaults().setObject(sender.isOn, forKey:"show-other-ad")
//        NSUserDefaults.standardUserDefaults().synchronize()
//        Utility.showOtherAd = sender.isOn
//        if(Utility.showOtherAd)
//        {
//            NSUserDefaults.standardUserDefaults().setObject("true", forKey:"show-other-ad-online")
//            NSUserDefaults.standardUserDefaults().synchronize()
//
//        }
    }
    
    @IBAction func CheckAdOnlineAction(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey:"adOnline")
        UserDefaults.standard.synchronize()
        Utility.CheckOnline = sender.isOn
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CheckAdOptionValue()
        setupDevice()
        
    }
    
    
       
    func setupDevice()
    {
        
        var myIDFA: String = ""
        // Check if Advertising Tracking is Enabled
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            // Set the IDFA
            myIDFA = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        
        let venderID = UIDevice.current.identifierForVendor!.uuidString
        
        
        textDevice.text = "IDFA: \n" + myIDFA + "\nVendorID: \n" + venderID
    }
    func CheckAdOptionValue()
    {
 
        
        sw1.isOn = Utility.isAd1
        sw2.isOn = Utility.isAd2
        sw3.isOn = Utility.isAd3
        sw4.isOn = Utility.isAd4
        
        sw5.isOn = Utility.isAd5
        sw6.isOn = Utility.isAd6
        sw7.isOn = Utility.isAd7
        sw8.isOn = Utility.isAd8

        CheckVPN.isOn = Utility.CheckVPN
        CheckAdOnline.isOn = Utility.CheckOnline
        
        txtVersion.text = "Version " + Utility.version
        
    }
    
    
}
