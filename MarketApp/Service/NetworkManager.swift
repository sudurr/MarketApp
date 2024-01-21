//
//  NetworkManager.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 21.01.2024.
//

import Foundation

final class NetworkManager: NetworkProtocol {
    static let shared = NetworkManager()

    private var urlCardsComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "shans.d2.i-partner.ru"
        components.path = "/api/ppp/index/"
        return components
    }()

    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ()) {
        var components = urlCardsComponents
        components.queryItems = [
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]

        guard let url = components.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cards = try decoder.decode(Cards.self, from: data)
                completion(.success(cards))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}

enum NetworkError: Error {
    case invalidURL
    case invalidData
}


protocol NetworkProtocol: AnyObject {
    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ())
}
