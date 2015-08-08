//
//  SearchTableCell.swift
//  timetable
//
//  Created by Valentin on 30.07.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import Foundation
import UIKit

class SearchTableCell: UITableViewCell
{
    @IBOutlet var searchName: UILabel!

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        searchName = UILabel()
    }
    
    func insertSearchName(searchName: String)
    {
        self.searchName.text = searchName;
    }

}