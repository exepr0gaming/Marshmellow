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
	
	//@State private var onAppearLiveCat: Bool = true
	@State var isDetail: Bool
	@State var gridFor: GridE
	@State var isCongratulations: Bool = false
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	//@StateObject var adMobService = AdMobService()
	@State var isInitialPresented: Bool = false
	//@Binding var offsetX: CGFloat
	
	let flexibleLayout: [GridItem] = [.init(.flexible(minimum: 174, maximum: 400), spacing: 5), .init(.flexible(minimum: 174, maximum: 400), spacing: 5)]
	
	var body: some View {
		let sequenceOfBlocks = 0..<20 //wallpapersFetcher.catBlocksCount
		let detailOrGridCount: Int = returnGridCount(grid: gridFor)
		
		if isInitialPresented {
			//InterstitialAdView(isPresented: $adMobService.showIntersitialAd, adUnitId: ADMobE.testInterstitialId.rawValue)
			Color.clear
				.presentInterstitialAd(isPresented: $isInitialPresented, adUnitId: ConstsE.ADMobE.testInterstitialId.rawValue)
		} else {
			ScrollView(.vertical, showsIndicators: false) {
				ForEach(sequenceOfBlocks) { block in // gridCategory.array.count / 4
					if block < detailOrGridCount {
						LazyVGrid(columns: flexibleLayout, spacing: 5) {
							ForEach(getSequenceOfCat(block, isDetail: isDetail), id: \.self) { item in
								//NavigationLink {
								CustomNavLink {
									DetailWallpaperView(detailFor: gridFor,
																			wallpaperURL: gridFor == .staticCat ? item.previewUrl : item.url,
																			isInitialPresented: $isInitialPresented,
																			isCongratulations: $isCongratulations)
										.navBarItems(backButHidden: isCongratulations ? true : false,
																 isDetail: true)
								} label: {
									switch gridFor {
										case .staticCat:
											AsyncImageView(imageStr: item.previewUrl, contentMode: .fill)
												.frame(height: UIDevice.isIPhone ? 310 : 488)
												.cornerRadius(6)
										case .liveCat:
											VideoCard(videoUrl: item.previewUrl)
											//											LoopingPlayer(url: item.url, isLocale: false)
											//												.frame(height: UIDevice.isIPhone ? 310 : 488)
											//												.cornerRadius(6)
									}
								}
								
							}
						}
						
						//Color.cYellow.frame(width: getScreenBounds().width, height: 200)
						NativeAdViewRepresentable().frame(width: getScreenBounds().width, height: 282)
					}
					
				}
				
			}
			.frame(width: getScreenBounds().width)
			//.frame(maxHeight: .infinity)
			.background(Color.black)
			
			.offset(x: getOffsetForX())//onAppear: onAppearLiveCat))
			//.offset(x: offsetX)
			
//			.onAppear {
//				if gridFor == .liveCat {
//					offsetX = 0
//					wallpapersFetcher.selectedLiveIndex = 0
//					print("%%%LiveIndex= \(wallpapersFetcher.selectedLiveIndex), offsetX= \(offsetX), GridView onAppear")}
//			}
			
			
		}
		
		//.presentInterstitialAd(isPresented: $adMobService.showIntersitialAd, adUnitId: ConstsE.ADMobE.testInterstitialId.rawValue)
		
		
	}
	
	func getOffsetForX() -> CGFloat { // onAppear: Bool
		if isDetail || (gridFor == .liveCat && wallpapersFetcher.selectedLiveIndex == 0) {//}|| onAppearLiveCat  {
			return 0
		}
		let index: CGFloat = CGFloat(gridFor == .staticCat
																 ? wallpapersFetcher.selectedStaticIndex
																 : wallpapersFetcher.selectedLiveIndex)
		print("&&&WTF dude, getScreenBounds().width * index= \(getScreenBounds().width * index)")
		return getScreenBounds().width * index
	}
	
	func getSequenceOfCat(_ block: Int, isDetail: Bool) -> ArraySlice<WallpaperCategoryUrlsModel>  {
		let seq = (block * 4) ..< ((block + 1) * 4)
		switch gridFor {
			case .staticCat:
				if isDetail {
					return wallpapersFetcher.detailCategory.array[seq]
				} else {
					return wallpapersFetcher.gridCategory.array[seq]
				}
			case .liveCat:
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
				print("^^^staticCat isDetail=\(isDetail), gridFor=\(gridFor)")
				return !isDetail
				? wallpapersFetcher.gridCategory.array.count / 4
				: wallpapersFetcher.detailCategory.array.count / 4
			case .liveCat:
				print("^^^liveCat isDetail=\(isDetail), gridFor=\(gridFor)")
				return !isDetail
				? wallpapersFetcher.gridLiveCat.array.count / 4
				: wallpapersFetcher.detailLiveCat.array.count / 4
		}
	}
	
	
}

//struct GridView_Previews: PreviewProvider {
//	static var previews: some View {
//		GridStaticView(wallpaperCategory: "")
//	}
//}
