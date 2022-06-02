@available(iOS 13.0, *)
open class KoreanStringSearchHelper {
    let hangle = [
                    ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"],
                    ["ㅏ","ㅐ","ㅑ","ㅒ","ㅓ","ㅔ","ㅕ","ㅖ","ㅗ","ㅘ","ㅙ","ㅚ","ㅛ","ㅜ","ㅝ","ㅞ","ㅟ","ㅠ","ㅡ","ㅢ","ㅣ"],
                    ["","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ","ㄻ","ㄼ","ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ","ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
                ]
    
    private var filteredData: [String]!
    private var dataArray: [String]!
    
    private var initialMatching: Bool = true
    private var partialMatching: Bool = true
    
    public init(data: [String]) {
        dataArray = data
    }
    
    public func setDatas(datas: [String]){
        dataArray = datas
    }
    
    public func addData(data: String){
        dataArray.append(data)
    }
    
    public func removeData(data: String){
        guard let tmp = dataArray.firstIndex(of: data) else { return }
        dataArray.remove(at:tmp)
    }
    
    public func setInitialMatching(value: Bool){
        self.initialMatching = value
    }
    
    public func setPartialMatching(value: Bool){
        self.partialMatching = value
    }
    
    public func getMatchedDatas(text: String) -> [String] {
        
        if text == "" {
            return dataArray
        }
        
        filteredData = []
        
        var idxSetPriority: Set<Int> = []
        
        if (isOnlyInitial(word: text)){
            if (initialMatching){
                for i in 0...(dataArray.count - 1) {
                    let convertedData = convertToInitial(word: dataArray[i])
                    
                    if (convertedData.starts(with: text)) {
                        idxSetPriority.insert(i)
                    }
                    
                    if (dataArray[i].starts(with: text)) {
                        idxSetPriority.insert(i)
                    }
                }
            } else {
                for i in 0...(dataArray.count - 1) {
                    if (dataArray[i].starts(with: text)) {
                        idxSetPriority.insert(i)
                    }
                }
            }
        } else { // partial matching
            if (partialMatching) {
                for i in 0...(dataArray.count - 1) {
                    let convertedData = convertToPartial(word: dataArray[i])
                    
                    if (convertedData.starts(with: convertToPartial(word: text))) {
                        idxSetPriority.insert(i)
                    }
                    
                    if (dataArray[i].starts(with: text)) {
                        idxSetPriority.insert(i)
                    }
                }
            } else {
                for i in 0...(dataArray.count - 1) {
                    if (dataArray[i].starts(with: text)) {
                        idxSetPriority.insert(i)
                    }
                }
            }
        }
        
        idxSetPriority.forEach({filteredData.append(dataArray[$0])})
        
        return filteredData
    }
    
    private func convertToInitial(word: String) -> String {
        var result = ""
        
        for char in word {
            let octal = char.unicodeScalars[char.unicodeScalars.startIndex].value
            if 44032...55203 ~= octal { // 유니코드가 한글값 일때만 분리작업
                let index = (octal - 0xac00) / 28 / 21
                result = result + hangle[0][Int(index)]
            }
        }
        
        return result
    }
    
    
    private func convertToPartial(word: String) -> String {
        return word.reduce("") { result, char in
            if case let code = Int(String(char).unicodeScalars.reduce(0){$0 + $1.value}) - 44032, code > -1 && code < 11172 {
                                let cho = code / 21 / 28, jung = code % (21 * 28) / 28, jong = code % 28;
                                return result + hangle[0][cho] + hangle[1][jung] + hangle[2][jong]
                        }
                        return result + String(char)
                    }
    }
    
    private func isOnlyInitial(word: String) -> Bool {
        var onlyInitial = false
        for char in word {
            if 0 < hangle[0].filter({ $0.contains(char)}).count {
                onlyInitial = true
            } else {
                onlyInitial = false
                break
            }
        }
        return onlyInitial
    }
}

