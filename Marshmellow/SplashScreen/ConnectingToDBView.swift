//
//  ConnectingToDBView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI
import Lottie

struct ConnectingToDBView: View {
	
	@State private var isActive: Bool = false
	
    var body: some View {
		
			if isActive {
				PresentationView()
					.preferredColorScheme(.dark)
			} else {
				VStack {
					LottieView(name: "connectingBlack", loopMode: .loop)
						//.frame(height: getScreenBounds().height * 0.45)
						
					VStack(spacing: 5) {
						Text("Connecting")
							.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 37)
						Text("to database")
							.nunitoFont(name: FontsE.nunitoSemiBold.rawValue, size: 24)
					}
					.padding(.bottom, 200)
					//.frame(height: getScreenBounds().height / 2)
					//.frame(minHeight: getScreenBounds().height / 2)
				}
				.mainFrameInfinity()
				.ignoresSafeArea()
				.background(Color.black)
				
				.onAppear {
					DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
						withAnimation {
							self.isActive = true
						}
					}
				}
			} // else
			
			//

    }
}

struct ConnectingToDBView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingToDBView()
    }
}
