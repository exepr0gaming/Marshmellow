//
//  CongratulationsView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

struct CongratulationsView: View {
    var body: some View {
      
			VStack {
				
				HStack {
					Image(systemName: "xmark")
						.foregroundColor(.white)
						.font(.system(size: 20))
					
					Spacer()
				}.padding(.leading, 21)
				
				VStack(spacing: 14) {
					Text("Congratulations")
						.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 40)
					Text("you have successfully saved wallpaper")
						.nunitoFont(name: FontsE.nunitoRegular.rawValue, size: 20)
				}
				.padding(.top, 16)
				.padding(.horizontal, 38)
				.multilineTextAlignment(.center)
				
				LottieView(name: "congratulations", loopMode: .loop)
					.padding(.top, 21)
				
				Button {
					//
				} label: {
					YellowButtonLabelView(buttonText: "Thanks")
				}
				.padding(.bottom, 32)
				.padding(.horizontal)

			}
			//.ignoresSafeArea()
			.ignoresSafeArea(.container, edges: .top)
			.background(Color.black)
			
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
