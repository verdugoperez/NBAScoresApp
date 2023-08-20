//
//  ScoresRequest.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

enum ScoresRequest: RequestProtocol {
    case getScoresByDate(_ dateString: String)
    
    var path: String {
        switch self {
        case let .getScoresByDate(dateString):
            return "/v3/nba/scores/json/GamesByDate/\(dateString)"
        }
    }

    var requestType: RequestType {
        .GET
    }
}

