//
//  PresentationView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

struct PresentationView: View {
	
	//@State private var indexOffset: CGFloat = 0
	//@State private var isPresented: Bool = false
	@State private var animate: Bool = true
	@ObservedObject var presentationVM: PresentationVM
	
	var body: some View {
		
		if presentationVM.isPresented {
			
			TabBarMenuView()
			
		} else {
			
			GeometryReader { proxy in
				HStack(spacing: 0) {
					
					ContentPresentationView(
						image: UIDevice.isIPhone ? PresentationContentE.first.image : PresentationContentE.first.imageIPad,
						title: PresentationContentE.first.title,
						subTitle: PresentationContentE.first.subTitle,
						presentationVM: presentationVM)
						.frame(width: proxy.size.width)
						.padding(.top, UIDevice.isIPhone ? 0 : 78)
					
					ContentPresentationView(
						image: UIDevice.isIPhone ? PresentationContentE.second.image : PresentationContentE.second.imageIPad,
						title: PresentationContentE.second.title,
						subTitle: PresentationContentE.second.subTitle,
						presentationVM: presentationVM)
						.frame(width: proxy.size.width)
						.padding(.top, UIDevice.isIPhone ? 0 : 78)
					
					ContentPresentationView(
						image: UIDevice.isIPhone ? PresentationContentE.third.image : PresentationContentE.third.imageIPad,
						title: PresentationContentE.third.title,
						subTitle: PresentationContentE.third.subTitle,
						presentationVM: presentationVM)
						.frame(width: proxy.size.width)
					
					WelcomeAfterPresentationView(presentationVM: presentationVM)
						.frame(width: proxy.size.width)
					
				}
				.offset(x: -(presentationVM.indexOffset * proxy.size.width))
				.animation(.easeIn, value: animate)
				.frame(height: proxy.size.height)
				
				.gesture(
					DragGesture()
						.onEnded{ value in
							if value.translation.width > 10  {
								if presentationVM.indexOffset > 0 {
									presentationVM.indexOffset -= 1
								}
							} else if value.translation.width < -10  {
								if presentationVM.indexOffset < 4 {
									presentationVM.indexOffset += 1
								}
							}
						}
				).animation(.easeIn, value: animate)
				
			}
			.ignoresSafeArea()
			.background(Color.black)
			
		} // else
		
		
	}
}

struct PresentationView_Previews: PreviewProvider {
	static var previews: some View {
		PresentationView(presentationVM: PresentationVM())
	}
}
