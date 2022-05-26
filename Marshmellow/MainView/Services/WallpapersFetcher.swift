//
//  WallpapersFetcher.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

class WallpapersFetcher: ObservableObject {
	
	var mainUrl = "http://167.99.51.18/api/wallpapers/"
	var mainLive = "http://167.99.51.18/api/wallpapers/live/"
	var urlStatic = "static/1" // /api/wallpapers/static/1
	//var urlLive = "live/1" // /api/wallpapers/live/1
	var testUrl = "http://167.99.51.18/media/wallpapers/static/Neon/3396887.jpg"
	var test2Url = "http://167.99.51.18/media/wallpapers/static/Witcher/wp10477382-witcher-iphone-wallpapers.jpg"
	
	// http://159.223.194.4/api/wallpapers/
	// http://159.223.194.4/api/wallpapers/live/
	//"url": "/media/wallpapers/static/Neon/4629626.jpg",
	//"preview_url": "/media/wallpapers/static/Neon/4629626.jpg"
	
	// /media/wallpapers/live/sky/4434209.mp4
	// /media/wallpapers/live/sky/4434209.jpg
	
	//@Published var wallpapers: [CategoryModel] = []
	@Published var wallpapers: WallpaperApiModel = WallpaperApiModel(catStatic: [], newCats: [], popCats: [])
	@Published var errMessage: String? = nil
	@Published var isLoading: Bool = false
	
	init() {
		fetchAllWallpapers()
	}
	
	func fetchAllWallpapers() {
		isLoading = true
		errMessage = nil
		let service = NetworkService()
		
		service.fetchWallpapers(fetchUrl: FetchUrlsE.wallpapers.rawValue) { [unowned self] result in
			self.isLoading = false
			switch result {
				case .success(let wallpapers):
					self.wallpapers = wallpapers
				case .failure(let err):
					self.errMessage = err.localizedDescription
					print(err) // err.description
			}
		}
	}
	
	
}

enum FetchUrlsE: String {
	case wallpapers = "http://167.99.51.18/api/wallpapers/"
	case live = "http://167.99.51.18/api/wallpapers/live/"
}

enum APIErrorE: Error, CustomStringConvertible {
	case badURL
	case badResponse(statusCode: Int)
	case url(URLError?)
	case parsing(DecodingError?)
	case unknown
	
	var localizedDescription: String {
		// feedback for users
		switch self {
			case .badURL, .parsing, .unknown: return "Sorry, something went wrong."
			case .badResponse(_): return "Sorry, the connection to our server failed."
			case .url(let err): return err?.localizedDescription ?? "Something went wrong"
		}
	}
	
	var description: String {
		// info for debugging
		switch self {
			
			case .badURL: return "invalid URL"
			case .badResponse(statusCode: let statusCode): return "bad response with status code \(statusCode)"
			case .url(let err): return err?.localizedDescription ?? "url session err"
			case .parsing(let err): return "parsing error \(err?.localizedDescription ?? "")"
			case .unknown: return "unknown error"
		}
	}
}

