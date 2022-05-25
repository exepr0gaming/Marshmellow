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
//	@State private var size = 0.8 // optional
//	@State private var opacity = 0.5 // optional
	
    var body: some View {
			if isActive {
				ConnectingToDBView()
					.preferredColorScheme(.dark)
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
							DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
								withAnimation {
									self.isActive = true
								}
							}
						}
					
				}
				.ignoresSafeArea()
				.background(Color.black)
			} // else
			
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
