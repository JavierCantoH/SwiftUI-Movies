//
//  ContentView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 27/10/21.
//

import SwiftUI
import Kingfisher

struct TMDBView: View {
    
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                TabView {
                    MoviesView(mediaModel: mediaModel)
                        .tabItem {
                            Label("Movies", systemImage: "film.fill")
                        }
                    SeriesView(mediaModel: mediaModel)
                        .tabItem {
                            Label("Series", systemImage: "tv.fill")
                        }
                }
                .accentColor(.red)
            }
        }
    }
}

struct TMDBView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}
