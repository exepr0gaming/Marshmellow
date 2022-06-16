//
//  PresentationVM.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 18.05.2022.
//

import SwiftUI

class PresentationVM: ObservableObject {
	
	@Published var indexOffset: CGFloat = 0
	@Published var isPresented: Bool = false
	//@Published var onGesture: Bool = true
	@Published var shownThePresentation = UserDefaults.standard.bool(forKey: "shownThePresentation")
	
	init() {
		print("shownThePresentation= \(shownThePresentation)")
		print("PresentationVM ON!") }
	deinit { print("PresentationVM OFF!") }
	
	static func printFonts()  -> some View {
	//	ForEach(UIFont.familyNames.sorted(), id: \.self) { family in
		for family in UIFont.familyNames.sorted() {
			let names = UIFont.fontNames(forFamilyName: family)
			print("F: \(family) fNames: \(names)")
		}
		return EmptyView()
	}
}
