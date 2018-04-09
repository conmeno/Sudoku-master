//
//  Utility.swift
//  Spin Hexagon
//
//  Created by Phuong Nguyen on 2/25/16.
//  Copyright © 2016 Phuong Nguyen. All rights reserved.
//

import Foundation

class Utility {
    
    static var isAd1 = false//admob full
    static var isAd2 = false//Admob Banner
    static var isAd3 = true//Amazon
    static var isAd4 = false//Adcolony
   
    static var isAd5 = false// ==>Chartboost
    static var isAd6 = false//revmob
    
    static var isAd7 = false //none
    static var isAd8 = false //none
    
    
    static var CheckOnline = true // on/off check ad online
    static var GBannerAdUnit: String = ""
    static var GFullAdUnit: String = ""
    
    static var AdcolonyAppID: String = ""
    static var AdcolonyZoneID: String = ""
    static var AdmobTestDeviceID: String = ""
    static var RevmobID: String = ""
    static var Amazonkey = ""
    
    static var CBAppID = ""
    static var CBSign=""
    static var version = ""
    static var isStopAdmobAD = false
    
    static var CheckVPN = true
    
    //static var showOtherAd = false //showAd (ngoai tru Admob Banner)
    
    static var abc = cclass()
    //static var adData = adData()
    static var adData = AdData()
    static func OpenView(viewName: String, view: UIViewController)
    {
        let storyboard = UIStoryboard(name: "StoryboardAD", bundle: nil)
        
        let WebDetailView = storyboard.instantiateViewController(withIdentifier: viewName) as UIViewController
        
        view.present(WebDetailView , animated: true, completion: nil)
        
    }
    
    static func SetUpAdData()
    {
        
        
        GBannerAdUnit = adData.gBanner
        GFullAdUnit = adData.gFull
      
        Amazonkey = adData.AmazonKey
        
        AdcolonyAppID = adData.AdcolonyAppID
        AdcolonyZoneID = adData.AdcolonyZoneID
        AdmobTestDeviceID = adData.TestDeviceID
        RevmobID = adData.RevmobID
       
        CBAppID = adData.cAppID
        CBSign = adData.cSign
 
        
        
        if(UserDefaults.standard.object(forKey: "adOnline") != nil)
        {
            Utility.CheckOnline = UserDefaults.standard.object(forKey:"adOnline") as! Bool
            print(UserDefaults.standard.object(forKey:"adOnline")!)
        }
        
        
        //GEt Ad unit online
        
        if(Utility.CheckOnline)
        {
            
            let xmlSetup = ADXML()
            xmlSetup.LoadXML()
        }
        
        if(isCDMA())
        {
            //ad1 admob full
            if(UserDefaults.standard.object(forKey:"ad1") != nil)
            {
                isAd1 = UserDefaults.standard.object(forKey:"ad1") as! Bool
                
            }
            
            //ad2 banner
            
            if(UserDefaults.standard.object(forKey:"ad2") != nil)
            {
                isAd2 = UserDefaults.standard.object(forKey:"ad2") as! Bool
                
            }
            
            
            //ad3 ...
            
            if(UserDefaults.standard.object(forKey:"ad3") != nil)
            {
                isAd3 = UserDefaults.standard.object(forKey:"ad3") as! Bool
                
            }
            
            if(UserDefaults.standard.object(forKey:"ad4") != nil)
            {
                isAd4 = UserDefaults.standard.object(forKey:"ad4") as! Bool
                
            }
            
            
            if(UserDefaults.standard.object(forKey:"ad5") != nil)
            {
                isAd5 = UserDefaults.standard.object(forKey:"ad5") as! Bool
                
            }
            
            
            
            
            if(UserDefaults.standard.object(forKey:"ad6") != nil)
            {
                isAd6 = UserDefaults.standard.object(forKey:"ad6") as! Bool
                
            }
            
            if(UserDefaults.standard.object(forKey:"ad7") != nil)
            {
                isAd7 = UserDefaults.standard.object(forKey:"ad7") as! Bool
                
            }
            if(UserDefaults.standard.object(forKey:"ad8") != nil)
            {
                isAd8 = UserDefaults.standard.object(forKey:"ad8") as! Bool
                
            }
        
        }else
        {
        
            //ad1 admob full
            if(UserDefaults.standard.object(forKey:"online-ad1") != nil)
            {
                isAd1 = UserDefaults.standard.object(forKey:"online-ad1") as! Bool
                
            }
            
            //ad2 banner
            
            if(UserDefaults.standard.object(forKey:"online-ad2") != nil)
            {
                isAd2 = UserDefaults.standard.object(forKey:"online-ad2") as! Bool
                
            }
            
            
            //ad3 ...
            
            if(UserDefaults.standard.object(forKey:"online-ad3") != nil)
            {
                isAd3 = UserDefaults.standard.object(forKey:"online-ad3") as! Bool
                
            }
            
            if(UserDefaults.standard.object(forKey:"online-ad4") != nil)
            {
                isAd4 = UserDefaults.standard.object(forKey:"online-ad4") as! Bool
                
            }
            
            
            if(UserDefaults.standard.object(forKey:"online-ad5") != nil)
            {
                isAd5 = UserDefaults.standard.object(forKey:"online-ad5") as! Bool
                
            }
            
            
            
            
            if(UserDefaults.standard.object(forKey:"online-ad6") != nil)
            {
                isAd6 = UserDefaults.standard.object(forKey:"online-ad6") as! Bool
                
            }
            
            if(UserDefaults.standard.object(forKey:"online-ad7") != nil)
            {
                isAd7 = UserDefaults.standard.object(forKey:"online-ad7") as! Bool
                
            }
            if(UserDefaults.standard.object(forKey:"online-ad8") != nil)
            {
                isAd8 = UserDefaults.standard.object(forKey:"online-ad8") as! Bool
                
            }
        }
        
        

        
        
        if(UserDefaults.standard.object(forKey:"check-VPN") != nil)
        {
            CheckVPN = UserDefaults.standard.object(forKey:"check-VPN") as! Bool
            
        }
        
        
        
        
        
        
        SetupAdOnline()
        
//        if(Utility.isCDMA())
//        {
//            showOtherAd = true
//        }
        
        
    }

    
    static func SetupAdOnline()
    {
        
        //google
        if(UserDefaults.standard.object(forKey:"gBannerOnline") != nil)
        {
            GBannerAdUnit = UserDefaults.standard.object(forKey:"gBannerOnline") as! String
            
        }
        
        if(UserDefaults.standard.object(forKey:"gFullOnline") != nil)
        {
            GFullAdUnit = UserDefaults.standard.object(forKey:"gFullOnline") as! String
        }
        
              //get edited appid & sign from Adcolony
        
        if(UserDefaults.standard.object(forKey:"adcolonyAppID") != nil)
        {
            AdcolonyAppID = UserDefaults.standard.object(forKey:"adcolonyAppID") as! String            
        }
        
        if(UserDefaults.standard.object(forKey:"adcolonyZoneID") != nil)
        {
            AdcolonyZoneID = UserDefaults.standard.object(forKey:"adcolonyZoneID") as! String
            
        }
        
               
        //get amazon online id
        if(UserDefaults.standard.object(forKey:"amazon") != nil)
        {
            Amazonkey = UserDefaults.standard.object(forKey:"amazon") as! String
            
        }
        
        
        if(UserDefaults.standard.object(forKey:"cbappid") != nil)
        {
            CBAppID = UserDefaults.standard.object(forKey:"cbappid") as! String
            
        }
        
        if(UserDefaults.standard.object(forKey:"cbsign") != nil)
        {
            CBSign = UserDefaults.standard.object(forKey:"cbsign") as! String
            
        }
               //revmob id
        if(UserDefaults.standard.object(forKey:"revmobid") != nil)
        {
            RevmobID = UserDefaults.standard.object(forKey:"revmobid") as! String
            
        }
        if(UserDefaults.standard.object(forKey:"version") != nil)
        {
            version = UserDefaults.standard.object(forKey:"version") as! String
            
        }
        
//        //get CDMA status
//        if(UserDefaults.standard.object(forKey:"show-other-ad-online") != nil)
//        {
//            let tempCDMA = UserDefaults.standard.object(forKey:"show-other-ad-online") as! String
//            if(tempCDMA == "true")
//            {
//                showOtherAd = true
//            }else
//            {
//                showOtherAd = false
//            }
//            
//        }
        
        
    }
    
