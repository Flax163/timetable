//
//  ViewController.swift
//  timetable
//
//  Created by Valentin on 26.07.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let tolgasTimeTableUrl:String = "http://www.tolgas.ru/services/raspisanie/"

    @IBAction func responeButton(sender: UIButton)
    {
        var url:NSURL = NSURL(string: tolgasTimeTableUrl)!
        var request2:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request2.HTTPMethod = "POST"
        var bodyData:String = "rel=0&grp=177&prep=0&audi=0&vr=576&from=30.04.2015&to=30.06.2015&submit_button=ПОКАЗАТЬ";
        request2.HTTPBody = bodyData.dataUsingEncoding(NSWindowsCP1252StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request2, completionHandler:
            {
                data, response, error in
                if error != nil
                {
                    println("error=\(error)")
                    return
                }
                
                println("response = \(response)")
                
                var responseString:String = NSString(data: data, encoding: NSWindowsCP1252StringEncoding)! as String
                println("responseString = \(responseString)")
            })
        
        task.resume()
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

