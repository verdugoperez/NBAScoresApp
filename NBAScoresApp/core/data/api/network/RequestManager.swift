//
//  RequestManager.swift
//  NBAScoresApp
//
//  Created by Manuel Alejandro Verdugo Pérez on 09/08/23.
//

import Foundation

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
  let apiManager: APIManagerProtocol
  let parser: DataParserProtocol

  init(
    apiManager: APIManagerProtocol = APIManager(), parser: DataParserProtocol = DataParser()) {
    self.apiManager = apiManager
    self.parser = parser
  }

  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
    let data = try await apiManager.perform(request)
    let decoded: T = try parser.parse(data: data)
      
    return decoded
  }
}
