//
//  APICaller.swift
//  NetflixClone
//
//  Created by Артур Дохно on 04.05.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "eb163767a8f94f0ca9162ca741f2cdb9"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(complection: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                complection(.success(results.results))
            } catch {
                complection(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTv(complection: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                complection(.success(results.results))
            } catch {
                complection(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(complection: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                complection(.success(results.results))
            } catch {
                complection(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRated(complection: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, _, error) in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                complection(.success(results.results))
            } catch {
                complection(.failure(error))
            }
        }
        task.resume()
    }
    
}
