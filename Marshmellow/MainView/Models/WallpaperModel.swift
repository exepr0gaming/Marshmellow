//
//  WallpaperModel.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import Foundation

struct WallpaperModel: Decodable {
	var id = UUID()
	let newCategories: NewCategoriesM
	let popularCategoriesM: PopularCategoriesM
	let liveCategoriesM: LiveCategoriesM
	let withMenuCategories: WithMenuCategories
	let bottomCategoriesM: BottomCategoriesM
	//let imagePath: String
}

enum WallpaperCategoriesE: String, CaseIterable {
	case newCategories = "New Categories"
	case popularCategoriesM = "Popular Categories"
	case liveCategoriesM = "Live Categories"
	case withMenuCategories
	case bottomCategoriesM
}

// MARK: - TO-DO
enum WallpaperError: Error {}

struct NewCategoriesM: Decodable, Hashable {
	var id = UUID()
	let title: String
	let imageStr: String
}

struct PopularCategoriesM: Decodable, Hashable {
	var id = UUID()
	let imageStr: String
}

struct LiveCategoriesM: Decodable, Hashable {
	var id = UUID()
	let title: String
	let imageStr: String
}

struct WithMenuCategories: Decodable, Hashable {
	var id = UUID()
	var title: String?
	let imageStr: String
}

struct BottomCategoriesM: Decodable, Hashable {
	var id = UUID()
	var title: String?
	let imageStr: String
}
