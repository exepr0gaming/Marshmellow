//
//  ContentPresentationView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

struct ContentPresentationView: View {
	
	var image: String
	var title: String
	var subTitle: String
	//@Binding var indexOffset: CGFloat
	@ObservedObject var presentationVM: PresentationVM
	
	var body: some View {
		
		ZStack(alignment: .bottom) {
			VStack {
				Image(image)
					.resizable()
					.scaledToFit()
					.edgesIgnoringSafeArea(.top)
					.frame(maxWidth: image != "ipad4" ? 522 : .infinity)
				
				Spacer()
			}
			// MARK: - Title and subTitle
			VStack(spacing: 0) {
				
				Rectangle()
					.fill(
						LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
					)
					.frame(height: 195)
				
				Color.cGray49.frame(height: 1)
				
				VStack { // for bgColor
					
					Spacer()
					
					VStack(spacing: 7) {
						Text(title) // "Welcome"
							.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 37)
						Text(subTitle) // "to wallpaper collection"
							.nunitoFont(name: FontsE.nunitoSemiBold.rawValue, size: 24)
					}
					
					
					// MARK: - Button and pages Indicator
					VStack {
						Button {
							if presentationVM.indexOffset < 3 {
								presentationVM.indexOffset += 1
							}
						} label: {
							YellowButtonLabelView(buttonText: "Next")
						}
						.padding(.horizontal)
						
						HStack {
							paginationCircle(choiceIndex: 0)
							paginationCircle(choiceIndex: 1)
							paginationCircle(choiceIndex: 2)
							paginationCircle(choiceIndex: 3)
						}
						.padding(.top, 17)
						.animation(.default, value: true)
					}
					.padding(.top, 38)
				}
				.frame(width: getScreenBounds().width, height: UIDevice.isIPhone ? 267 : 360)
				.background(.black)
				.padding(.bottom)
			}
			.padding(.bottom, UIDevice.isIPhone ? 0 : 38)
		}
}


@ViewBuilder
func paginationCircle(choiceIndex: CGFloat) -> some View {
	Circle()
		//.fill(presentationVM.indexOffset == choiceIndex ? Color.white : Color.white.opacity(0.3))
		.fill(presentationVM.indexOffset == choiceIndex ? Color.white : Color.white.opacity(0.3))
		.frame(width: 12, height: 12)
}

}

//struct ContentPresentationView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentPresentationView(image: "man2", title: "qweqwe", subTitle: "asdasd", indexOffset: 0)
//	}
//}
