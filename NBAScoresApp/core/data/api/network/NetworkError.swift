//
//  NetworkError.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "El servidor regresó una respuesta inválida."
    case .invalidURL:
      return "La URL es inválida."
    }
  }
}
