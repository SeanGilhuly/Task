//
//  DateHelpers.swift
//  Task
//
//  Created by Sean Gilhuly on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class DateHelpers {
    
}

extension NSDate (extension NSDate { }) {
func stringValue() -> String {
    let formatter = NSDateFormatter()
    formatter.dateStyle = .MediumStyle
    
    return formatter.stringFromDate(self)
}

}

