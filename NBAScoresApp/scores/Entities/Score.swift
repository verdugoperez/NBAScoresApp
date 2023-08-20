//
//  Score.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

protocol FavouriteTeamSelected {
    var favouriteTeam: FavouriteTeamEntity? { get set }
}

struct Score: Codable, FavouriteTeamSelected {
    let gameId: Int
    let homeTeam: String
    let awayTeam: String
    let dateTime: String
    let awayTeamScore: Int
    let homeTeamScore: Int
    var favouriteTeam: FavouriteTeamEntity?
    
    var formattedHireDate: String {
        DateFormatter.formattedTimeString(from: dateTime, inputDateFormat: "yyyy-MM-dd'T'HH:mm:ss", outputDateFormat: "HH:mm")
    }
    
    enum CodingKeys: String, CodingKey {
        case gameId = "GameID"
        case homeTeam = "HomeTeam"
        case awayTeam = "AwayTeam"
        case dateTime = "DateTime"
        case awayTeamScore = "AwayTeamScore"
        case homeTeamScore = "HomeTeamScore"
    }
}
