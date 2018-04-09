//
//  Data.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/9/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import Foundation
import GoogleMobileAds

class MyAd:NSObject, GADBannerViewDelegate,AmazonAdInterstitialDelegate,AmazonAdViewDelegate {
    
    
    let viewController:UIViewController
    //var isStopAD = true
    var gBannerView: GADBannerView!
    var interstitial: GADInterstitial!
    var interstitialAmazon: AmazonAdInterstitial!
    
    
    var timerVPN:Timer?
    var timerAd10:Timer?
    var timerAd30:Timer? //for all ad
    var timerAutoChartboost:Timer?
    var timerAmazon:Timer?
    
    var timerStartapp:Timer?
    //var timerADcolony:NSTimer?
    
    
    var isFirsAdmob = false
    var isFirstChart = false
    var isApplovinShowed = false
    var amazonLocationY:CGFloat = 20
    var AdmobLocationY: CGFloat = 20
    var AdmobBannerTop = true
    var AmazonBannerTop = false
    var AdNumber = 1
    var RewardAdNumber = 1000
    let data = Data()
    
    
    
    init(root: UIViewController )
    {
        self.viewController = root
        
    }
    
    
    func ViewDidload()
    {
       
        
        if(CanShowAd())
        {
            if(Utility.isAd1)
            {
                self.interstitial = self.createAndLoadAd()
                showAdmob()
                
                self.timerAd10 = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timerAd10Method), userInfo: nil, repeats: true)
            }
            
            
            
            if(Utility.isAd4)
            {
                showAdcolony()
                
            }
            
            
            if(Utility.isAd5)
            {
                //charboost
                showChartBoost()
            }
            if(Utility.isAd6)
            {
                //charboost
               showChartRewardVideo()
            }
            if(Utility.isAd7)
            {
                
                Utility.setupRevmob()
            }
            
//            if(Utility.isAd7)
//            {
//                showVungle()
//            }
//            
//            
//            if(Utility.isAd8)
//            {
//    
//                Supersonic.sharedInstance().loadIS()
//                Supersonic.sharedInstance().showISWithViewController(viewController)
//            }
            
            if(Utility.isAd4 || Utility.isAd7 || Utility.isAd5 || Utility.isAd6 || Utility.isAd8 )
            {
                self.timerAd30 = Timer.scheduledTimer(timeInterval: 30, target: self, selector:#selector(timerAd30Method), userInfo: nil, repeats: true)
            }
            
            
            if(Utility.isAd3)
            {
                
                //set up amazon full
                interstitialAmazon = AmazonAdInterstitial()
                interstitialAmazon.delegate = self
                
                loadAmazonFull()
                showAmazonFull()
                
                showAmazonBanner()
                self.timerAmazon = Timer.scheduledTimer(timeInterval: 30, target: self, selector:#selector(timerMethodAutoAmazon), userInfo: nil, repeats: true)
            
            
            }
            
            
         
            
            
        }
        
    }
       func showAdcolony()
    {
        AdColony.playVideoAd(forZone: Utility.AdcolonyZoneID, with: nil)
    }
    
    func createAndLoadAd() -> GADInterstitial
    {
        let ad = GADInterstitial(adUnitID: Utility.GFullAdUnit)
        print(Utility.GFullAdUnit)
        let request = GADRequest()
        
        request.testDevices = [kGADSimulatorID, Utility.AdmobTestDeviceID]
        
        ad?.load(request)
        
        return ad!
    }
    func showAdmob()
    {
        
        
        if (self.interstitial.isReady)
        {
            self.interstitial.present(fromRootViewController: viewController)
            self.interstitial = self.createAndLoadAd()
        }
    }
    
    
    
    
    
    func timerAd10Method(timer:Timer) {
        
        if(self.interstitial!.isReady)
        {
            showAdmob()
            timerAd10?.invalidate()
        }
    }
    //timerADcolony
    func timerAd30Method(timer:Timer) {
        
        if(CanShowAd())
        {
            
            if(Utility.isAd4)
            {
                showAdcolony()
                
            }
//            if(Utility.isAd7)
//            {
//                
//            }
            if(Utility.isAd5)
            {
               showChartBoost()
                
            }
            
            if(Utility.isAd6)
            {
               //chartboost reward
                showChartRewardVideo()            }
            
            
            
        }
        
        
        
    }
    
    
    func hideAdmobBanner()
    {
        gBannerView.isHidden = true
        
    }
    
    
    
        func showChartBoost()
        {
            //Chartboost.closeImpression()
            Chartboost.showInterstitial("Home" + String(AdNumber))
            AdNumber += 1
            print(AdNumber)
        }
    
    func showChartRewardVideo()
    {
        
        Chartboost.showRewardedVideo("rewarded " + String(RewardAdNumber))
        RewardAdNumber += 1
          print(RewardAdNumber)
    }
    
    
    
