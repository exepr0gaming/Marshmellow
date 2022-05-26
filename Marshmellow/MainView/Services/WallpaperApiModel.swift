//
//  WallpaperApiModel.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

struct WallpaperApiModel: Codable, Hashable {
	var catStatic: [CategoryModel]
	var newCats: [CategoryModel]
	var popCats: [CategoryModel]
	
	private enum CodingKeys: String, CodingKey {
		case catStatic = "categories_static"
		case newCats = "new_categories"
		case popCats = "popular_categories"
	}
	
	static func wallpaperExample() -> WallpaperApiModel {
		return WallpaperApiModel(
			catStatic: [CategoryModel(link: "/api/wallpapers/static/1", nameCategory: "Meal", type: "static", urlPhoto: "/media/meal.jpg"), CategoryModel(link: "/api/wallpapers/static/2", nameCategory: "Various", type: "static", urlPhoto: "/media/various.jpg")],
			newCats: [CategoryModel(link: "/api/wallpapers/static/1", nameCategory: "Meal", type: "static", urlPhoto: "/media/meal.jpg"), CategoryModel(link: "/api/wallpapers/static/2", nameCategory: "Various", type: "static", urlPhoto: "/media/various.jpg")],
			popCats: [CategoryModel(link: "/api/wallpapers/static/1", nameCategory: "Meal", type: "static", urlPhoto: "/media/meal.jpg"), CategoryModel(link: "/api/wallpapers/static/2", nameCategory: "Various", type: "static", urlPhoto: "/media/various.jpg")])
	}
	
}

struct WallpaperCategoryModel: Codable, Hashable {
	var url: String
	var previewUrl: String
	
	private enum CodingKeys: String, CodingKey {
		case url
		case previewUrl = "preview_url"
	}
}

struct CategoryModel: Codable, Hashable {
	var link: String
	var nameCategory: String
	var type: String
	var urlPhoto: String
}

//struct CategoriesStatic: Codable, Hashable {
//	var link: String
//	var nameCategory: String
//	var type: String
//	var urlPhoto: String
//}
//
//struct NewCategories: Codable, Hashable {
//	var link: String
//	var nameCategory: String
//	var type: String
//	var urlPhoto: String
//}
//
//struct PopularCategories: Codable, Hashable {
//	var link: String
//	var nameCategory: String
//	var type: String
//	var urlPhoto: String
//}


//{
//"categories_static": [
//{
//"link": "/api/wallpapers/static/1",
//"nameCategory": "Meal",
//"type": "static",
//"urlPhoto": "/media/meal.jpg"
//},
//{
//"link": "/api/wallpapers/static/2",
//"nameCategory": "Various",
//"type": "static",
//"urlPhoto": "/media/various.jpg"
//},
//{
//"link": "/api/wallpapers/static/3",
//"nameCategory": "Summer",
//"type": "static",
//"urlPhoto": "/media/summer.jpg"
//},
//{
//"link": "/api/wallpapers/static/4",
//"nameCategory": "Demon Slayer",
//"type": "static",
//"urlPhoto": "/media/demon_slayer.jpg"
//},
//{
//"link": "/api/wallpapers/static/5",
//"nameCategory": "Space",
//"type": "static",
//"urlPhoto": "/media/space.jpg"
//},
//{
//"link": "/api/wallpapers/static/6",
//"nameCategory": "Predators",
//"type": "static",
//"urlPhoto": "/media/predators.jpg"
//},
//{
//"link": "/api/wallpapers/static/7",
//"nameCategory": "Overwatch",
//"type": "static",
//"urlPhoto": "/media/overwatch.jpg"
//},
//{
//"link": "/api/wallpapers/static/8",
//"nameCategory": "Cities",
//"type": "static",
//"urlPhoto": "/media/cities.jpg"
//},
//{
//"link": "/api/wallpapers/static/9",
//"nameCategory": "Abstraction",
//"type": "static",
//"urlPhoto": "/media/abstraction.jpg"
//},
//{
//"link": "/api/wallpapers/static/10",
//"nameCategory": "Art",
//"type": "static",
//"urlPhoto": "/media/art.jpg"
//},
//{
//"link": "/api/wallpapers/static/11",
//"nameCategory": "White",
//"type": "static",
//"urlPhoto": "/media/white.jpg"
//},
//{
//"link": "/api/wallpapers/static/12",
//"nameCategory": "Holidays",
//"type": "static",
//"urlPhoto": "/media/holidays.jpg"
//},
//{
//"link": "/api/wallpapers/static/13",
//"nameCategory": "Love",
//"type": "static",
//"urlPhoto": "/media/love.jpg"
//},
//{
//"link": "/api/wallpapers/static/14",
//"nameCategory": "Wow",
//"type": "static",
//"urlPhoto": "/media/wow.jpg"
//},
//{
//"link": "/api/wallpapers/static/15",
//"nameCategory": "Words",
//"type": "static",
//"urlPhoto": "/media/words.jpg"
//},
//{
//"link": "/api/wallpapers/static/16",
//"nameCategory": "Witcher",
//"type": "static",
//"urlPhoto": "/media/witcher.jpg"
//},
//{
//"link": "/api/wallpapers/static/17",
//"nameCategory": "Motorcycles",
//"type": "static",
//"urlPhoto": "/media/motorcycles.jpg"
//},
//{
//"link": "/api/wallpapers/static/18",
//"nameCategory": "Minecraft",
//"type": "static",
//"urlPhoto": "/media/minecraft.jpg"
//},
//{
//"link": "/api/wallpapers/static/19",
//"nameCategory": "Dark",
//"type": "static",
//"urlPhoto": "/media/dark.jpg"
//},
//{
//"link": "/api/wallpapers/static/20",
//"nameCategory": "Neon",
//"type": "static",
//"urlPhoto": "/media/neon.jpg"
//}
//],
//"new_categories": [
//{
//"link": "/api/wallpapers/static/20",
//"nameCategory": "Neon",
//"type": "static",
//"urlPhoto": "/media/neon.jpg"
//},
//{
//"link": "/api/wallpapers/static/11",
//"nameCategory": "White",
//"type": "static",
//"urlPhoto": "/media/white.jpg"
//},
//{
//"link": "/api/wallpapers/static/2",
//"nameCategory": "Various",
//"type": "static",
//"urlPhoto": "/media/various.jpg"
//},
//{
//"link": "/api/wallpapers/static/6",
//"nameCategory": "Predators",
//"type": "static",
//"urlPhoto": "/media/predators.jpg"
//},
//{
//"link": "/api/wallpapers/static/5",
//"nameCategory": "Space",
//"type": "static",
//"urlPhoto": "/media/space.jpg"
//}
//],
//"popular_categories": [
//{
//"link": "/api/wallpapers/static/4",
//"nameCategory": "Demon Slayer",
//"type": "static",
//"urlPhoto": "/media/demon_slayer.jpg"
//},
//{
//"link": "/api/wallpapers/static/18",
//"nameCategory": "Minecraft",
//"type": "static",
//"urlPhoto": "/media/minecraft.jpg"
//},
//{
//"link": "/api/wallpapers/static/7",
//"nameCategory": "Overwatch",
//"type": "static",
//"urlPhoto": "/media/overwatch.jpg"
//},
//{
//"link": "/api/wallpapers/static/14",
//"nameCategory": "Wow",
//"type": "static",
//"urlPhoto": "/media/wow.jpg"
//},
//{
//"link": "/api/wallpapers/static/16",
//"nameCategory": "Witcher",
//"type": "static",
//"urlPhoto": "/media/witcher.jpg"
//}
//]
//}
