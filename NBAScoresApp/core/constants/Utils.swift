//
//  Utils.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 17/08/23.
//

import Foundation

class FavoriteTeamUtility {
    static func reorderScores(array: inout [Score], originalArray: [Score], favourite: FavouriteTeamEntity?) {
        array.enumerated().forEach { (index, item) in
            array[index].favouriteTeam = nil
        }
        
        guard let team = favourite else {
            array = originalArray
            return
        }
        
        guard let favoriteTeamIndex = array.firstIndex(where: { $0.homeTeam == team.teamId || $0.awayTeam == team.teamId }) else {
            array = originalArray
            return
        }
        let favoriteTeamScore = array.remove(at: favoriteTeamIndex)
        array.insert(favoriteTeamScore, at: 0)
        array[0].favouriteTeam = favourite
    }
    
    
    static func reorderStandings(array: inout [Standing], favourite: FavouriteTeamEntity?) {
        array.enumerated().forEach { (index, item) in
            array[index].favouriteTeam = nil
        }
        
        guard let team = favourite else {
            return
        }
        
        guard let favoriteTeamIndex = array.firstIndex(where: { $0.key == team.teamId }) else {
            return
        }
       
        array[favoriteTeamIndex].favouriteTeam = favourite
    }
}

