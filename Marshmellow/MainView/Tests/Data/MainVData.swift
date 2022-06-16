//
//  MainVData.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import Foundation

struct MainVData: Decodable {
   
}

let newCatData: [NewCategoriesM] = [
	NewCategoriesM(title: "Art", imageStr: "art"), NewCategoriesM(title: "Flower", imageStr: "flower"), NewCategoriesM(title: "Girls", imageStr: "girls"), NewCategoriesM(title: "Space", imageStr: "space"),
]

let popularCatData: [PopularCategoriesM] = [
	PopularCategoriesM(imageStr: "emoticons"), PopularCategoriesM(imageStr: "maxi")
	]

let liveCatData: [LiveCategoriesM] = [LiveCategoriesM(title: "Live wallpapers", imageStr: "live")]

let withMenuCatData: [BottomCategoriesM] = [
	BottomCategoriesM(imageStr: "r1"), BottomCategoriesM(imageStr: "r2"), BottomCategoriesM(imageStr: "r3"), BottomCategoriesM(imageStr: "r4")
	]

let bottomCatData: [BottomCategoriesM] = [
	BottomCategoriesM(imageStr: "bottomR1"), BottomCategoriesM(imageStr: "bottomR2"), BottomCategoriesM(imageStr: "bottomR3"), BottomCategoriesM(imageStr: "bottomR4")
	]

