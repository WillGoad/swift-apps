//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Goad, William (PAH) on 05/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addDummyData()
        main()
        
        updateDateDisplay()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController")
            as? DivisionAbsenceViewController else {
                fatalError("Failed to load Division View Controller from storyboard")
        }
        
        vc.division = divisions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "BY-2", of: 4))
        divisions.append(DivisionFactory.createDivision(code: "BY-3", of: 16))
        divisions.append(DivisionFactory.createDivision(code: "BY-4", of: 7))
        divisions.append(DivisionFactory.createDivision(code: "BY-5", of: 10))
    }
    
    
    
    func main() {
        for div in divisions {
            print(div.code)
            print(div.students.count)
            for stud in div.students {
                print(stud.forename)
            }
        }
    }
    
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        navigationItem.title = formatter.string(from: currentDate)
    }
}

