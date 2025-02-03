//
//  LoadingResourcesFromYourAppBundle.swift
//  WordScramble
//
//  Created by Marko Zivanovic on 3.2.25..
//

import SwiftUI

struct LoadingResourcesFromYourAppBundle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
//    func testBundles() {
//        if let fileURL = Bundle.main.url(forResource: "someFile", withExtension: "txt") {
//            //MARK: - Xcode message: init(contentsOf:)' was deprecated in iOS 18: Use `init(contentsOf:encoding:)` instead
//            if let fileContents = try? String(contentsOf: fileURL) {
//                //MARK: - We loaded the file into a string
//            }
//        }
//    }
    
    //MARK: - iOS 18
    func testBundles2() {
        if let fileURL = Bundle.main.url(forResource: "someFile", withExtension: "txt") {
            do {
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                //MARK: - Checking loading content
                print(fileContents)
            } catch {
                //MARK: - Error message
                print("Error while loading file \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    LoadingResourcesFromYourAppBundle()
}
