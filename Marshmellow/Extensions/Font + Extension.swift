//
//  Font + Extension.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 18.05.2022.
//

import SwiftUI

extension Font {
	static let nunitoRegular = Font.custom("Nunito-Regular", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	static let nunitoSemiBold = Font.custom("Nunito-SemiBold", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	static let nunitoBold = Font.custom("Nunito-Bold", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	static let nunitoExtraLight = Font.custom("Nunito-ExtraLight", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	static let nunitoMedium = Font.custom("Nunito-Medium", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	static let nunitoBlack = Font.custom("Nunito-Black", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
	
	//		static let extraLightNunito = Font.custom("Nunito-ExtraLight", size: Font.TextStyle.footnote.size, relativeTo: .caption)
	//		static let smallFont = Font.custom("Sans-Regular", size: Font.TextStyle.caption.size, relativeTo: .caption)
	//		static let verySmallFont = Font.custom("Sans-Regular", size: Font.TextStyle.caption2.size, relativeTo: .caption)
}


extension Font.TextStyle {
	var size: CGFloat {
		switch self {
			case .largeTitle: return 60
			case .title: return 48
			case .title2: return 34
			case .title3: return 24
			case .headline, .body: return 18
			case .subheadline, .callout: return 16
			case .footnote: return 14
			case .caption: return 12
			case .caption2: return 10
			@unknown default:
				return 8
		}
	}
}


struct NunitoFontModifier: ViewModifier {
	@Environment(\.sizeCategory) var sizeCategory
	var name: FontsE.RawValue
	var size: Double
	var color: Color
	
	func body(content: Content) -> some View {
		let scaledSize = UIFontMetrics.default.scaledValue(for: size)
		return content.font(.custom(name, size: scaledSize)).foregroundColor(color)
	}
}

struct MainFrameInfinityModifier: ViewModifier {
	var maxWidth: CGFloat
	var maxHeight: CGFloat
	
	func body(content: Content) -> some View {
		return content
			.frame(maxWidth: maxWidth, maxHeight: maxHeight)
	}
}



enum FontsE: String {
	case nunitoRegular = "Nunito-Regular"
	case nunitoSemiBold = "Nunito-SemiBold"
	case nunitoBold = "Nunito-Bold"
	case balooBhaijaan = "BalooBhaijaan-Regular"
}

