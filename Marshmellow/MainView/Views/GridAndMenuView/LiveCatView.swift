//
//  LiveCatView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 15.06.2022.
//

import SwiftUI

struct LiveCatView: View {
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	
    var body: some View {
			VStack {
				PagerTabView(selection: $wallpapersFetcher.selectedLiveIndex) {
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 20) {
							ForEach(Array(wallpapersFetcher.liveWalls.enumerated()), id: \.offset) { index, category in
								VStack {
									Text(category.nameCategory) // "i=\(index),cS=\(currentSelection), \(name)"
										.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: wallpapersFetcher.selectedLiveIndex == index ? .white : .cGray49)
											.frame(maxWidth: .infinity, alignment: .center)
											.minimumScaleFactor(0.75).lineLimit(1)
									
									Capsule()
										.fill(wallpapersFetcher.selectedLiveIndex == index ? Color.cGreen : Color.clear )
														.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
														.frame(height: 3)
														.padding(.top, -16).padding(.bottom, 10).padding(.horizontal, -6) // 26-12=14
								}
								.padding(.top, 16)
								.padding(.horizontal, 11)
								}
						}
					}
					
				} content: {
					ForEach(Array(wallpapersFetcher.liveWalls.enumerated()), id: \.1) { index, category in
						if wallpapersFetcher.selectedLiveIndex == index {
							GridView(isDetail: false, gridFor: .liveCat).gridViewSettings()
						} else {
							Color.clear.gridViewSettings()
						}
					}
				}
			}
			.frame(minHeight: getScreenBounds().height)
			.padding(.top, 20)
			.onAppear {
				wallpapersFetcher.selectedLiveIndex = 0
			}
			
    }
}

struct LiveCatView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCatView()
    }
}
