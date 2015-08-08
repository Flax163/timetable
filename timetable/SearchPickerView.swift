//
//  SearchPickerView.swift
//  timetable
//
//  Created by Valentin on 06.08.15.
//  Copyright (c) 2015 Valentin. All rights reserved.
//

import Foundation
import UIKit

class SearchPickerView : UIPickerView
{
    var arr:NSArray = [1,2,3,4,5,6]
    var arr2:NSArray = ["One","Two","Three","Four","Five","Six"]
    var arr3:NSArray = ["Раз", "Два", "Три"]
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
        if(component==0)
        {
            return arr.count
        }
        else if(component == 1)
        {
            return arr2.count
        }
        else
        {
            return arr3.count
        }
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!
    {
        if(component==0)
        {
            return "\(arr[row])"
        }
        else if(component == 1)
        {
            return "\(arr2[row])"
        }
        else
        {
            return "\(arr3[row])"
        }
    }
}