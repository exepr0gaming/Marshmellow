//
//  PopularCategoriesCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct PopularCategoriesCarouselView: View {

		let titleView: String
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@ObservedObject var tabData: TabDataModel
		
			var body: some View {
					
				VStack(alignment: .leading, spacing: 19) {
					Text(titleView)
						.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19)
						.padding(.horizontal)
					
					
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(alignment: .top, spacing: 8) {
							ForEach(self.wallpapersFetcher.wallpapers.popCats, id: \.self) { wallpaper in
								NavigationLink {
									SecondScreenView(tabSelection: $tabData.currentTab, isOpens: true, gridFor: .staticCat) // category: wallpaper,
										.onAppear {
												wallpapersFetcher.linkToFetchCategory = wallpaper.link
											print("PopCats linkToFetchCategory= \(wallpapersFetcher.linkToFetchCategory)")
										}
								} label: {
									PopularAndLiveCardV(imageStr: wallpaper.urlPhoto)
								}
								
								
							} // ForEach
						}
					} // ScrollView
					
//					ScrollView(.horizontal, showsIndicators: false) {
//						HStack(alignment: .top, spacing: 9) {
//							ForEach(self.popularCat, id: \.self) { wallpaper in
//								PopularAndLiveCardV(imageStr: wallpaper.imageStr)
//							} // ForEach
//						}
//					}
					
				} // VStack
				
			}
	}

//	struct PopularCategoriesCarouselView_Previews: PreviewProvider {
//			static var previews: some View {
//				PopularCategoriesCarouselView(titleView: WallpaperCategoriesE.popularCategoriesM.rawValue).environmentObject(WallpapersFetcher())
//			}
//	}
