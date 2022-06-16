//
//  SecondScreenView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

struct SecondScreenView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@State var isDisappear: Bool = true
	@State var isOpens: Bool
	@State var gridFor: GridE
	
    var body: some View {
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack {
					
					Color.cGray49.frame(height: 1)
						.padding(.bottom, 11)
					
					GridAndMenuView(isOpens: isOpens, gridFor: gridFor)
					
					AdsAndTextView()

					BottomGridWithInstallView()
				}
			}
			.frame(maxHeight: .infinity)
			.background(Color.black)
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle(gridFor == .staticCat
											 ? wallpapersFetcher.detailCategory.nameCategory
											 : wallpapersFetcher.detailLiveCat.nameCategory)
			//.navigationTitle(isDisappear ? wallpapersFetcher.detailCategory.nameCategory : "")
			//.navigationBarHidden(true)
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
