//
//  LiveCatCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct LiveCatCarouselView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	
	let titleView: String
	
		var body: some View {
			
			VStack(alignment: .leading, spacing: 19) {
				
				TitleAndArrowInLineView(title: titleView, fontSize: 19)
				
				NavigationLink {
					//LiveWithMenuView()
					GridAndMenuView(isOpens: false, gridFor: .liveCat)
				} label: {
					LoopingPlayer(url: "live", isLocale: true)
						.frame(height: 176)
				}
				
			}// VStack
			
		}
}

struct LiveCatCarouselView_Previews: PreviewProvider {
    static var previews: some View {
			LiveCatCarouselView(titleView: WallpaperCategoriesE.liveCategoriesM.rawValue).environmentObject(WallpapersFetcher())
    }
}
