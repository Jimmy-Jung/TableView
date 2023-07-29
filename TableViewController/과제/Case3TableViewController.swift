//
//  Case3TableViewController.swift
//  TableViewController
//
//  Created by 정준영 on 2023/07/27.
//

import UIKit

class Case3TableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    // list
    var list: [Int: [String]] = [0: ["1번섹션"], 1: ["장보기", "영화보기", "잠자기", "코드보기"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderTopPadding = 16
    }
    
    @IBAction func appendButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        guard (list[2] != nil) else {
            list.updateValue([title], forKey: 2)
            titleTextField.text = ""
            tableView.reloadData()
            return
        }
        list[2]?.append(title)
        titleTextField.text = ""
        tableView.reloadData()
    }
    
    // 0. number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    
    // 1. number of cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section]?.count ?? 0
    }
    
    // 2. 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellName.case3Cell)!
        var content = cell.defaultContentConfiguration()
        
        content.text = list[indexPath.section]?[indexPath.row]
        content.secondaryText = "\(indexPath)에 위치한 셀"
        content.image = UIImage(systemName: "person.circle.fill")
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)번째 섹션"
    }
    
    
}
