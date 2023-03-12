//
//  WebView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let html: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: html)!))
        uiView.allowsBackForwardNavigationGestures = false
    }
}
