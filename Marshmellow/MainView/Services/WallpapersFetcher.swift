//
//  WallpapersFetcher.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

class WallpapersFetcher: ObservableObject {
	
	var mainUrl = "/api/wallpapers/" // http://167.99.51.18/api/wallpapers/
	var mainLive = "/api/wallpapers/live/" // http://167.99.51.18/api/wallpapers/live/
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
	@Published var wallpaperCategory: [WallpaperCategoryModel] = []
	//@Published var wallpaperSelectedCat: Int = 1
	@Published var currentSelectionCat: Int = 0
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
			DispatchQueue.main.async {
				self.isLoading = false
				switch result {
					case .success(let wallpapers):
						self.wallpapers = wallpapers
						print("WTF DUDE= \(wallpapers.catStatic.last?.link)")
					case .failure(let err):
						self.errMessage = err.localizedDescription
						print(err) // err.description
				}
			}
			
		}
	}
	
	func fetchWallpaperCategory(linkCategory: String) {
		isLoading = true
		errMessage = nil
		let service = NetworkService()
		
		service.fetch([WallpaperCategoryModel].self, fetchUrl: linkCategory) { [unowned self] result in
			DispatchQueue.main.async {
				self.isLoading = false
				switch result {
					case .success(let wallpaperCategory):
						self.wallpaperCategory = wallpaperCategory
						print("wallpaperCategory!!!= \(wallpaperCategory)")
					case .failure(let err):
						self.errMessage = err.localizedDescription
						print(err) // err.description
				}
			}
		}
	}
	
	// MARK: - Preview Helpers
	static func errorState() -> WallpapersFetcher {
		let fetcher = WallpapersFetcher()
		fetcher.errMessage = APIErrorE.url(URLError(.notConnectedToInternet)).localizedDescription
		return fetcher
	}
	
	static func successState() -> WallpapersFetcher {
		let fetcher = WallpapersFetcher()
		fetcher.wallpapers = WallpaperApiModel.wallpaperExample()
		return fetcher
	}
	
}


