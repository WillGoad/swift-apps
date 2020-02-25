//
//  StudentCell.swift
//  AbsenceRecorder
//
//  Created by Goad, William (PAH) on 09/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.accessoryType = selected ? .checkmark : .none
        self.selectionStyle = .none
    }

}
