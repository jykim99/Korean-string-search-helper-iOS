# KoreanStringSearchHelper

[![Version](https://img.shields.io/cocoapods/v/KoreanStringSearchHelper.svg?style=flat)](https://cocoapods.org/pods/KoreanStringSearchHelper)
[![License](https://img.shields.io/cocoapods/l/KoreanStringSearchHelper.svg?style=flat)](https://cocoapods.org/pods/KoreanStringSearchHelper)
[![Platform](https://img.shields.io/cocoapods/p/KoreanStringSearchHelper.svg?style=flat)](https://cocoapods.org/pods/KoreanStringSearchHelper)
[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/KoreanStringSearchHelper)

## Summary
This library helps Korean string **initial matching(초성 매칭)** and **partial matching(부분 매칭)**.

## Demo App

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![merge_from_ofoct-2](https://user-images.githubusercontent.com/42582071/171797909-7103ea01-6b0e-4375-bee5-6799502099d3.jpg)

## Example

```swift
let datas: [String] = ["예그리나", "늘품", "아슬라", "가온누리"]

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
```

## Documentation
### getMatchedDatas(text: String) -> [String]
Return data set that matches with given text.
### setInitialMatching(value: Bool) -> void
Chooose whether user initial matching.
### setPartialMatching(value: Bool) -> void
Chooose whether user partial matching.
### setDatas(datas: [Stinrg]) -> void
Set data set to search.
### addData(data: Stinrg) -> void
Add data set to search.
### removeData(data: Stinrg) -> void
Remove data set to search.

## Installation

KoreanStringSearchHelper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KoreanStringSearchHelper'
```

## License

KoreanStringSearchHelper is available under the MIT license. See the LICENSE file for more info.
