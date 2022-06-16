//
//  LottieView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 13.06.2022.
//

import SwiftUI
import Lottie

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
