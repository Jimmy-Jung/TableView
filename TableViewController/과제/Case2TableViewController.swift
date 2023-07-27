//
//  Case2TableViewController.swift
//  TableViewController
//
//  Created by 정준영 on 2023/07/27.
//

import UIKit

class Case2TableViewController: UITableViewController {

    let list: [Int: [String]] = [0: ["1번섹션"], 1: ["장보기", "영화보기", "잠자기", "코드보기"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderTopPadding = 16
    }
    
    
    // 0. number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    
    // 1. number of cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return list[0]?.count ?? 0
        case 1:
            return list[1]?.count ?? 0
        default:
            return 0
        }
    }
    
    // 2. 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellName.case2Cell)!
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
        switch section {
        case 0:
            return "1번 섹션"
        case 1:
            return "2번 섹션"
        default:
            return nil
        }
    }
    
    
}
