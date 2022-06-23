//
//  GridAndMenuView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 27.05.2022.
//

import SwiftUI

struct GridAndMenuView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@State var isOpens: Bool = false
	@State var gridFor: GridE
	
	var body: some View {
		VStack {
			switch gridFor {
				case .staticCat:
					StaticCatView(isOpens: isOpens)
				case .liveCat:
					LiveCatView()
			}
		}
		.frame(minHeight: 450)
		
	}
}

// MARK: - work block
//VStack {
//	PagerTabView(selection: gridFor == .staticCat
//							 ? $wallpapersFetcher.selectedStaticIndex
//							 : $wallpapersFetcher.selectedLiveIndex) {
//		ScrollView(.horizontal, showsIndicators: false) {
//			HStack(spacing: 25) {
//				ForEach(Array(getCategories().enumerated()), id: \.offset) { index, category in
//					VStack {
//						Text(category.nameCategory) // "i=\(index),cS=\(currentSelection), \(name)"
//							.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color:
//														gridFor == .staticCat && wallpapersFetcher.selectedStaticIndex == index ? .white : .cGray49)
//								.frame(maxWidth: .infinity, alignment: .center)
//								.minimumScaleFactor(0.75).lineLimit(1)
//
//						Capsule()
//							.fill(wallpapersFetcher.selectedStaticIndex == index ? Color.cGreen : Color.clear )
//											.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
//											.frame(height: 3)
//											.padding(.top, -16).padding(.bottom, 10).padding(.horizontal, -6) // 26-12=14
//					}
//					.padding(.top, 16)
//					.padding(.horizontal, 11)
//					}
//			}
//		}
//
//	} content: {
//		ForEach(Array(getCategories().enumerated()), id: \.1) { index, category in
//			if wallpapersFetcher.selectedStaticIndex == index {
//				GridView(isDetail: false, gridFor: gridFor).gridViewSettings()
//			} else {
//				Color.clear
//					.gridViewSettings()
//			}
//		}
//	}
//}
//.frame(height: getScreenBounds().height) // 680  // 55 + 5 + 620
//
//// MARK: - Else - isOpens 1 grid withOutMenu
//} else {
//GridView(isDetail: true, gridFor: .staticCat)
//	.gridViewSettings()
//}






//struct GridAndMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//			GridAndMenuView(linkToFetchCategory: "/api/wallpapers/static/2")
//    }
//}


//				VStack {
//					PagerTabView(selection: $wallpapersFetcher.selectedStaticIndex) {
//						ScrollView(.horizontal, showsIndicators: false) {
//							HStack(spacing: 25) { // 25
////								ForEach(Array(wallpapersFetcher.wallpapers.catStatic.enumerated()), id: \.offset) { index, category in
//								ForEach(Array(wallpapersFetcher.wallpapers.catStatic.enumerated()), id: \.offset) { index, category in
//									VStack {
//										Text(category.nameCategory) // "i=\(index),cS=\(currentSelection), \(name)"
//												.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: wallpapersFetcher.selectedStaticIndex == index ? .white : .cGray49)
//												.frame(maxWidth: .infinity, alignment: .center)
//												.minimumScaleFactor(0.75).lineLimit(1)
//
//
//										Capsule()
//											.fill(wallpapersFetcher.selectedStaticIndex == index ? Color.cGreen : Color.clear )
//															.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
//															.frame(height: 3)
//															.padding(.top, -16).padding(.bottom, 10).padding(.horizontal, -6) // 26-12=14
//									}
//									.padding(.top, 16)
//									.padding(.horizontal, 11)
//									}
//							}
//						}
//
//					} content: {
//						ForEach(Array(wallpapersFetcher.wallpapers.catStatic.enumerated()), id: \.1) { index, category in
//							if wallpapersFetcher.selectedStaticIndex == index {
//								GridView(isDetail: false).gridViewSettings()
//							} else {
//								Color.clear
//									.gridViewSettings()
//							}
//
//						}
//
//
//							//.gridViewSettings(ignoresSafeArea: true, edges: .bottom)
//					}
//				}
//				.frame(height: getScreenBounds().height) // 680  // 55 + 5 + 620
