//
//  LiveCatCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct LiveCatCarouselView: View {
	
	let titleView: String
	//let liveCat: [LiveCategoriesM]
	
		var body: some View {
			
			VStack(alignment: .leading, spacing: 19) {
				
				TitleAndArrowInLineView(title: titleView, fontSize: 19)
				
				LoopingPlayer(url: "live")
					.frame(height: 176)
				
//				ScrollView(.horizontal, showsIndicators: false) {
//					HStack(alignment: .top, spacing: 9) {
//						ForEach(self.liveCat, id: \.self) { wallpaper in
//							PopularAndLiveCardV(imageStr: wallpaper.imageStr)
//						} // ForEach
//					}
//				}
				
			}// VStack
			
		}
}

struct LiveCatCarouselView_Previews: PreviewProvider {
    static var previews: some View {
			LiveCatCarouselView(titleView: WallpaperCategoriesE.liveCategoriesM.rawValue)
    }
}
