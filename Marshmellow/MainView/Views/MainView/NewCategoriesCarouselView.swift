//
//  NewCategoriesCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct NewCategoriesCarouselView: View {
	
	let titleView: String
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@ObservedObject var tabData: TabDataModel
	
    var body: some View {
        
			VStack(alignment: .leading, spacing: 19) {
				Text(titleView)
					.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19)
					.padding(.horizontal)
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(alignment: .top, spacing: 6) {
						
							ForEach(self.wallpapersFetcher.wallpapers.newCats, id: \.self) { wallpaper in
							
								NavigationLink {
									SecondScreenView(tabSelection: $tabData.currentTab, isOpens: true, gridFor: .staticCat) // category: wallpaper,
										.onAppear {
												wallpapersFetcher.linkToFetchCategory = wallpaper.link
											print("NewsCats linkToFetchCategory= \(wallpapersFetcher.linkToFetchCategory)")
										}
										
								} label: {
									NewCategoriesCard(title: wallpaper.nameCategory, imageStr: wallpaper.urlPhoto)
								}
							} // ForEach
					
					}
				} // ScrollView
				
			}
			
			
    }
}

//struct NewCategoriesCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//			NewCategoriesCarouselView(titleView: "New Categories").environmentObject(WallpapersFetcher())
//    }
//}
