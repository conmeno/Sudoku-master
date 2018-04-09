//
//  AdOnline.swift
//  Game10240
//
//  Created by Phuong Nguyen on 3/1/16.
//  Copyright © 2016 Phuong Nguyen. All rights reserved.
//

import Foundation




class ADXML: NSObject, XMLParserDelegate
{
    var currentNode = ""
    var elementValue: String?
    var success = false
    let adData = AdData()
    func LoadXML()
    {
        if let url = NSURL(string: adData.AdURL)
        {
            var data1: NSData? = nil
            data1 = NSData(contentsOf: url as URL)
            if data1 != nil {
                let parser = XMLParser(data: data1 as! Data)
                parser.delegate = self
                parser.parse()
            }
            
            
            
//            if let data = NSData(contentsOfURL: url)
//            {
//                let parser = NSXMLParser(data: data)
//                parser.delegate = self
//                parser.parse()
//                
//            }
        }
        
    }
    
    
    
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?,  attributes attributeDict: [String : String]) {
        
        currentNode = elementName
        
        

    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    if(string != "")
    {
        var boolSTR = false
        if(string == "true")
        {
           boolSTR = true
        }
        
 
        if(currentNode == "checkVPN")
        {
            UserDefaults.standard.set(boolSTR, forKey:"check-VPN")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set(false, forKey:"adOnline")
            UserDefaults.standard.synchronize()


        }
        else if(currentNode == "v")
        {
            
            UserDefaults.standard.set(string, forKey:"version")
            UserDefaults.standard.synchronize()

            
        }
        else if(currentNode == "online-ad1")
        {
            
                UserDefaults.standard.set(boolSTR, forKey:"online-ad1")
                UserDefaults.standard.synchronize()
          
        }
        else if(currentNode == "online-ad2")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad2")
            UserDefaults.standard.synchronize()
        }

        else if(currentNode == "online-ad3")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad3")
            UserDefaults.standard.synchronize()
        }

        else if(currentNode == "online-ad4")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad4")
            UserDefaults.standard.synchronize()
        }

        else if(currentNode == "online-ad5")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad5")
            UserDefaults.standard.synchronize()
        }

        else if(currentNode == "online-ad6")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad6")
            UserDefaults.standard.synchronize()
        }
        else if(currentNode == "online-ad7")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad7")
            UserDefaults.standard.synchronize()
        }
        else if(currentNode == "online-ad8")
        {
            UserDefaults.standard.set(boolSTR, forKey:"online-ad8")
            UserDefaults.standard.synchronize()
        }
            
            
            ///Ad for CDMA
        else if(currentNode == "ad1")
        {
            
            UserDefaults.standard.set(boolSTR, forKey:"ad1")
            UserDefaults.standard.synchronize()
            
        }
        else if(currentNode == "ad2")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad2")
            UserDefaults.standard.synchronize()
        }
            
        else if(currentNode == "ad3")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad3")
            UserDefaults.standard.synchronize()
        }
            
        else if(currentNode == "ad4")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad4")
            UserDefaults.standard.synchronize()
        }
            
        else if(currentNode == "ad5")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad5")
            UserDefaults.standard.synchronize()
        }
            
        else if(currentNode == "ad6")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad6")
            UserDefaults.standard.synchronize()
        }
        else if(currentNode == "ad7")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad7")
            UserDefaults.standard.synchronize()
        }
        else if(currentNode == "ad8")
        {
            UserDefaults.standard.set(boolSTR, forKey:"ad8")
            UserDefaults.standard.synchronize()
        }

        
        //begin google
        else if(currentNode == "gbanner")
        {
            print("Banner gg " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"gBannerOnline")
            UserDefaults.standard.synchronize()
            //chi load xml online lan dau
            //            // sau do set chi so online = false
         
 
        }else if(currentNode == "gfull")
        {
            print("Full gg " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"gFullOnline")
            UserDefaults.standard.synchronize()
        }
        //end google
 
        //AMAZON
        else if(currentNode == "amazon")
        {
            print("amazon " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"amazon")
            UserDefaults.standard.synchronize()
        }
            
        
        //begin Adcolony
        else if(currentNode == "adcolonyAppID")
        {
            print("adcolonyAppID " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"adcolonyAppID")
            UserDefaults.standard.synchronize()
        }
        else if(currentNode == "adcolonyZoneID")
        {
            print("adcolonyZoneID " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"adcolonyZoneID")
            UserDefaults.standard.synchronize()
        }
        //end adcolony
        //read revmob
        else if(currentNode == "revmobid")
        {
            print("revmobid " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"revmobid")
            UserDefaults.standard.synchronize()
        }
        
            //read chartboost
        else if(currentNode == "cbappid")
        {
            print("cbappid " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"cbappid")
            UserDefaults.standard.synchronize()
        }
        else if(currentNode == "cbsign")
        {
            print("cbsign " + string)
            
            //save to Iphone user
            
            UserDefaults.standard.set(string, forKey:"cbsign")
            UserDefaults.standard.synchronize()
        }
     
        
        
        
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
     currentNode = ""
        
 
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("parseErrorOccurred: \(parseError)")
    }
    
    
    
}
