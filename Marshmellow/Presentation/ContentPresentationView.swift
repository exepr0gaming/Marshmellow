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
	//var proxy: GeometryProxy
	
	@ObservedObject var presentationVM: PresentationVM
	
	var body: some View {
		
		ZStack(alignment: .bottom) {
			VStack {
				Image(image)
					.resizable()
					.scaledToFit()
					.edgesIgnoringSafeArea(.top)
				
				Spacer()
			}
			// MARK: - Title and subTitle
			VStack(spacing: 0) {
				
				Rectangle()
					.fill(
						LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
					)
					.frame(height: 195)
				
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
							if presentationVM.indexOffset < 2 {
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
				.background(.black)
				.frame(height: 267) // UIScreen.screenHeight * 0.36
				.padding(.bottom)
			}
			
			
		}
		
	
}

//				GeometryReader { proxy in
//
//					ZStack(alignment: .bottom) {
//
//						VStack {
//
//								Image(image) // "man2"
//									.resizable()
//									.scaledToFill()
//									//.edgesIgnoringSafeArea(.top)
//									.frame(height: proxy.size.height / 3 * 2)
//
//									//.frame(maxHeight: UIScreen.screenHeight * 0.7)
//									//.frame(height: UIScreen.screenHeight * 0.66)
//									//.padding(.top, image == "man4" ? 44 : 0)
//						}
//
//					//	Spacer(minLength: 0)
//
//						// MARK: - Title and subTitle
//						VStack(spacing: 38) {
//
//							Spacer()
//
//							VStack(spacing: 7) {
//								Text(title) // "Welcome"
//									.nunitoFont(name: FontsE.nunitoBold.rawValue, size: 37)
//								Text(subTitle) // "to wallpaper collection"
//									.nunitoFont(name: FontsE.nunitoSemiBold.rawValue, size: 24)
//							}
//							//.padding(.bottom, 38)
//
//							// MARK: - Button and pages Indicator
//							VStack {
//								Button {
//									if presentationVM.indexOffset < 2 {
//										presentationVM.indexOffset += 1
//									}
//								} label: {
//									YellowButtonLabelView(buttonText: "Next")
//								}
//
//								HStack {
//									paginationCircle(choiceIndex: 0)
//									paginationCircle(choiceIndex: 1)
//									paginationCircle(choiceIndex: 2)
//									paginationCircle(choiceIndex: 3)
//								}
//								.padding(.top, 17)
//								.animation(.default, value: true)
//							}
//					}
//						.ignoresSafeArea()
//						.frame(height: proxy.size.height / 3)
//						//.padding(.top, 38)
//					.padding(.horizontal)
//					}
//					.frame(height: proxy.size.height)
//
//
//				}
//			//	.frame(maxHeight: .infinity)
//				//.edgesIgnoringSafeArea(.top)
//				.ignoresSafeArea()
//				.background(.black)




@ViewBuilder
func paginationCircle(choiceIndex: CGFloat) -> some View {
	Circle()
		.fill(presentationVM.indexOffset == choiceIndex ? Color.white : Color.white.opacity(0.3))
		.frame(width: 12, height: 12)
}

}



struct ContentPresentationView_Previews: PreviewProvider {
	static var previews: some View {
		ContentPresentationView(image: "man2", title: "qweqwe", subTitle: "asdasd", presentationVM: PresentationVM())
	}
}
