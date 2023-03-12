//
//  Video.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

struct Video: Identifiable {
    
    var id: Int
    var name: String
    var key: String
    var site: String
    var type: String
    
}

extension Video {
    
    static let dummy = Video(id: 01, name: "Free Guy", key: "jRn48HxssPI", site: "YouTube", type: "Clip")
    
}
