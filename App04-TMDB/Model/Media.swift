//
//  Media.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 27/10/21.
//

import SwiftUI

struct Media: Identifiable {
    var id: Int
    var title: String
    var overview: String
    var poster: String
    var release_date: String
    var score: Double
}

extension Media{
    static let dummy = Media(id: 1, title: "Dune", overview: "Dune", poster: "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg", release_date: "2021/09/15", score: 8.1)
}
