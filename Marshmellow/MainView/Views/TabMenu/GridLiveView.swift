////
////  GridLiveView.swift
////  Marshmellow
////
////  Created by Курдин Андрей on 13.06.2022.
////
//
//import SwiftUI
//
//struct GridLiveView: View {
//
//	@State var isDetail: Bool
//	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
//	let flexibleLayout: [GridItem] = [.init(.flexible(minimum: 174, maximum: 400), spacing: 5), .init(.flexible(minimum: 174, maximum: 400), spacing: 5)]
//
//	func getSequenceOfCat(_ block: Int, isDetail: Bool) -> ArraySlice<WallpaperCategoryUrlsModel>  {
//		let seq = (block * 4) ..< ((block + 1) * 4)
//		if isDetail {
//			return wallpapersFetcher.detailCategory.array[seq]
//		} else {
//			return wallpapersFetcher.gridCategory.array[seq]
//		}
//	}
//	
//	var body: some View {
//		let sequenceOfBlocks = 0..<20 
//		let detailOrGridCount: Int = !isDetail
//			? wallpapersFetcher.gridCategory.array.count / 4
//			: wallpapersFetcher.detailCategory.array.count / 4
//		
//		ScrollView(.vertical, showsIndicators: false) {
//			ForEach(sequenceOfBlocks) { block in
//				if block < detailOrGridCount {
//					LazyVGrid(columns: flexibleLayout, spacing: 5) {
//						ForEach(getSequenceOfCat(block, isDetail: isDetail), id: \.self) { item in
//							NavigationLink {
//								DetailWallpaperView(wallpaperURL: item.previewUrl)
//							} label: {
//								AsyncImageView(imageStr: item.previewUrl, contentMode: .fill)
//									.frame(height: 310)
//									.cornerRadius(6)
//								//.padding(.horizontal, -1) // хз почему там spacing больше на 1
//							}
//							
//						}
//					}
//					
//					Color.cYellow.frame(width: getScreenBounds().width, height: 200)
//						//NativeAdViewRepresentable().frame(width: getScreenBounds().width, height: 300)
//				}
//				
//			}
//			
//		}
//		.offset(x: getScreenBounds().width * CGFloat(wallpapersFetcher.selectedStaticIndex))
//		
//		.frame(width: getScreenBounds().width)
//		.background(Color.black)
//	}
//	
//}
//
//
//
////struct GridLiveView_Previews: PreviewProvider {
////    static var previews: some View {
////        GridLiveView()
////    }
////}
