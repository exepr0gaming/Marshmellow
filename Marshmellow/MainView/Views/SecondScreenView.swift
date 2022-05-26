//
//  SecondScreenView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI

struct SecondScreenView: View {
	
//	@State var currentSelection: Int = 0
	@ObservedObject var wallpaperFetcher: WallpapersFetcher
	var catNames: [String] = ["Marshmello", "Animals", "Anime", "Live"]
	
    var body: some View {
			VStack {
				
				VStack {
					PagerTabView(selection: $wallpaperFetcher.currentSelectionCat) { // tint: .black,
						ForEach(Array(catNames.enumerated()), id: \.offset) { index, name in
							Text(name) // "i=\(index),cS=\(currentSelection), \(name)"
								.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 19, color: wallpaperFetcher.currentSelectionCat == index ? .white : .cGray49)
								.minimumScaleFactor(0.75).lineLimit(1)
								.pageLabel()
							
						}
						.frame(height: 55)
		//				Image(systemName: "house.fill")
		//					.pageLabel()
						
					} content: {
						// wallpaperFetcher.wallpapers.catStatic[1].link
						GridView(wallpaperCategory: "/api/wallpapers/static/2", wallpaperFetcher: wallpaperFetcher)
						
						GridView(wallpaperCategory:  "/api/wallpapers/static/2", wallpaperFetcher: wallpaperFetcher)
							.pageView(ignoresSafeArea: true, edges: .bottom)
						
						GridView(wallpaperCategory: "/api/wallpapers/static/2", wallpaperFetcher: wallpaperFetcher)
							.pageView()
						
						GridView(wallpaperCategory:  "/api/wallpapers/static/2", wallpaperFetcher: wallpaperFetcher)
							.pageView()
					}
					.frame(height: 680) // 680  // 55 + 5 + 620
				}
				.padding(.horizontal, 11)
				
				//.padding(.top)
				//.ignoresSafeArea(.container, edges: .bottom)
				.onChange(of: wallpaperFetcher.currentSelectionCat) { newValue in
					wallpaperFetcher.fetchWallpaperCategory(linkCategory: wallpaperFetcher.wallpapers.catStatic[wallpaperFetcher.currentSelectionCat].link)
					print("Grid Changed")
				}
				
				// MARK: - Текст и Реклама
				VStack(alignment: .leading, spacing: 14) {
					Text("Lorem ipsum dolor sit amet?")
						.nunitoFont(name: FontsE.nunitoBold.rawValue)

					Text("Pertinax nec, in mei nostrum omittantur. Quo no orem ipsum dolor")
						.nunitoFont()
						.fixedSize(horizontal: false, vertical: true)
						.lineLimit(2)

					Rectangle()
						.fill(Color.cGray29)
						.frame(height: 190)
				}
				.padding(.top, 20)

				VStack(spacing: 9) {
					TitleAndArrowInLineView(title: "Install", arrowColor: .white, isShadow: false)

//					Image(systemName: "circle.dashed")
//						.font(.system(size: 20))
//						.foregroundColor(.white)
					LottieView(name: "progressView", loopMode: .loop)
						.frame(width: 26, height: 26)

					GridView(wallpaperCategory: "/api/wallpapers/static/5", wallpaperFetcher: wallpaperFetcher)
						.padding(.top, 9)
				}
				
			}
			.background(Color.black)
			
    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
			SecondScreenView(wallpaperFetcher: WallpapersFetcher())
    }
}
