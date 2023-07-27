//
//  CustomTableViewController.swift
//  TableViewController
//
//  Created by 정준영 on 2023/07/27.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    let list = ["장보기", "영화보기", "잠자기", "코드보기"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 색션 내 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    // 셀의 디자인 설정 및 데이터 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")!
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textColor = .red
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .blue
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 16)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        return cell
    }
    // 셀의 높이: 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function, indexPath)
        return 70
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")!
        cell.isSelected = false
    }
}
