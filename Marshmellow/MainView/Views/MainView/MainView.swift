//
//  MainView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct MainView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	init() {
		UINavigationBar.appearance().tintColor = .white
	}
	
    var body: some View {
			NavigationView {
				
			ScrollView(.vertical, showsIndicators: false) {
				
				VStack {
					
					NavigationBarView()//.frame(height: 100)
					
						// MARK: - Triple Carousels
					VStack {
						NewCategoriesCarouselView(titleView: WallpaperCategoriesE.newCategories.rawValue)
							.padding(.bottom, 22)
						
						PopularCategoriesCarouselView(titleView: WallpaperCategoriesE.popularCategoriesM.rawValue)
							.padding(.bottom, 17)
						
						LiveCatCarouselView(titleView: WallpaperCategoriesE.liveCategoriesM.rawValue)
							//.padding(.bottom, 18)
					}
					.padding(.horizontal, 11)
					
					// MARK: Grid + Menu
					GridAndMenuView(isOpens: false, gridFor: .staticCat)
					
					
//						.onAppear {
//							wallpapersFetcher.fetchWallpaperCategory(linkCategory: wallpapersFetcher.linkToFetchCategory)
//							//print("%%%###= \(wallpapersFetcher.wallpaperCategory.array[0].url)")
//						}
					
					// MARK: Advertising + Text
						//AdsAndTextView()
					
					// MARK: Bottom Grid + Install
						//BottomGridWithInstallView()
				} // VStack
				
			}
			//.mainFrameInfinity()
			.background(Color.black)
			.edgesIgnoringSafeArea(.bottom)
				
			.navigationTitle("")
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
			.accentColor(.white)
			
				///
//			.toolbar {
//				ToolbarItem(placement: .navigationBarLeading) {
//					NavigationBarView()
//				}
//			}
			}
			

			
			
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
			MainView()
				.environmentObject(WallpapersFetcher())
    }
}
