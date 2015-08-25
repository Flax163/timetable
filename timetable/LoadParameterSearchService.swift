//
//  LoadParameterSearchService.swift
//  timetable
//
//  Created by Valentin on 04.08.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import Foundation
import Kanna


protocol LoadParameterSearchService
{
    func loadGroups(completion: (groups: Array<Group>) -> Void)
}

class LoadParametersearchServiceImpl : LoadParameterSearchService
{
    func loadGroups(succes: (groups: Array<Group>) -> Void)
    {
        var result:Array<Group> = Array<Group>()
        var url:NSURL = NSURL(string: LOAD_GROUP_TOLGAS_TIMETABLE_URL)!
        var request2:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request2.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request2, completionHandler:
            {
                data, response, error in
                
                var er:NSError? = nil
                
                var responseString:String = NSString(data: data, encoding: NSWindowsCP1251StringEncoding)! as String
                
                if let parser:HTMLDocument = Kanna.HTML(html: responseString, encoding: NSUTF8StringEncoding)
                {
                    for node in parser.xpath(XPATCH_QUERY_FOR_LOAD_SCHELUDER)
                    {
                        var group:Group = Group()
                        var ololo:String! = node.toHTML!.substringFromIndex(node.toHTML!.rangeOfString("value=\"")!.endIndex)
                        group.id = ololo.substringToIndex(advance(ololo.rangeOfString(">")!.endIndex, -2))
                        group.name = node.text!
                        result.append(group)
                    }
                }
                succes(groups: result)
        })
        
        task.resume()
    }
    
    func loadTeachers(succes: (teacher: Array<Teacher>) -> Void)
    {
        
    }
    
    func loadData<T : TimeTableSearchData>(data:Array<T>, url:String, succes: (result: Array<T>) -> Void)
    {
        var nsurl:NSURL = NSURL(string: url)!
        var request2:NSMutableURLRequest = NSMutableURLRequest(URL: nsurl)
        
        request2.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request2, completionHandler:
        {
                data, response, error in
                
                var er:NSError? = nil
                
                var responseString:String = NSString(data: data, encoding: NSWindowsCP1251StringEncoding)! as String
                
                if let parser:HTMLDocument = Kanna.HTML(html: responseString, encoding: NSUTF8StringEncoding)
                {
                    for node in parser.xpath(XPATCH_QUERY_FOR_LOAD_SCHELUDER)
                    {
                        var serchData:TimeTableSearchData = [T]()
                        var ololo:String! = node.toHTML!.substringFromIndex(node.toHTML!.rangeOfString("value=\"")!.endIndex)
                        serchData.id = ololo.substringToIndex(advance(ololo.rangeOfString(">")!.endIndex, -2))
                        serchData.name = node.text!
                        data.append(serchData)
                    }
                }
                succes(result: data)
        })
        
        task.resume()
        }

}

struct Group: TimeTableSearchData
{
    var id:String
    var name:String
    
    init(id:String = "", name:String = "")
    {
        self.id = id
        self.name = name
    }
    
}

struct Teacher: TimeTableSearchData
{
    var id:String
    var name:String
    
    init(id:String = "", name:String = "")
    {
        self.id = id
        self.name = name
    }
}

protocol TimeTableSearchData
{
    var id:String {get set}
    var name:String {get set}
}