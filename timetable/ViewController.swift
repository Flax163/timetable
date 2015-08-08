//
//  ViewController.swift
//  timetable
//
//  Created by Valentin on 26.07.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var loadService:LoadScheduleService?
    var loadParameterSearchService:LoadParameterSearchService?
    var groups:Array<Group> = Array()
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.loadService = LoadScheduleServiceImpl()
        self.loadParameterSearchService = LoadParametersearchServiceImpl()
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        groups = loadParameterSearchService!.loadGroups()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var seachCell:SearchTableCell = tableView.dequeueReusableCellWithIdentifier("searchCell") as! SearchTableCell
        
        seachCell.insertSearchName(groups[indexPath.section].name)
        return seachCell
    }

}

