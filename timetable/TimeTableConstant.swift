//
//  TimeTableConstant.swift
//  timetable
//
//  Created by Valentin on 05.08.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import Foundation

let LOAD_GROUP_TOLGAS_TIMETABLE_URL:String = "http://www.tolgas.ru/services/raspisanie/?id=0"
let LOAD_TEACHER_TOLGAS_TIMETABLE_URL:String = "http://www.tolgas.ru/services/raspisanie/?id=1"
let LOAD_ROOM_TOLGAS_TIMETABLE_URL:String = "http://www.tolgas.ru/services/raspisanie/?id=2"
let XPATCH_QUERY_FOR_SEARCH_PARAMETER_GROUP:String = "//div[@class=\'content\']//table[@id=\'send\']//*[name()=\'tr\']//td"
let XPATCH_QUERY_FOR_LOAD_SCHELUDER:String = "//div[@class=\'content\']//td[@id=\'vbr\']//*[name()=\'option\']"
