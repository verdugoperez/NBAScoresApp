//
//  Standing.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 15/08/23.
//

import Foundation

enum Conference: String, Codable {
    case Eastern
    case Western
}

struct Standing: Codable, FavouriteTeamSelected {
    let key: String
    let city: String
    let name: String
    let conference: Conference
    let wins: Int
    let losses: Int
    let conferenceRank: Int
    var favouriteTeam: FavouriteTeamEntity?
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case city = "City"
        case name = "Name"
        case conference = "Conference"
        case wins = "Wins"
        case losses = "Losses"
        case conferenceRank = "ConferenceRank"
    }
}
