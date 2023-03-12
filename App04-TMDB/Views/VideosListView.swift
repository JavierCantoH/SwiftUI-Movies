//
//  VideosListView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

struct VideosListView: View {
    
    @ObservedObject var mediaModel: MediaModel
    var media: Media
    var type: String
    @State var videos = [Video]()
    
    var body: some View {
        VStack {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: WebView(html: "\(youtubeURL)\(video.key)")) {
                        VStack(alignment: .leading) {
                            Text(video.name)
                                .font(.title2)
                            Text(video.type)
                                .font(.headline)
                        }
                    }
                    
                }
            }
            .listStyle(InsetListStyle())
            .navigationBarTitle(media.title)
        }
        .onAppear {
            mediaModel.loadVideos(type: type, id: media.id) { returnedVideos in
                if returnedVideos.count > 0 {
                    videos.append(contentsOf: returnedVideos)
                }
            }
        }
    }
}

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        VideosListView(mediaModel: MediaModel(), media: Media.dummy, type: "movie")
    }
}
