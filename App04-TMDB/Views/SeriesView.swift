//
//  SeriesView.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import Kingfisher

struct SeriesView: View {
    
    @ObservedObject var mediaModel: MediaModel
    
    var body: some View {
        GeometryReader { geo in
                VStack {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(mediaModel.series) { serie in
                                NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: serie, type: "tv")) {
                                    VStack {
                                        KFImage(URL(string: "\(imageURL)\(serie.poster)"))
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
                                                            ScoreView(score: serie.score)
                                                            Spacer()
                                                        }
                                                        .padding(.bottom,-35)
                                                        .padding(.leading,35)
                                                    }
                                                }
                                            )
                                            .padding(.top,10)
                                        Text(serie.title)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .padding(.top,30)
                                        Text(serie.release_date)
                                            .font(.headline)
                                        Spacer()
                                    }
                                    .padding(.horizontal,10)
                                }
                            }
                        }
                    })
                }
                .navigationBarTitle("Series")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }

}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
