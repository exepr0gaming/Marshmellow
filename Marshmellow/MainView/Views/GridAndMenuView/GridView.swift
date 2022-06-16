//
//  GridView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

enum GridE {
	case staticCat
	case liveCat
}

struct GridView: View {
	
	@State var isDetail: Bool
	@State var gridFor: GridE
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	let flexibleLayout: [GridItem] = [.init(.flexible(minimum: 174, maximum: 400), spacing: 5), .init(.flexible(minimum: 174, maximum: 400), spacing: 5)]
	//let detailCategory = isStaticGrid ? wallpapersFetcher.detailCategory.array : wallpapersFetcher.gridCategory.array
	

	func getSequenceOfCat(_ block: Int, isDetail: Bool) -> ArraySlice<WallpaperCategoryUrlsModel>  {
		let seq = (block * 4) ..< ((block + 1) * 4)
		switch gridFor {
			case .staticCat:
				print("%%%return getSequenceOfCat staticCat")
				if isDetail {
					return wallpapersFetcher.detailCategory.array[seq]
				} else {
					return wallpapersFetcher.gridCategory.array[seq]
				}
			case .liveCat:
				print("%%%return getSequenceOfCat liveCat")
				if isDetail {
					return wallpapersFetcher.detailLiveCat.array[seq]
				} else {
					return wallpapersFetcher.gridLiveCat.array[seq]
				}
		}
	}
	func returnGridCount(grid: GridE) -> Int {
		switch grid {
			case .staticCat:
				 return !isDetail
					? wallpapersFetcher.gridCategory.array.count / 4
					: wallpapersFetcher.detailCategory.array.count / 4
			case .liveCat:
				 return !isDetail
					? wallpapersFetcher.gridLiveCat.array.count / 4
					: wallpapersFetcher.detailLiveCat.array.count / 4
		}
	}
	
	var body: some View {
		let sequenceOfBlocks = 0..<20 //wallpapersFetcher.catBlocksCount
		let detailOrGridCount: Int = returnGridCount(grid: gridFor)
		
		ScrollView(.vertical, showsIndicators: false) {
			//ForEach(0..<wallpaperCatUrls.count / 4) { block in
			ForEach(sequenceOfBlocks) { block in // gridCategory.array.count / 4
				if block < detailOrGridCount {
					LazyVGrid(columns: flexibleLayout, spacing: 5) {
	//					ForEach(gridCategory.array[(block * 4) ..< ((block + 1) * 4)], id: \.self) { item in
						ForEach(getSequenceOfCat(block, isDetail: isDetail), id: \.self) { item in
							NavigationLink {
								DetailWallpaperView(detailFor: gridFor, wallpaperURL: gridFor == .staticCat ? item.previewUrl : item.url)
							} label: {
								switch gridFor {
									case .staticCat:
										AsyncImageView(imageStr: item.previewUrl, contentMode: .fill)
											.frame(height: 310)
											.cornerRadius(6)
									case .liveCat:
										LoopingPlayer(url: item.url, isLocale: false)
											.frame(height: 310)
											.cornerRadius(6)
								}
								
								//.padding(.horizontal, -1) // хз почему там spacing больше на 1
							}
							
						}
					}
					
					Color.cYellow.frame(width: getScreenBounds().width, height: 200)
						//GADNativeAdView().frame(width: getScreenBounds().width, height: 300)
				}
				
			}
			
		}
		.offset(x: getScreenBounds().width * CGFloat(gridFor == .staticCat
																								 ? wallpapersFetcher.selectedStaticIndex
																								 : wallpapersFetcher.selectedLiveIndex))
		.frame(width: getScreenBounds().width)
		//.frame(maxHeight: .infinity)
		.background(Color.black)
	}
	
	
}

//struct GridView_Previews: PreviewProvider {
//	static var previews: some View {
//		GridStaticView(wallpaperCategory: "")
//	}
//}
