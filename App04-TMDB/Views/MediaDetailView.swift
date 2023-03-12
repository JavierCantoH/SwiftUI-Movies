//
//  MediaDetailView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 27/10/21.
//

import SwiftUI
import Kingfisher

struct MediaDetailView: View {
    
    @ObservedObject var mediaModel: MediaModel
    var media: Media
    var type: String
    
    var body: some View {
        GeometryReader { geo in
        VStack {
            Text(media.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(media.release_date)
                .font(.caption)
            ScrollView(.vertical, showsIndicators: false) {
                Text(media.overview)
                    .font(.body)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: VideosListView(mediaModel: mediaModel, media: media, type: type)) {
                    HStack {
                        Image(systemName: "tv.and.mediabox")
                        Text("Trailers")
                            .font(.title2)
                            
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(20)
                }
                KFImage(URL(string: "\(imageURL)\(media.poster)"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width-20)
            }
        }
        .padding(.horizontal,10)
        .navigationBarTitle("Movie")
        }
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(mediaModel: MediaModel(), media: Media.dummy, type: "movie")
    }
}
