//
//  MoviesView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import Kingfisher

struct MoviesView: View {
    
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(mediaModel.movies) { movie in
                            NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: movie, type: "movie")) {
                                VStack {
                                    KFImage(URL(string: "\(imageURL)\(movie.poster)"))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geo.size.width-20)
                                        .cornerRadius(20)
                                        .overlay(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.black, lineWidth: 10)
                                                VStack {
                                                    Spacer()
                                                    HStack {
                                                        ScoreView(score: movie.score)
                                                        Spacer()
                                                    }
                                                    .padding(.bottom,-35)
                                                    .padding(.leading,35)
                                                }
                                            }
                                        )
                                        .padding(.top,10)
                                    Text(movie.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top,30)
                                    Text(movie.release_date)
                                        .font(.headline)
                                    Spacer()
                                }
                                .padding(.horizontal,10)
                            }
                        }
                    }
                })
            }
            .navigationBarTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
