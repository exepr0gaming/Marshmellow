//
//  NetworkService.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

class NetworkService: ObservableObject {
	
	var mainUrl = "http://167.99.51.18/api/wallpapers/"
	var urlStatic = "static/1" // /api/wallpapers/static/1
	var urlLive = "live/1" // /api/wallpapers/live/1
	var testUrl = "http://167.99.51.18/media/wallpapers/static/Neon/3396887.jpg"
	var test2Url = "http://167.99.51.18/media/wallpapers/static/Witcher/wp10477382-witcher-iphone-wallpapers.jpg"
	
// http://159.223.194.4/api/wallpapers/
// http://159.223.194.4/api/wallpapers/live/
	//"url": "/media/wallpapers/static/Neon/4629626.jpg",
	//"preview_url": "/media/wallpapers/static/Neon/4629626.jpg"
	
	// /media/wallpapers/live/sky/4434209.mp4
	// /media/wallpapers/live/sky/4434209.jpg
	
	@Published var wallpapers: [WallpaperApiModel] = []
	
	func fetch() {
		guard let url = URL(string: mainUrl) else { return }
		URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
			guard let data = data, error == nil else { return }
			do {
				let images = try JSONDecoder().decode([WallpaperApiModel].self, from: data) // [WallpaperApiModel].self
				DispatchQueue.main.async {
					self?.wallpapers = images
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}.resume()
	} // fetch
	
	
}


