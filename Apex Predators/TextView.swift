//
//  TextView.swift
//  Apex Predators
//
//  Created by Amila Wijayarathna on 2024-11-23.
//

import Foundation
import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
