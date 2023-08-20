//
//  DataParser.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

protocol DataParserProtocol {
  func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserProtocol {
  private var jsonDecoder: JSONDecoder

  init(jsonDecoder: JSONDecoder = JSONDecoder()) {
    self.jsonDecoder = jsonDecoder
  }

  func parse<T: Decodable>(data: Data) throws -> T {
    return try jsonDecoder.decode(T.self, from: data)
  }
}

