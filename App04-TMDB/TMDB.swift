//
//  TMDB.swift
//  App04-TMDB
//
//  Created by Luis Javier Canto Hurtado on 27/10/21.


// CONSTANTES GLOBALES

import SwiftUI

let apikey = "1915c97e6ffe69dc41c96fdfdeb7711b"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOTE1Yzk3ZTZmZmU2OWRjNDFjOTZmZGZkZWI3NzExYiIsInN1YiI6IjYxNjg4MzE0M2E5OTM3MDA0M2YwNjZiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PajSHQJF5Gkh4CISH316b88HAUKDSVXZ8QBKi_AUGbY"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]
let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original"
let youtubeURL = "https://youtu.be/"
