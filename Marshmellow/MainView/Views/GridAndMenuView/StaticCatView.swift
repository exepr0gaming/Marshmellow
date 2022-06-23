//
//  StaticCatView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 15.06.2022.
//

import SwiftUI

struct StaticCatView: View {
	
	@State var isOpens: Bool
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@State var offsetX: CGFloat = 0
	
    var body: some View {
        
			if !isOpens {
				VStack {
					PagerTabView(selection: $wallpapersFetcher.selectedStaticIndex, offsetX: $offsetX) {
						ScrollView(.horizontal, showsIndicators: false) {
							HStack(spacing: 20) {
								ForEach(Array(wallpapersFetcher.wallpapers.catStatic.enumerated()), id: \.offset) { index, category in
									VStack {
										Text(category.nameCategory) // "i=\(index),cS=\(currentSelection), \(name)"
											.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: wallpapersFetcher.selectedStaticIndex == index ? .white : .cGray49)
												.frame(maxWidth: .infinity, alignment: .center)
												.lineLimit(1) // .minimumScaleFactor(0.75)
										
										Capsule()
											.fill(wallpapersFetcher.selectedStaticIndex == index ? Color.cGreen : Color.clear )
															.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
															.frame(height: 3)
															.padding(.top, -16).padding(.horizontal, -6) // .padding(.bottom, 10) 26-12=14
									}
									.onTapGesture {
										let newOffset = CGFloat(index) * getScreenBounds().width
										self.offsetX = newOffset
									}
									.padding(.top, 16)
									.padding(.horizontal, 11)
									}
							}
						}
						
					} content: {
							ForEach(Array(wallpapersFetcher.wallpapers.catStatic.enumerated()), id: \.1) { index, category in
								if wallpapersFetcher.selectedStaticIndex == index {
									GridView(isDetail: false, gridFor: .staticCat).gridViewSettings()
								} else {
									//Color.black.opacity(0.01).gridViewSettings()
									Color.clear.gridViewSettings()
								}
							}
					}
				}
				
				// MARK: - Else - isOpens 1 grid withOutMenu
			} else {
				GridView(isDetail: true, gridFor: .staticCat)
					.frame(width: getScreenBounds().width, alignment: .center)//.gridViewSettings()
			}
			
    }
}

struct StaticCatView_Previews: PreviewProvider {
    static var previews: some View {
			StaticCatView(isOpens: false)
    }
}
