//
//  SplashScreenView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI
//import Lottie

struct SplashScreenView: View {
	
	@State private var isActive = false
	@EnvironmentObject var wallpapersFetcher: WallpapersFetcher
	@EnvironmentObject var adMobService: AdMobService
	
	//init() { adMobService.adStarted() }
	
    var body: some View {
			
//			if wallpapersFetcher.isLoading {
//				//LoadingView()
//			} else if wallpapersFetcher.errMessage != nil {
//				ErrorView()
//			} else {
//				// all content from bottom
//			}
			
			// MARK: - TO-DO changes
			if isActive {
				ConnectingToDBView()
					.preferredColorScheme(.dark)
				
			} else if wallpapersFetcher.errMessage != nil {
				ErrorView()
			} else {
				
				ZStack {
				
				Image("presentationBG1")
						.resizable()
						.scaledToFill()
					
					VStack {
						LottieView(name: "splash", loopMode: .autoReverse)
							//.frame(maxHeight: 122) // 144 for ipad
						
						Spacer()
						
						Image("man1")
							.resizable()
							.aspectRatio(contentMode: .fill)
//							.frame(width: getScreenBounds().width, height: getScreenBounds().height * 0.66)
							
					}
					.padding(.top, UIScreen.screenHeight / 6)
					
					.onAppear {
						DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
							withAnimation {
								self.isActive = true
							}
						}
					}
				
			}
			.ignoresSafeArea()
			.background(Color.black)
//			.onAppear {
//				adMobService.adStarted()
//			}
		} // else
			
			
				
				
			
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
