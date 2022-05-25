//
//  PopularCategoriesCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct PopularCategoriesCarouselView: View {

		let titleView: String
		let popularCat: [PopularCategoriesM]
		
			var body: some View {
					
				VStack(alignment: .leading, spacing: 19) {
					Text(titleView)
						.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19)
						.padding(.horizontal)
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(alignment: .top, spacing: 9) {
							ForEach(self.popularCat, id: \.self) { wallpaper in
								PopularAndLiveCardV(imageStr: wallpaper.imageStr)
							} // ForEach
						}
					}
					
				} // VStack
				
			}
	}

	struct PopularCategoriesCarouselView_Previews: PreviewProvider {
			static var previews: some View {
				PopularCategoriesCarouselView(titleView: WallpaperCategoriesE.popularCategoriesM.rawValue, popularCat: popularCatData)
			}
	}
