//
//  PresentationView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 19.05.2022.
//

import SwiftUI

struct PresentationView: View {
	
	@StateObject var presentationVM = PresentationVM()
	
    var body: some View {
        
			VStack {
			
			GeometryReader { proxy in
				HStack(spacing: 0) {
					
					ContentPresentationView(image: PresentationContentE.first.image, title: PresentationContentE.first.title, subTitle: PresentationContentE.first.subTitle, presentationVM: presentationVM)
						.frame(width: proxy.size.width)
					
					ContentPresentationView(image: PresentationContentE.second.image, title: PresentationContentE.second.title, subTitle: PresentationContentE.second.subTitle, presentationVM: presentationVM)
						.frame(width: proxy.size.width)
					
					ContentPresentationView(image: PresentationContentE.third.image, title: PresentationContentE.third.title, subTitle: PresentationContentE.third.subTitle, presentationVM: presentationVM)
						.frame(width: proxy.size.width)
					
					WelcomeAfterPresentationView()
						.frame(width: proxy.size.width)
					
				}
				.offset(x: -(presentationVM.indexOffset * proxy.size.width))
				.animation(.easeIn, value: true)
				.frame(height: proxy.size.height)
				
			}
//			.mainFrameInfinity()
			.ignoresSafeArea()
				
			.gesture(
				DragGesture()
					.onEnded({ value in
						if value.translation.width > 10 {
							if presentationVM.indexOffset > 0 {
								presentationVM.indexOffset -= 1
							}
						} else if value.translation.width < -10 {
							if presentationVM.indexOffset < 3 {
								presentationVM.indexOffset += 1
							}
						}
					})
			)
			

		
			
		}
			.ignoresSafeArea()
			.background(Color.black)
			
			
			
			
    }

}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
