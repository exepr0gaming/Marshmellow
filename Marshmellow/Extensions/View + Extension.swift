//
//  View + Extension.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import SwiftUI

// MARK: - View EXTENSION
extension View {
	func nunitoFont(
		name: FontsE.RawValue = FontsE.nunitoRegular.rawValue,
		size: Double = Double(17),
		color: Color = Color.white
	) -> some View {
		return self.modifier(NunitoFontModifier(name: name, size: size, color: color))
	}
	
	func mainFrameInfinity(
		maxWidth: CGFloat = CGFloat.infinity,
		maxHeight: CGFloat = CGFloat.infinity
	) -> some View {
		return self.modifier(MainFrameInfinityModifier(maxWidth: maxWidth, maxHeight: maxHeight))
	}
}
