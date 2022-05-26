//
//  TabBarMenu.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI

struct TabBarMenuView: View {
	
	@State private var selection = 1
//	let home = UIImage(named: "home")!.withTintColor(.red, renderingMode: .alwaysOriginal)
	
	init() {
		UITabBar.appearance().isTranslucent = false
		UITabBar.appearance().unselectedItemTintColor = .white
		UITabBar.appearance().barTintColor = UIColor.black
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: FontsE.nunitoBold.rawValue, size: 12)!], for: .normal)
		UITabBarItem.appearance().titlePositionAdjustment.vertical = 0
		}
	
    var body: some View {
			TabView(selection: $selection) {
				MainView()
					.tabItem {
						tabItemLabel(imageName: "home", text: "Home")
					}.tag(1)
					
				
				SecondScreenView()
					.tabItem {
						tabItemLabel(imageName: "brush", text: "Live")
					}.tag(2)
				
				SecondScreenView()
					.tabItem {
						tabItemLabel(imageName: "settings", text: "Settings")
					}.tag(3)
			} // TabView
			.accentColor(.cGreen)
			
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