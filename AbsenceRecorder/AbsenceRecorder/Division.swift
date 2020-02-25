//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Goad, William (PAH) on 06/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class Division {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.first { $0.takenOn == date }
    }

}
