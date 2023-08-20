//
//  StandingsRequest.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 15/08/23.
//

import Foundation

enum StandingsRequest: RequestProtocol {
    case getStandingsBy(_ year: String)
    
    var path: String {
        switch self {
        case let .getStandingsBy(year):
            return "/v3/nba/scores/json/Standings/\(year)"
        }
    }

    var requestType: RequestType {
        .GET
    }
}
