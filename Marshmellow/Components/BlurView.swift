//
//  BlurView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 24.05.2022.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
	
	var style: UIBlurEffect.Style = .systemThinMaterial
	
	func makeUIView(context: Context) -> UIVisualEffectView {
		let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
		return view
	}
	func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
