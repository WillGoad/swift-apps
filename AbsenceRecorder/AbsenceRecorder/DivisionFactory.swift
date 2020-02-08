//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Goad, William (PAH) on 06/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for _ in 1...size {
            division.students.append(Student.init(forename: "Will", surname: "Goad", birthday: Date.init(timeIntervalSinceNow: 0)))
        }
        return division
    }
}
