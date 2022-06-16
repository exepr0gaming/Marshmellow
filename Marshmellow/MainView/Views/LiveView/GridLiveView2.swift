////
////  GridLiveView.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 09.06.2022.
////
//
//import SwiftUI
//
//struct GridLiveView: View {
//   
//	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
//	let flexibleLayout: [GridItem] = [.init(.flexible(minimum: 174, maximum: 400), spacing: 5), .init(.flexible(minimum: 174, maximum: 400), spacing: 5)]
//	
//		var body: some View {
//			
//			if wallpapersFetcher.selectedLiveIndex > 1 {
//				VStack {
//					ScrollView {
//						LazyVGrid(columns: flexibleLayout) {
//							ForEach(wallpapersFetcher.categoryUrls, id: \.self) { video in
//								NavigationLink {
//									//DetailLiveVideo(videoUrl: video)
//								} label: {
//									VideoCard(videoUrl: video)
////									LoopingPlayer(url: video.url, isLocale: false)
////										.frame(height: 310).cornerRadius(8)
//								}
//							}
//						}
//						
//					}
//					//.frame(maxWidth: .infinity)
//				}
//				//.padding(.horizontal, 11)
//				.background(Color.black)
//				.navigationBarHidden(true)
//				
//				
//			} else {
//				Color.clear
//				.frame(width: getScreenBounds().width)
//			}
//			
//				
//			
//		}
//}
//
//
//struct GridLiveView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridLiveView()
//    }
//}
