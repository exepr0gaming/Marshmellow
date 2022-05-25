//
//  SplashScreenTests.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 23.05.2022.
//

import SwiftUI
import Lottie

struct SplashScreenTests: View {
	
	@State var showSplash = false
	
    var body: some View {
			VStack {
				//AnimatedView(showSplash: $showSplash)
				LottieView(name: "splash", loopMode: .autoReverse)
//				LottieView(name: "splash", loopMode: .autoReverse, showSplash: $showSplash)
			}
//			.frame(width: 300)
//			.frame(maxWidth: 300)
		
    }
}

//struct AnimatedView: UIViewRepresentable {
//
//	@Binding var showSplash: Bool
//
//	func makeUIView(context: Context) -> AnimationView {
//		// (path: "AssetsFiles/Lottie/")!
//		let animationView = AnimationView(name: "splash")
//
//
//		animationView.play { status in
//			if status {
//				withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
//					showSplash.toggle()
//				}
//			}
//		}
//		return animationView
//	}
//	func updateUIView(_ uiView: AnimationView, context: Context) {}
//}

struct LottieView: UIViewRepresentable {
	var name: String
		var loopMode: LottieLoopMode = .loop
	
		//@Binding var showSplash: Bool

		func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
				let view = UIView(frame: .zero)

				let animationView = AnimationView()
				let animation = Animation.named(name)
				animationView.animation = animation
				animationView.contentMode = .scaleAspectFit
				animationView.loopMode = loopMode
			
//			animationView.play { status in
//				if status {
//					withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
//						showSplash.toggle()
//					}
//				}
//			}
				animationView.play()

				animationView.translatesAutoresizingMaskIntoConstraints = false
				view.addSubview(animationView)
				NSLayoutConstraint.activate([
						animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
						animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
				])

				return view
		}

		func updateUIView(_ uiView: UIViewType, context: Context) {		}
}

struct SplashScreenTests_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenTests()
    }
}
