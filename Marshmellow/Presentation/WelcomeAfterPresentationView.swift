//
//  WelcomeAfterPresentationView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

struct WelcomeAfterPresentationView: View {
	
	//@Binding var isPresented: Bool
	@ObservedObject var presentationVM: PresentationVM

    var body: some View {
				
			ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {

				Image(systemName: "xmark")
					.font(.system(size: 20))
					.foregroundColor(.white)
					.padding(EdgeInsets(top: 54, leading: 22, bottom: 0, trailing: 0))
				
				VStack {
					LottieView(name: "welcome", loopMode: .loop)
						.frame(maxWidth: .infinity)
					
					VStack(spacing: 14) {
					
						//AdsAndTextView()
						NativeAdViewRepresentable()
							.frame(width: getScreenBounds().width, height: 282)
						
						Button {
							withAnimation {
								presentationVM.isPresented.toggle()
								UserDefaults.standard.set(true, forKey: "shownThePresentation")
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
			} // Main ZStack
			.background(.black)
			
    }
}

//struct WelcomeAfterPresentationView_Previews: PreviewProvider {
//    static var previews: some View {
//			WelcomeAfterPresentationView()
//			//WelcomeAfterPresentationView(presentationVM: PresentationVM())
//    }
//}
