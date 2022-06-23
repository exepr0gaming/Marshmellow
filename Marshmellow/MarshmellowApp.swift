//
//  MarshmellowApp.swift
//  Marshmellow
//
//  Created by Курдин Андрей
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency
import YandexMobileMetrica
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
 func application(_ application: UIApplication,
									didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
	 FirebaseApp.configure()

	 return true
 }
}

@main
struct MarshmellowApp: App {
	@StateObject var wallpapersFetcher = WallpapersFetcher()
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	//@StateObject var adMobService = AdMobService()

	init() {
		//requestDataPermission()
		GADMobileAds.sharedInstance().start(completionHandler: nil)
		YMMYandexMetrica.activate(with: YMMYandexMetricaConfiguration.init(apiKey: ConstsE.Metrica.yandexMetrica.rawValue)!)
		//adMobService.adStarted()
	}
	
    var body: some Scene {
        WindowGroup {
					
					SplashScreenView()
					//DetailWallpaperView(detailFor: .liveCat, wallpaperURL: "/media/wallpapers/live/design/9046240.mp4")
						.environmentObject(wallpapersFetcher)
					//	.environmentObject(adMobService)
						.preferredColorScheme(.dark)
						
        }
    }
	
}