    static func isCDMA()->Bool
    {
        //return false
        let Version = abc.platformNiceString()
        if(Version == "CDMA")
        {
            return true
        }
        
        return false
    }
    
 
    
    static func setupRevmob()
    {
        
        let completionBlock: () -> Void = {
            RevMobAds.session().showFullscreen()
        
            
            self.RevmobFull()
            self.RevmobVideo()
            //RevmobPopup()
            self.RevmobBanner()
        }
//        let errorBlock: (NSError!) -> Void = {error in
//            // check the error
//            print(error);
//        }
        RevMobAds.startSession(withAppID: Utility.RevmobID,
            withSuccessHandler: completionBlock, andFailHandler: nil);
        
    }
    static func RevmobBanner()
    {
        let banner = RevMobAds.session()?.bannerView()
        banner?.frame = CGRect(x: 0,y: 70,width: 320,height: 50);
        
        RevMobAds.session()?.showBanner();
    }
    static func RevmobFull()
    {
        RevMobAds.session()?.showFullscreen();
    }
    static func RevmobPopup()
    {
        RevMobAds.session()?.showPopup();
        
    }
    static func RevmobVideo()
    {
        //To load
        RevMobAds.session()?.fullscreen().loadVideo()
        
        //To show
        RevMobAds.session()?.fullscreen().showVideo()
    }
    
//    static func CanShowAd()->Bool
//    {
//        let abc = cclass()
//        let VPN = abc.isVPNConnected()
//        let Version = abc.platformNiceString()
//        if(VPN == false && Version == "CDMA")
//        {
//            return false
//        }
//        
//        
//        return true
//    }
    
    
    
    static func MoreGame()
    {
        let barsLink : String = "itms-apps://itunes.apple.com/ca/developer/phuong-nguyen/id1004963752"
        UIApplication.shared.openURL(NSURL(string: barsLink)! as URL)
    }
    
    
}
