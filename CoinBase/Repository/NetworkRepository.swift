//
//  NetworkRepository.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation
import Combine

class NetworkRepository: ObservableObject {
    
    private let networkService: NetworkService
    
    
    init(networkService: NetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    
    func getAllCoins(offset: Int) -> AnyPublisher<[Coin], Error> {
          return Future<[Coin], Error> { promise in
              self.networkService.makeRequest(endpoint: "/coins?limit=20&offset=\(offset)", method: .GET) { (result: Result<Response<CoinData>, Error>) in
                  switch result {
                  case .success(let response):
                      promise(.success(response.data.coins))
                  case .failure(let error):
                      promise(.failure(error))
                  }
              }
          }
          .eraseToAnyPublisher()
      }
    
    
    func getCoinById(coinUUID: String) -> AnyPublisher<Coin, Error> {
        return Future<Coin, Error> { promise in
            self.networkService.makeRequest(endpoint: "/coin/\(coinUUID)", method: .GET) { (result: Result<Response<CoinDetails>, Error>) in
                switch result {
                case .success(let response):
                    promise(.success(response.data.coin))
                case .failure(let error): 
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func getCoinHistory(coinUUID: String, timePeriod: TimePeriod = TimePeriod.oneYear) -> AnyPublisher<[CoinHistoryItem], Error> {
        return Future<[CoinHistoryItem], Error> { promise in
            self.networkService.makeRequest(endpoint: "/coin/\(coinUUID)/price-history?timePeriod=\(timePeriod.rawValue)", method: .GET) { (result: Result<Response<CoinHistoryData>, Error>) in
                switch result {
                case .success(let response):
                    promise(.success(response.data.history))
                case .failure(let error): 
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}
