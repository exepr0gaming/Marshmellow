//
//  LiveCatCarouselView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 20.05.2022.
//

import SwiftUI

struct LiveCatCarouselView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	//weak var tabBar: TabDataModel?
	@ObservedObject var tabData: TabDataModel
	let titleView: String
	
	var body: some View {
//		Button {
//			tabData.currentTab = .live
//		} label: {
//			VStack(alignment: .leading, spacing: 19) {
//				TitleAndArrowInLineView(title: titleView, fontSize: 19)
//
//				LoopingPlayer(url: "live", isLocale: true)//.aspectRatio(16/9, contentMode: .fit)
//					.frame(height: UIDevice.isIPhone ? 176 : 240)
//			}// VStack
				
				//					NavigationLink {
				//						SecondScreenView(tabSelection: $tabData.currentTab, isOpens: false, gridFor: .liveCat)
				//					} label: {
				//						LoopingPlayer(url: "live", isLocale: true)
				//							.frame(height: 176)
				//					}
		
		
				CustomNavLink {
					SecondScreenView(tabSelection: $tabData.currentTab, isOpens: true, gridFor: .liveCat)
						.navBarTitle("Live Wallpapers")
						//.navBarItems(title: "Live Wallpapers")
				} label: {
					VStack(alignment: .leading, spacing: 19) {
						TitleAndArrowInLineView(title: titleView, fontSize: 19)
						
						LoopingPlayer(url: "live", isLocale: true)//.aspectRatio(16/9, contentMode: .fit)
							.frame(height: UIDevice.isIPhone ? 176 : 240)
					}
				}
		
	}
}

//struct LiveCatCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//			LiveCatCarouselView(titleView: WallpaperCategoriesE.liveCategoriesM.rawValue).environmentObject(WallpapersFetcher())
//    }
//}
