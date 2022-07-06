//
//  MainView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct MainView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@ObservedObject var tabData: TabDataModel
	
	
	var body: some View {
		//NavigationView {
		CustomNavView {
			ScrollView(.vertical, showsIndicators: false) {
				
				VStack {
					
					NavigationBarView()//.frame(height: 100)
					
					// MARK: - Triple Carousels
					VStack {
						NewCategoriesCarouselView(titleView: WallpaperCategoriesE.newCategories.rawValue, tabData: tabData)
							.padding(.bottom, 22)
						
						PopularCategoriesCarouselView(titleView: WallpaperCategoriesE.popularCategoriesM.rawValue, tabData: tabData)
							.padding(.bottom, 17)
						
						LiveCatCarouselView(tabData: tabData, titleView: WallpaperCategoriesE.liveCategoriesM.rawValue)
						//.padding(.bottom, 18)
					}
					.padding(.horizontal, 11)
					
					// MARK: Grid + Menu
					GridAndMenuView(isOpens: false, gridFor: .staticCat)
						.frame(height: getScreenBounds().height)
					
					// MARK: Advertising + Text
					//AdsAndTextView()
					
					// MARK: Bottom Grid + Install
					//BottomGridWithInstallView()
				} // VStack
				//.frame(maxWidth: .infinity)
				
			}
			//.mainFrameInfinity()
			.background(Color.black)
			.edgesIgnoringSafeArea(.bottom)
			
			.navigationTitle("")
			.navigationBarHidden(true)
			//.navigationBarBackButtonHidden(true)
			.accentColor(.white)
			
			.onAppear {
				UINavigationBar.appearance().tintColor = .white
				NotificationManager.shared.setAllNotificationsWithRequestAuthorization()
				
				wallpapersFetcher.offsetX = 0
				wallpapersFetcher.selectedLiveIndex = 0
				print("%%%MainScreen onAppear LiveIndex= \(wallpapersFetcher.selectedLiveIndex), offsetX= \(wallpapersFetcher.offsetX)")
			}
			
//			.onDisappear {
//				print("%%%MainScreen onDisappear LiveIndex= \(wallpapersFetcher.selectedLiveIndex), offsetX= \(wallpapersFetcher.offsetX)")
//			}
			
			.navBarItems(title: "Custom Title!", backButHidden: true, isMain: true)
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//			MainView()
//				.environmentObject(WallpapersFetcher())
//    }
//}
