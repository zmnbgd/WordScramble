//
//  ContentView.swift
//  WordScramble
//
//  Created by Marko Zivanovic on 31.1.25..
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var shpwingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                            
                        }
                    }
                }
                
                Section("Score") {
                    Text("Your score is \(score)")
                }
                
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $shpwingError) {
                //MARK: Can work without Ok button
                Button("Ok") {}
            } message: {
                Text(errorMessage)
            }
            //MARK: Challenge. - 1. Word Scramble - Add a toolbar button that calls startGame(), so users can restart with a new word whenever they want to.
            .toolbar {
                Button("New game", action: startGame)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
//        guard answer.count > 0 else { return }
        //MARk: - Challenge: 1. Word Scramble: Disallow answers that are shorter than three letters or are just our start word.
        guard answer.count > 3 else { return }
        
        //MARK: Extra validation to come
        guard isOriginal(word: answer) else {
            wordError(message: "Word used allredy", title: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(message: "Word is not possible", title: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(message: "Word not recognized", title: "You can't just meka them up!")
            return
        }

        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        //MARK: - Challenge 3. - Word Scramble: Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
        score += 1
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt form the Bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(message: String, title: String) {
        errorTitle = title
        errorMessage = message
        shpwingError = true
    }

}

#Preview {
    ContentView()
}
