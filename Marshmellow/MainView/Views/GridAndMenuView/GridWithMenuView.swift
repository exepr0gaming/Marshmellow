////
////  GridWithMenuView.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 13.06.2022.
////
//
//import SwiftUI
//
//struct GridWithMenuView: View {
//	
//	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
//	//@State var isOpens: Bool = false
//	@State var categoryModel: [CategoryModel] // wallpapersFetcher.wallpapers.catStatic
//	
//		var body: some View {
//				VStack {
//					PagerTabView(selection: $wallpapersFetcher.selectedStaticIndex) {
//						ScrollView(.horizontal, showsIndicators: false) {
//							HStack(spacing: 25) {
//								ForEach(Array(categoryModel.enumerated()), id: \.offset) { index, category in
//									VStack {
//										Text(category.nameCategory) // "i=\(index),cS=\(currentSelection), \(name)"
//												.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: wallpapersFetcher.selectedStaticIndex == index ? .white : .cGray49)
//												.frame(maxWidth: .infinity, alignment: .center)
//												.minimumScaleFactor(0.75).lineLimit(1)
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
//						ForEach(Array(categoryModel.enumerated()), id: \.1) { index, category in
//							if wallpapersFetcher.selectedStaticIndex == index {
//								GridView(isDetail: false, gridFor: .staticCat).gridViewSettings()
//							} else {
//								Color.clear
//									.gridViewSettings()
//							}
//						}
//					}
//				}
//				.frame(height: getScreenBounds().height) // 680  // 55 + 5 + 620
//				
//			
//			
//		}
//}
//
//
//
////struct LiveGridView_Previews: PreviewProvider {
////    static var previews: some View {
////        GridWithMenuView()
////    }
////}
