//
//  PresentationContentE.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

enum PresentationContentE {
	case first
	case second
	case third
	
	var image: String {
		switch self {
			case .first: return "man2"
			case .second: return "man3"
			case .third: return "man4"
		}
	}
	var imageIPad: String {
		switch self {
			case .first: return "ipad2"
			case .second: return "ipad3"
			case .third: return "ipad4"
		}
	}
	
	var title: String {
		switch self {
			case .first: return "Welcome"
			case .second: return "New wallpaper"
			case .third: return "Live Wallpaper"
		}
	}
	
	var subTitle: String {
		switch self {
			case .first: return "to wallpaper collection"
			case .second: return "get a new screensaver daily"
			case .third: return "fitting in 1 click"
		}
	}
}
