//
//  GladToSeeYouView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 13.06.2022.
//

import SwiftUI
import Lottie

struct GladToSeeYouAgainView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@State var openTabBar: Bool = false
	
	var body: some View {
		let leadPadding: CGFloat = 22
		
		if openTabBar {
			TabBarMenuView()
				.preferredColorScheme(.dark)
			
		} else {
			VStack {
				HStack {
					Button {
						withAnimation {
							openTabBar.toggle()
							//presentationMode.wrappedValue.dismiss()
						}
					} label: {
						Image(systemName: "xmark")
							.foregroundColor(.white)
							.font(.system(size: 20))
					}
					Spacer()
				}.padding(.leading, leadPadding)
				
				VStack(spacing: 0) {
					HStack(alignment: .top) {
							Text("Glad to see you again")
								.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 40)
								//.padding(.trailing, -80)
								.fixedSize(horizontal: false, vertical: true)
								.lineLimit(2)
								.multilineTextAlignment(.leading)
						
						Spacer()
							
							LottieView(name: "gladToSeeYou", loopMode: .loop)
								.frame(width: 196, height: 262)
								.padding(.trailing, -30)
								.padding(.leading, -40)
								//.aspectRatio(contentMode: .fill)
					}
				
					.padding(.top, 16)
					.padding(.leading, leadPadding)
					//.multilineTextAlignment(.center)
					
					
					Color.cGray49.frame(height: 1).padding(.top, -5)
				}
				
				Spacer()
				
				NativeAdViewRepresentable().frame(width: getScreenBounds().width, height: 300)
				
				Button {
					withAnimation {
						presentationMode.wrappedValue.dismiss()
					}
				} label: {
					YellowButtonLabelView(buttonText: "Install")
				}
				.padding(.horizontal)
				
			}
			.mainFrameInfinity()
			.padding(.vertical, 20)
			.background(Color.black)
		}
	
		
	}
}

struct GladToSeeYouView_Previews: PreviewProvider {
	static var previews: some View {
		GladToSeeYouAgainView()
	}
}
