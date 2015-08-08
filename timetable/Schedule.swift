//
//  Schedule.swift
//  timetable
//
//  Created by Valentin on 29.07.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import Foundation
import UIKit

struct Schedule
{
    var date:Date
    var audience:String
    var pair:Int
    var teacherFIO:String
    var typeBusiness:String
    var nameSubject:String
    var nameGroup:String
}

struct Date
{
    var day:Int
    var month:Int
    var year:Int
    
    init(day: Int, month: Int, year:Int)
    {
        self.day = day
        self.month = month
        self.year = year
    }
    
    
    
    func fullDate()->String
    {
        return String(day) + "." + String(month) + "." + String(year)
    }
}

