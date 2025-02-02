//
//  IntroducingListYourBestFriend.swift
//  WordScramble
//
//  Created by Marko Zivanovic on 2.2.25..
//

import SwiftUI

struct IntroducingListYourBestFriend: View {
    
    let starWarsCharacters = ["Luke Skywalker", "Darth Vader", "Han Solo", "Princess Leia", "Obi-Wan Kenobi"]
    
    var body: some View {
//        List {
//            //            Text("Hello, World!")
//            //            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            //            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Section("Section 1") {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            }
//            Section("Section 2") {
//                ForEach(0..<5) {
//                    Text("Dynamic Row \($0)")
//                }
//            }
//            Section("Section 3") {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            }
//            .listStyle(.grouped)
//        }
        
        List(starWarsCharacters, id: \.self) {
            Text("\($0)")
        }
    }
}

#Preview {
    IntroducingListYourBestFriend()
}
