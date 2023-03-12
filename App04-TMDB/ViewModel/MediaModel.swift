//
//  File.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 27/10/21.
//

import SwiftUI
import Alamofire

class MediaModel: ObservableObject {
    
    @Published var movies = [Media]()
    @Published var series = [Media]()
    
    init() {
        loadMovies()
        loadSeries()
    }
    //    obtener movies de la api y guardarlas en movies
    func loadMovies() {
        
        let URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
            AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

                let json = try! JSON(data: data.data!)
                //                print(json)
//                print(json["results"].count)
                
                var media: Media
                for movie in json["results"] {
//                    print(movie.1["title"].stringValue)
                    media = Media(
                        id: movie.1["id"].intValue,
                        title: movie.1["title"].stringValue,
                        overview: movie.1["overview"].stringValue,
                        poster: movie.1["poster_path"].stringValue,
                        release_date: movie.1["release_date"].stringValue,
                        score: movie.1["vote_average"].doubleValue
                    )
                    self.movies.append(media)
                }
                
            }
    }
    //    obtener series de la api y guardarlas en series
    func loadSeries() {
        
        let URL = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(apikey)&language=en-US&page=1"
        
            AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

                let json = try! JSON(data: data.data!)
                
                var media: Media
                for serie in json["results"] {
                    media = Media(
                        id: serie.1["id"].intValue,
                        title: serie.1["name"].stringValue,
                        overview: serie.1["overview"].stringValue,
                        poster: serie.1["poster_path"].stringValue,
                        release_date: serie.1["first_air_date"].stringValue,
                        score: serie.1["vote_average"].doubleValue
                    )
                    self.series.append(media)
                }
                
            }
    }
    //    obtener videos de la api de forma asincrona
    func loadVideos(type: String, id: Int, handler: @escaping(_ returnedVideos: [Video]) ->()) {
        
        let URL = "https://api.themoviedb.org/3/\(type)/\(id)/videos?api_key=\(apikey)&language=en-US"
        
        var videos = [Video]()
        
            AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

                let json = try! JSON(data: data.data!)
                
                var video: Video
                for trailer in json["results"] {
                    video = Video(
                        id: trailer.1["id"].intValue,
                        name: trailer.1["name"].stringValue,
                        key: trailer.1["key"].stringValue,
                        site: trailer.1["site"].stringValue,
                        type: trailer.1["type"].stringValue
                    )
                    videos.append(video)
                }
                
                handler(videos)
                
            }
        
    }
    
}
