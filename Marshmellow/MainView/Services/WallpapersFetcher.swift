//
//  WallpapersFetcher.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

//enum ConstsE: String {
//	case apiUrl = "http://159.223.194.4"
//	case testURL = "http://159.223.194.4/media/wallpapers/static/Various/4284291.jpg"
//}

class WallpapersFetcher: ObservableObject {
	
	@Published private(set) var wallpapers: WallpaperApiModel = WallpaperApiModel(catStatic: [], newCats: [], popCats: [])
	@Published var detailWallpaper: WallpaperCategoryUrlsModel = WallpaperCategoryUrlsModel(url: "", previewUrl: "")
	@Published var detailWallpaperImage: Image = Image("")
	
	@Published var detailCategory: DetailCategoryModel = DetailCategoryModel(id: 1, nameCategory: "", array: [WallpaperCategoryUrlsModel(url: "", previewUrl: "")])
	@Published var gridCategory: DetailCategoryModel = DetailCategoryModel(id: 1, nameCategory: "", array: [WallpaperCategoryUrlsModel(url: "", previewUrl: "")])
	@Published var selectedStaticIndex: Int = 0 { didSet {
			Task.init { await fetchWallpaperCategory(detailCategoryUrl: nil, selectedIndexOfCat: selectedStaticIndex, staticOrLive: .staticCat)
			print("###selectedStaticIndex=\(selectedStaticIndex)")
	}}}
	@Published var linkToFetchCategory: String = "/api/wallpapers/static2/1" {
		didSet { Task.init { await fetchWallpaperCategory(detailCategoryUrl: linkToFetchCategory, selectedIndexOfCat: nil, staticOrLive: .staticCat) }
			print("###linkToFetchCategory=\(linkToFetchCategory)")
		}
	}
	
	
	@Published private(set) var liveWalls: [CategoryModel] = []
	@Published var detailLiveCat: DetailCategoryModel = DetailCategoryModel(id: 1, nameCategory: "", array: [WallpaperCategoryUrlsModel(url: "", previewUrl: "")])
	@Published var gridLiveCat: DetailCategoryModel = DetailCategoryModel(id: 1, nameCategory: "", array: [WallpaperCategoryUrlsModel(url: "", previewUrl: "")])
	@Published var selectedLiveIndex: Int = 0 { didSet {
		Task.init { await fetchWallpaperCategory(detailCategoryUrl: nil, selectedIndexOfCat: selectedLiveIndex, staticOrLive: .liveCat)
			print("###selectedLiveIndex=\(selectedLiveIndex)")
	}}}
	@Published var linkToFetchLiveCategory: String = "/api/wallpapers/live2/1" {
		didSet { Task.init { await fetchWallpaperCategory(detailCategoryUrl: linkToFetchLiveCategory, selectedIndexOfCat: nil, staticOrLive: .liveCat) }
			print("###linkToFetchCategory=\(linkToFetchCategory)")
		}
	}
	
	

	
	@Published var errMessage: String? = nil
	@Published var isLoading: Bool = false
	
	init() {
		Task.init {
			await fetchAllWallpapers()
			await fetchLiveWallpapers()
			await fetchWallpaperCategory(detailCategoryUrl: nil, selectedIndexOfCat: selectedStaticIndex, staticOrLive: .staticCat)
			await fetchWallpaperCategory(detailCategoryUrl: nil, selectedIndexOfCat: selectedLiveIndex, staticOrLive: .liveCat)
		}
		//fetchWallpaperCategory(linkCategory: "/api/wallpapers/static2/5")
		//fetchLiveCategory(linkCategory: FetchUrlsE.live.rawValue + "\(currentSelectionCat + 1)") // /api/wallpapers/live/1
	}
	
	func fetchAllWallpapers() async {
//		Task {
//			 isLoading = true
//			 errMessage = nil
//		}
	
		let service = NetworkService()
		print("WTF DUDE= fetchAllWallpapers started")
		
		await service.fetchWallpapers(fetchUrl: FetchUrlsE.allWalls.rawValue) { [unowned self] result in
//			isLoading = true
//			errMessage = nil
			DispatchQueue.main.async {
					self.isLoading = false
					switch result {
						case .success(let wallpapers):
							self.wallpapers = wallpapers
							print("WTF DUDE= \(wallpapers.catStatic.last?.link ?? "")")
						case .failure(let err):
							self.errMessage = err.localizedDescription
							print(err) // err.description
					}
			}
		}
	}
	