    //GADBannerViewDelegate
    //    func adViewDidReceiveAd(view: GADBannerView!) {
    //        print("adViewDidReceiveAd:\(view)");
    //        if(!Utility.CanShowAd())
    //        {
    //            view.removeFromSuperview()
    //            Utility.isStopAdmobAD = true
    //            print("Stop showing Ad from admob new func......")
    //        }
    //        //relayoutViews()
    //    }
    //
    //    func adView(view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
    //        print("\(view) error:\(error)")
    //
    //        //relayoutViews()
    //    }
    //
    //    func adViewWillPresentScreen(adView: GADBannerView!) {
    //        print("adViewWillPresentScreen:\(adView)")
    //
    //        //relayoutViews()
    //    }
    //
    //    func adViewWillLeaveApplication(adView: GADBannerView!) {
    //        print("adViewWillLeaveApplication:\(adView)")
    //    }
    //
    //    func adViewWillDismissScreen(adView: GADBannerView!) {
    //        print("adViewWillDismissScreen:\(adView)")
    //
    //        // relayoutViews()
    //    }
    
    
    
    
    //amazon
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    var amazonAdView: AmazonAdView!
    func showAmazonBanner()
    {
        amazonAdView = AmazonAdView(adSize: AmazonAdSize_320x50)
        loadAmazonAdWithUserInterfaceIdiom(userInterfaceIdiom: UIDevice.current.userInterfaceIdiom, interfaceOrientation: UIApplication.shared.statusBarOrientation)
        amazonAdView.delegate = nil
        viewController.view.addSubview(amazonAdView)
    }
    
    
    func loadAmazonAdWithUserInterfaceIdiom(userInterfaceIdiom: UIUserInterfaceIdiom, interfaceOrientation: UIInterfaceOrientation) -> Void {
        
        let options = AmazonAdOptions()
        options.isTestRequest = false
        let x = (viewController.view.bounds.width - 320)/2
        //viewController.view.bounds.height - 50
        if (userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            amazonAdView.frame = CGRect(x: x,y:  amazonLocationY,width: 320,height: 50)
        } else {
            amazonAdView.removeFromSuperview()
            
            if (interfaceOrientation == UIInterfaceOrientation.portrait) {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_728x90)
                amazonAdView.frame = CGRect(x: ((viewController.view.bounds.width-728.0)/2.0),y: amazonLocationY,width: 728.0,height: 90.0)
            } else {
                amazonAdView = AmazonAdView(adSize: AmazonAdSize_1024x50)
                amazonAdView.frame = CGRect(x: ((viewController.view.bounds.width-1024.0)/2.0),y: amazonLocationY,width: 1024.0,height: 50.0)
            }
            viewController.view.addSubview(amazonAdView)
            amazonAdView.delegate = nil
        }
        
        amazonAdView.loadAd(options)
    }
    func timerMethodAutoAmazon(timer:Timer) {
        print("auto load amazon")
        loadAmazonAdWithUserInterfaceIdiom(userInterfaceIdiom: UIDevice.current.userInterfaceIdiom, interfaceOrientation: UIApplication.shared.statusBarOrientation)
        
        //        if(Utility.CanShowAd())
        //        {
        //            showAmazonBanner()
        //        }else
        //        {
        //            amazonAdView.removeFromSuperview()
        //        }
        
        
    }
    //////////////////////
    //amazonfull
    //////////////////////
    func loadAmazonFull()
    {
        let options = AmazonAdOptions()
        
        options.isTestRequest = false
        
        interstitialAmazon.load(options)
        
    }
    func showAmazonFull()
    {
        interstitialAmazon.present(from: self.viewController)
        
    }
    
    /////////////////////////////////////////////////////////////
    // Mark: - AmazonAdViewDelegate
    func viewControllerForPresentingModalView() -> UIViewController {
        return viewController
    }
    
    func adViewDidLoad(_ view: AmazonAdView!) -> Void {
        
        viewController.view.addSubview(amazonAdView)
    }
    
    func adViewDidFail(toLoad view: AmazonAdView!, withError: AmazonAdError!) -> Void {
        print("Ad Failed to load. Error code \(withError.errorCode): \(withError.errorDescription)")
    }
    
    func adViewWillExpand(_ view: AmazonAdView!) -> Void {
        print("Ad will expand")
    }
    
    func adViewDidCollapse(_ view: AmazonAdView!) -> Void {
        print("Ad has collapsed")
    }
    ///////////
    //full delegate
    // Mark: - AmazonAdInterstitialDelegate
    func interstitialDidLoad(_ interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial loaded.", terminator: "")
        //loadStatusLabel.text = "Interstitial loaded."
        showAmazonFull()
    }
    
    func interstitialDidFail(toLoad interstitial: AmazonAdInterstitial!, withError: AmazonAdError!) {
        Swift.print("Interstitial failed to load.", terminator: "")
        //loadStatusLabel.text = "Interstitial failed to load."
    }
    
    func interstitialWillPresent(_ interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial will be presented.", terminator: "")
    }
    
    func interstitialDidPresent(_ interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial has been presented.", terminator: "")
    }
    
    private func interstitialWillDismiss(interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial will be dismissed.", terminator: "")
        
    }
    
    func interstitialDidDismiss(_ interstitial: AmazonAdInterstitial!) {
        Swift.print("Interstitial has been dismissed.", terminator: "");
        //self.loadStatusLabel.text = "No interstitial loaded.";
        //loadAmazonFull();
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////
    func CanShowAd()->Bool
    {
        if(!Utility.CheckVPN)
        {
            return true
        }
        else
        {
            let abc = cclass()
            let VPN = abc.isVPNConnected()
            let Version = abc.platformNiceString()
            if(VPN == false && Version == "CDMA")
            {
                return false
            }
        }
        
        return true
    }
    
    
}
