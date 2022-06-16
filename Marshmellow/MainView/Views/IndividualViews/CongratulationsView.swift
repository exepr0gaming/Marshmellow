//
//  CongratulationsView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

struct CongratulationsView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@State var withLottie: Bool = true
	
    var body: some View {
      
			VStack {
				if !withLottie {
					HStack {
						Button {
							withAnimation {
								presentationMode.wrappedValue.dismiss()
							}
						} label: {
							Image(systemName: "xmark")
								.foregroundColor(.white)
								.font(.system(size: 20))
						}
						 Spacer()
					}.padding(.leading, 21)
				}
				
				VStack(spacing: 14) {
					Text("Congratulations")
						.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 40)
					Text("you have successfully saved wallpaper")
						.nunitoFont(name: FontsE.nunitoRegular.rawValue, size: 20)
				}
				.padding(.top, 60)
				.padding(.horizontal, 38)
				.multilineTextAlignment(.center)
				
				Spacer()
				
				if withLottie {
					Spacer()
					
					LottieView(name: "congratulations", loopMode: .loop)
						.frame(height: 350) // height: 337
						//.padding(.top, 21)
					
					Button {
						withAnimation {
							withLottie.toggle()
						}
					} label: {
						YellowButtonLabelView(buttonText: "Thanks")
					}
					.padding(.horizontal)
					
				} else {
					Spacer()
					
					NativeAdViewRepresentable().frame(width: getScreenBounds().width, height: 300)
					
					Button {
						withAnimation {
							presentationMode.wrappedValue.dismiss()
							withLottie.toggle()
						}
					} label: {
						YellowButtonLabelView(buttonText: "Install")
					}
					.padding(.horizontal)
				}

			}
			.mainFrameInfinity()
			//.frame(height: getScreenBounds().height)
			.padding(.vertical, 25)
			.background(Color.black)
			
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
