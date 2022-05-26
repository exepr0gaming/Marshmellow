//
//  MainView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct MainView: View {
	
	@StateObject var wallpapers = WallpapersFetcher()
	
    var body: some View {
			
			// MARK: - TO-DO changes
			if wallpapers.isLoading {
				//LoadingView()
			} else if wallpapers.errMessage != nil {
				ErrorView(wallpapers: wallpapers)
			} else {
				// all content from bottom
			}
			
			ScrollView(.vertical, showsIndicators: false) {
				
				VStack {
					
					// MARK: - Header
					VStack(spacing: 12) {
						HStack(spacing: 16) {
							Text("Marshmello")
								.nunitoFont(name: FontsE.balooBhaijaan.rawValue.uppercased(), size: 18)
								.shadow(color: .cGreen, radius: 5, x: 0, y: 0)
							
							Image("ConnectingDataBaseLogo")
								.resizable()
								.frame(width: 34, height: 37)
							
							Text("Wallpapers")
								.nunitoFont(name: FontsE.balooBhaijaan.rawValue.uppercased(), size: 18)
								.shadow(color: .cGreen, radius: 5, x: 0, y: 0)
						}
						Color.cGray49
							.frame(height: 1)
					} // VStack Header
					.padding()
					
					// MARK: - Triple Carousels
					VStack(spacing: 18) {
						NewCategoriesCarouselView(titleView: WallpaperCategoriesE.newCategories.rawValue, wallpapers: wallpapers)
						
						PopularCategoriesCarouselView(titleView: WallpaperCategoriesE.popularCategoriesM.rawValue, wallpapers: wallpapers)
							.padding(.top, 8) // // 26 - 18 from VStack spacing
						
						LiveCatCarouselView(titleView: WallpaperCategoriesE.liveCategoriesM.rawValue, liveCat: liveCatData)
					}
					
					SecondScreenView()
					
				
					
				} // main VStack
				.mainFrameInfinity()
				
			}
			.background(Color.black)
//			.onAppear {
//				wallpapers.fetch(fetchUrl: FetchUrlsE.wallpapers.rawValue)
//				//print(wallpapers.wallpapers)
//			}
			
			
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
