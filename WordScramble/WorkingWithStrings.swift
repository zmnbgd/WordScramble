//
//  WorkingWithStrings.swift
//  WordScramble
//
//  Created by Marko Zivanovic on 4.2.25..
//

import SwiftUI

struct WorkingWithStrings: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func testStrings() {
        let input = """
        a
        b
        c
        """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmedLetter = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func testStrings2() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGoods = misspelledRange.location == NSNotFound
    }
}

#Preview {
    WorkingWithStrings()
}
