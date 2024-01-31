//
//  NetworkManager.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

// Create a Base class for making generic Model Network request with a json response.
class NetworkManager<T: Decodable> {
    private let networkService: NetworkService
    private let dataDecoder: DataDecoder
    
    init(networkService: NetworkService, dataDecoder: DataDecoder) {
        self.networkService = networkService
        self.dataDecoder = dataDecoder
    }
    
    func getPosts(url: URL) async throws -> T {
        do {
            let data = try await networkService.fetchData(from: url)
            let postModels = try dataDecoder.decode(T.self, from: data)
            return postModels
        } catch {
            debugPrint(error)
            throw NetworkError.decodingError
        }
    }
    
    /// > PostView try error chaning AppEnvironment
}


