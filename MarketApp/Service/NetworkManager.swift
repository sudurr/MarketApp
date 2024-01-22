//
//  NetworkManager.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 21.01.2024.
//

import UIKit
import Foundation

final class NetworkManager: NetworkProtocol {
    static let shared = NetworkManager()

    private let cardComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "shans.d2.i-partner.ru"
        components.path = "/api/ppp/index/"
        return components
    }()

    private let baseComponents: URLComponents = {
            var components = URLComponents()
            components.scheme = "http"
            components.host = "shans.d2.i-partner.ru"
            return components
        }()

        private let itemComponents: URLComponents = {
            var components = URLComponents()
            components.scheme = "http"
            components.host = "shans.d2.i-partner.ru"
            components.path = "/api/ppp/item/"
            return components
        }()

    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ()) {
        var components = cardComponents
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

extension NetworkManager {
    func loadImage(from urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {

        var imageComponents = baseComponents
        imageComponents.path = urlString
        print(imageComponents.string!)


        guard let url = imageComponents.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data, let image = UIImage(data: data) else {

                completion(.failure(NetworkError.invalidData))
                return
            }

            completion(.success(image))
        }

        task.resume()
    }

    enum NetworkError: Error {
        case invalidURL
        case invalidData
    }
}

protocol NetworkProtocol: AnyObject {
    func fetchCards(offset: Int, limit: Int, completion: @escaping (Result<Cards, Error>) -> ())
    func loadImage(from urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ())
}
