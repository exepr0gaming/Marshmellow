//
//  NetworkService.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import Foundation

struct NetworkService {
	
	// MARK: - Fetch T
	func fetch<T: Decodable>(_ type: T.Type, fetchUrl: String, completion: @escaping(Result<T, APIErrorE>) -> Void) async {
		guard let url = URL(string: FetchUrlsE.apiURL.rawValue + fetchUrl) else {
			let err = APIErrorE.badURL
			completion(Result.failure(err))
			return
		}
		
		let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let err = error as? URLError { completion(Result.failure(APIErrorE.url(err))) }
			if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
				completion(Result.failure(APIErrorE.badResponse(statusCode: response.statusCode)))
			}
			guard let data = data else { return }
			
			do {
				let decodableData = try JSONDecoder().decode(type.self, from: data)
				completion(Result.success(decodableData))
			} catch {
				completion(Result.failure(APIErrorE.parsing(error as? DecodingError)))
			}
			
		}.resume()
	} // Fetch T
	
	// MARK: - Fetch Wallpapers
	func fetchWallpapers(fetchUrl: FetchUrlsE.RawValue, completion: @escaping(Result<WallpaperApiModel, APIErrorE>) -> Void) async {
		guard let url = URL(string: FetchUrlsE.apiURL.rawValue + fetchUrl) else {
			let err = APIErrorE.badURL
			completion(Result.failure(err))
			return
		}
		
		let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let err = error as? URLError { completion(Result.failure(APIErrorE.url(err))) }
			if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
				completion(Result.failure(APIErrorE.badResponse(statusCode: response.statusCode)))
			}
			guard let data = data else { return }
			
			do {
				let decodableData = try JSONDecoder().decode(WallpaperApiModel.self, from: data)
				completion(Result.success(decodableData))
			} catch {
				completion(Result.failure(APIErrorE.parsing(error as? DecodingError)))
			}
			
		}.resume()
	} // fetchWallpapers
	
}
