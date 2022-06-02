//
//  ViewController.swift
//  KoreanStringSearchHelper
//
//  Created by 42582071 on 06/03/2022.
//  Copyright (c) 2022 42582071. All rights reserved.
//

import UIKit
import KoreanStringSearchHelper

let datas: [String] = ["예그리나", "늘품", "아슬라", "가온누리", "사과", "별하", "안녕", "소록소록", "곰다시", "소솜", "감사합니다", "도담도담", "노트북", "아리아", "포도.", "별빛", "도서", "나비잠", "아름드리", "바람꽃", "미리내", "책방", "로운", "도르레", "여우비", "가온해", "우리는", "아련", "여우별", "산들림", "함초롱하다", "감또개", "바나나", "컴퓨터", "포도", "달볓", "옅구름", "그루잠", "나래", "다솜", "비나리", "미쁘다", "도서관", "이플"]


@available(iOS 13.0, *)
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var filteredData: [String] = []
    
    let koreanStringSearchHelper: KoreanStringSearchHelper = KoreanStringSearchHelper(data: [])

    @IBAction func initialSwitchCallback(_ sender: UISwitch) {
        if sender.isOn {
            koreanStringSearchHelper.setInitialMatching(value: true)
        } else {
            koreanStringSearchHelper.setInitialMatching(value: false)
        }
        filteredData = koreanStringSearchHelper.getMatchedDatas(text: searchBar.text ?? "")
        table.reloadData()
    }
    
    @IBAction func partialSwitchCallback(_ sender: UISwitch) {
        if sender.isOn {
            koreanStringSearchHelper.setPartialMatching(value: true)
        } else {
            koreanStringSearchHelper.setPartialMatching(value: false)
        }
        filteredData = koreanStringSearchHelper.getMatchedDatas(text: searchBar.text ?? "")
        table.reloadData()
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        koreanStringSearchHelper.setDatas(datas: datas)
        
        self.table.dataSource = self
        self.table.delegate = self
        self.searchBar.delegate = self
        self.searchBar.placeholder = "검색어를 입력하세요."
        
        filteredData = datas
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredData = koreanStringSearchHelper.getMatchedDatas(text: searchText)
        table.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
}

