//
//  MarshmellowApp.swift
//  Marshmellow
//
//  Created by Курдин Андрей
//

import SwiftUI
import GoogleMobileAds

@main
struct MarshmellowApp: App {
	@StateObject var wallpapersFetcher = WallpapersFetcher()
	//@StateObject var adMobService = AdMobService()
	
	//@AppStorage("shownThePresentation") var shownThePresentation = false

	init() {
		GADMobileAds.sharedInstance().start(completionHandler: nil)
		//adMobService.adStarted()
	}
	
    var body: some Scene {
        WindowGroup {
					SplashScreenView()
					//MainView()
					//SecondScreenView(linkToFetchCategory: "wallpaper.link", "qwe", category: wallpaper, isOpens: false)
//
//					//TabBarMenuView()
//					//TestAdmob()
						.environmentObject(wallpapersFetcher)
					//	.environmentObject(adMobService)
						.preferredColorScheme(.dark)
					
				//	LiveVideoView()
					
        }
    }
	
	
	
}

