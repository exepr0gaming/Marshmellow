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
			
			//ScrollView(.vertical, showsIndicators: false) {
				VStack {
					
					if isOpens && gridFor == .liveCat {
						BackArrowAndNavTitleView(title: "Live Wallpapers", tabSelection: $tabSelection)
							.padding(.top, isOpens ? 15 : 0)
					}
					
					GridAndMenuView(isOpens: isOpens, gridFor: gridFor)
				}
				//.padding(.top, isOpens && gridFor == .staticCat ? 103 : 0)
				
				
			//}
			//.frame(maxHeight: .infinity)
			.background(Color.black)
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle(wallpapersFetcher.detailCategory.nameCategory)
			.navigationBarHidden(isOpens && gridFor == .liveCat ? true : false)
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
