//
//  StandingsInteractor.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 15/08/23.
//

import Foundation

class StandingsInteractor {
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func searchStanding(by year: String) async -> [Standing] {
        
        let requestData = StandingsRequest.getStandingsBy(year)
        
        do {
            let standings: [Standing] = try await requestManager.perform(requestData)
            
            return standings
        } catch {
            
            print(error.localizedDescription)
            return []
        }
    }
}
