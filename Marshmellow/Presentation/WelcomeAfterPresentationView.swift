//
//  WelcomeAfterPresentationView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

struct WelcomeAfterPresentationView: View {
	
	@State var isWelcome: Bool = false

    var body: some View {
			
			if isWelcome {
				MainView(wallpapers: WallpapersFetcher()) // TO-DO WHERE initialize?
			} else {
				
			ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
				
				Image(systemName: "xmark")
					.font(.system(size: 20))
					.foregroundColor(.white)
					.padding(EdgeInsets(top: 54, leading: 22, bottom: 0, trailing: 0))
				
				VStack {
					LottieView(name: "welcome", loopMode: .loop)
						.frame(maxWidth: .infinity)
					
					VStack(spacing: 14) {
					
						VStack(alignment: .leading, spacing: 14) {
							Text("Lorem ipsum dolor sit amet?")
								.nunitoFont(name: FontsE.nunitoSemiBold.rawValue, size: 17)
							Text("Pertinax nec, in mei nostrum omittantur. Quo no orem ipsum dolor")
								.fixedSize(horizontal: false, vertical: true)
								.lineLimit(2)
								.nunitoFont()
						}
						.padding(.horizontal)
						
						Rectangle()
							.fill(Color.gray)
							.frame(height: 190)
						
						Button {
							withAnimation {
								isWelcome.toggle()
							}
						} label: {
							ZStack {
								LottieView(name: "button")
									.frame(maxWidth: .infinity)
									.frame(height: 105)
								
								Text("Ok")
									.nunitoFont(name: FontsE.nunitoSemiBold.rawValue, size: 20, color: .black)
							}
						}

					}
					
				}
				//.padding(.top, 50) // 22 xmark + 28
			}
			//.mainFrameInfinity()
			.background(.black)
			} // Main ZStack
			
    }
}

struct WelcomeAfterPresentationView_Previews: PreviewProvider {
    static var previews: some View {
			WelcomeAfterPresentationView(isWelcome: false)
    }
}
