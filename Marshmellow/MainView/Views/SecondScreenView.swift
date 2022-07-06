//
//  SecondScreenView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

struct SecondScreenView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@Binding var tabSelection: TabE
	@State var isDisappear: Bool = true
	@State var isOpens: Bool
	@State var gridFor: GridE
	
	var body: some View {
		
		ZStack(alignment: .top) {
//			if isOpens { //if isOpens && gridFor == .liveCat && !wallpapersFetcher.isOpenDetail
//				BackArrowAndNavTitleView(title: gridFor == .staticCat
//																 ? wallpapersFetcher.detailCategory.nameCategory
//																 : "Live Wallpapers", tabSelection: $tabSelection)
//					.padding(.top, isOpens ? 15 : 0)
//					.frame(height: 44)
//			}
			// GridAndMenuView(isOpens: isOpens, gridFor: gridFor)
			
			GridAndMenuView(isOpens: isOpens, gridFor: gridFor)
		}
		
		//.padding(.top, isOpens && gridFor == .staticCat ? 103 : 0)
		
		.background(Color.black)
		.navigationBarHidden(true)
		.navigationBarBackButtonHidden(true)
		
//		.onAppear {
//			if gridFor == .liveCat {
//				offsetX = 0
//				wallpapersFetcher.selectedLiveIndex = 0
//				//tabSelection = .live
//				print("%%% SecondScreen LiveIndex= \(wallpapersFetcher.selectedLiveIndex), offsetX= \(offsetX), GridView onAppear")}
//		}
		
//		.onDisappear {
//			wallpapersFetcher.isOpenDetail = true
//			print("onDisappear wallpapersFetcher.isOpenDetail ")
//		}
		
		//			.navigationTitle(gridFor == .staticCat
		//											 ? wallpapersFetcher.detailCategory.nameCategory
		//											 : "Live Wallpapers")
		//.navigationTitle(isDisappear ? wallpapersFetcher.detailCategory.nameCategory : "")
		
		//.navigationBarBackButtonHidden(true)
		
		
		//			.onAppear(perform: {
		//				wallpapersFetcher.linkToFetchCategory = ""
		//				print("onAppearwallpapersFetcher.linkToFetchCategory = \(wallpapersFetcher.linkToFetchCategory)")
		//				self.isDisappear = true })
		//			.onDisappear {
		//				wallpapersFetcher.linkToFetchCategory = ""
		//				print("onDisappearwallpapersFetcher.linkToFetchCategory = \(wallpapersFetcher.linkToFetchCategory)")
		//				self.isDisappear = false }
		
	}
}

//struct SecondScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//			SecondScreenView(linkToFetchCategory: "Marshmello").environmentObject(WallpapersFetcher())
//    }
//}
