////
////  VideoManager.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 07.06.2022.
////
//
//import Foundation
//
//class VideoManager: ObservableObject {
//	@Published private(set) var categoryUrls: [WallpaperCategoryUrlsModel] = []
//	@Published var selectedIndexOfCat: Int = 1 {
//		didSet { Task.init { await fetchLiveCategory(selectedIndexOfCat: selectedIndexOfCat) } }
//	}
//
//	init() {
//		Task.init {
//			await fetchLiveCategory(selectedIndexOfCat: selectedIndexOfCat)
//		}
//	}
//
//	func fetchLiveCategory(selectedIndexOfCat: Int) async {
////		isLoading = true
////		errMessage = nil
//		let service = NetworkService()
//		let url = FetchUrlsE.live.rawValue + "\(selectedIndexOfCat)"
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
//}
