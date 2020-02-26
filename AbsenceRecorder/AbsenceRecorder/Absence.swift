//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Goad, William (PAH) on 09/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation


class Absence {
    var takenOn: Date
    var present: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
    
    init(date: Date, present: [Student]) {
        takenOn = date
        self.present = present
    }
}
 
