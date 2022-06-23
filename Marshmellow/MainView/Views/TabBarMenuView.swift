//
//  TabBarMenu.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI

class TabDataModel: ObservableObject {
	@Published var currentTab: TabE = .home
	
	func goToLive() {
		currentTab = .live
	}
	
	func checkDeepLink(url: URL) -> Bool {
		guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else { return false }
		if host == TabE.home.rawValue { currentTab = .home }
		else if host == TabE.live.rawValue { currentTab = .live }
		//else { return checkInternalLinks(host: host) }
		return true
	}
//	func checkInternalLinks(host: String) -> Bool {
//		
//	}
}
enum TabE: String {
	case home = "home"
	case live = "live"
	case settings = "settings"
}

struct TabBarMenuView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@StateObject var tabData: TabDataModel = TabDataModel()
	//@StateObject var wallpapersFetcher = WallpapersFetcher()
//	let home = UIImage(named: "home")!.withTintColor(.red, renderingMode: .alwaysOriginal)
	
	init() {
		//UITabBar.appearance().isTranslucent = false
		UITabBar.appearance().unselectedItemTintColor = .white
		UITabBar.appearance().barTintColor = UIColor.black
//		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: FontsE.nunitoBold.rawValue, size: 12)!], for: .normal)
//		UITabBarItem.appearance().titlePositionAdjustment.vertical = 0
//		UITabBar.appearance(for: .init(horizontalSizeClass: UIUserInterfaceSizeClass.regular))
		}
	
    var body: some View {
			TabView(selection: $tabData.currentTab) {
				MainView(tabData: tabData)
					.tag(TabE.home)
					.tabItem {
						tabItemLabel(imageName: "home", text: "Home")
					}
				
				//LiveWithMenuView()
				//LiveVideoView()
				SecondScreenView(tabSelection: $tabData.currentTab, isDisappear: false, isOpens: true, gridFor: .liveCat)
					.tag(TabE.live)
					.tabItem {
						tabItemLabel(imageName: "brush", text: "Live")
					}
				
				SettingsView()
					.tag(TabE.settings)
					.tabItem {
						tabItemLabel(imageName: "settings", text: "Settings")
					}
			} // TabView
			.accentColor(.cGreen)
			.background(.black)
			.onOpenURL { url in
				if tabData.checkDeepLink(url: url) { print("From deep link") } else { print("fall back dl") }
			}
			
    } // body
	
	@ViewBuilder
	func tabItemLabel(imageName: String, text: String) -> some View {
		Image(imageName)
			.resizable()
			.renderingMode(.template)
			.foregroundColor(.cGreen)
			
		Text(text)
	}
}

struct TabBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabBarMenuView()
    }
}
