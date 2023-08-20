//
//  ScoresService.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

class ScoresInteractor {
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func searchScore(by date: String) async -> [Score] {
        
        let requestData = ScoresRequest.getScoresByDate(date)
        
        do {
            let scores: [Score] = try await requestManager.perform(requestData)
            
            return scores
        } catch {
            
            print(error.localizedDescription)
            return []
        }
    }
}