	func fetchLiveWallpapers() async {
		
		let service = NetworkService()
		
		await service.fetch([CategoryModel].self, fetchUrl: FetchUrlsE.live.rawValue) { [unowned self] result in
//			isLoading = true
//			errMessage = nil
			DispatchQueue.main.async {
				self.isLoading = false
				switch result {
					case .success(let liveWalls):
						self.liveWalls = liveWalls
					case .failure(let err):
						self.errMessage = err.localizedDescription
						print("@@@ErrorfetchLiveWallpapers with err= \(err.localizedDescription)")
				}
			}
		} //(fetchUrl: FetchUrlsE.live.rawValue) { [unowned self] result in
	}
	
	func fetchWallpaperCategory(detailCategoryUrl: String?, selectedIndexOfCat: Int?, staticOrLive: GridE ) async {
//		isLoading = true
//		errMessage = nil
		let service = NetworkService()
		var catUrl: String = ""
		switch staticOrLive {
			case .staticCat: catUrl = FetchUrlsE.staticW.rawValue
			case .liveCat: catUrl = FetchUrlsE.live.rawValue
		}
		guard
			let url = detailCategoryUrl != nil
				? detailCategoryUrl
				: catUrl + "\(selectedIndexOfCat! + 1)"
		else { return }
		
		await service.fetch(DetailCategoryModel.self, fetchUrl: url) { [unowned self] result in
			DispatchQueue.main.async {
				//self.isLoading = false
				switch result {
					case .success(let getCategory):
						switch staticOrLive {
							case .staticCat:
								if detailCategoryUrl != nil {
									self.detailCategory = getCategory
									//self.catBlocksCount = self.detailCategory.array.count / 4
									print("%%%fetchDetailCategory!!! Detail= \(self.detailCategory.array[0].url)")
								} else {
									self.gridCategory = getCategory
									print("%%%fetchGgridCategory!!! Detail= \(self.gridCategory.array[0].url)")
								}
								
							case .liveCat:
								if detailCategoryUrl != nil {
									self.detailLiveCat = getCategory
									//self.catBlocksCount = self.detailCategory.array.count / 4
									print("%%%fetchDetailCategory!!! Detail= \(self.detailCategory.array[0].url)")
								} else {
									self.gridLiveCat = getCategory
									print("%%%fetchGgridCategory!!! Detail= \(self.gridCategory.array[0].url)")
								}
						}
						
					case .failure(let err):
						self.errMessage = err.localizedDescription
						print("Error%%%wallpaperCategory!!!= \(self.detailCategory.array), with error= \(err)")
				}
			}
		}
	}
	
	
//	// MARK: - Live Categories
//	@Published private(set) var categoryUrls: [WallpaperCategoryUrlsModel] = []
//	
//	func fetchLiveCategory(currentSelectionCat: Int) async {
////		isLoading = true
////		errMessage = nil
//		let service = NetworkService()
//		let url = FetchUrlsE.live.rawValue + "\(currentSelectionCat + 1)"
//		print("@@@fetchCategory@@@")
//		
//		await service.fetch([WallpaperCategoryUrlsModel].self, fetchUrl: url) { result in
//			DispatchQueue.main.async {
////				self.isLoading = false
//				switch result {
//					case .success(let categoryUrls):
//						self.categoryUrls = []
//						self.categoryUrls = categoryUrls
//					//	self.catBlocksCount = categoryUrls.count / 4
//						print("@@@fetchLiveCategory!!!= \(categoryUrls[0].url)")
//					case .failure(let err):
//					//	self.errMessage = err.localizedDescription
//						print("Error @@@ fetchLiveCategory!!!=  with error= \(err)")
//				}
//			}
//		}
//	}

	
	
	// MARK: - Preview Helpers
//	static func errorState() async -> WallpapersFetcher {
//		let fetcher = await WallpapersFetcher()
//		fetcher.errMessage = APIErrorE.url(URLError(.notConnectedToInternet)).localizedDescription
//		return fetcher
//	}
//	
//	static func successState() async -> WallpapersFetcher {
//		let fetcher = await WallpapersFetcher()
//		fetcher.wallpapers = WallpaperApiModel.wallpaperExample()
//		return fetcher
//	}
	
}


