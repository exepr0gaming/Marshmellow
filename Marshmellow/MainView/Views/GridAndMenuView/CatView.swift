//
//  CatView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 27.06.2022.
//

import SwiftUI

struct CatView: View {
	
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@State var gridFor: GridE
	@State var catModel: [CategoryModel]
	//@Binding var offsetX: CGFloat
	@Binding var selection: Int
	
	
		var body: some View {
			VStack {
				PagerTabView(selection: $selection, offsetX: $wallpapersFetcher.offsetX) {
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 20) {
							ForEach(Array(catModel.enumerated()), id: \.offset) { index, category in
								VStack {
									Text(category.nameCategory)
										.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: selection == index ? .white : .cGray49)
											.frame(maxWidth: .infinity, alignment: .center)
											.lineLimit(1)//.minimumScaleFactor(0.75)
									
									Capsule()
										.fill(selection == index ? Color.cGreen : Color.clear )
														.shadow(color: Color.cGreen, radius: 8, x: 0, y: 0)
														.frame(height: 3)
														.padding(.top, -16).padding(.bottom, 10).padding(.horizontal, -6) // 26-12=14
								}
								.onTapGesture {
									let newOffset = CGFloat(index) * getScreenBounds().width
									wallpapersFetcher.offsetX = newOffset
									print("%%%$wallpapersFetcher.offsetX = \($wallpapersFetcher.offsetX)")
								}
								.padding(.top, 16)
								.padding(.horizontal, 11)
								}
						}
					}
					
				} content: {
						ForEach(Array(catModel.enumerated()), id: \.1) { index, category in
							if selection == index {
								GridView(isDetail: false, gridFor: gridFor)//, offsetX: $wallpapersFetcher.offsetX)
									.gridViewSettings()
							} else {
								Color.clear.gridViewSettings()
							}
						}
				}
			
			}
		
		}
}
