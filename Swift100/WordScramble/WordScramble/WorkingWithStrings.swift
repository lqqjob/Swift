//
//  WorkingWithStrings.swift
//  WordScramble
//
//  Created by liqiang on 2024/3/16.
//

import SwiftUI

struct WorkingWithStrings: View {
    var body: some View {
        
        var input = "a b c"
        var letters = input.components(separatedBy: " ")

         input = """
                    a
                    b
                    c
                    """
        letters = input.components(separatedBy: "\n")
        
        let letter = letters.randomElement() ?? "" //随机读取
        let trimmed = letter.trimmingCharacters(in: .whitespacesAndNewlines)//修剪字符串开头和结尾的所有空格
        
        //检查拼写错误
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        return Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WorkingWithStrings()
}
