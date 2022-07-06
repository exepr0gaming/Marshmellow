//
//  CustomNavBarPreferenceKeys.swift
//  CustomNavBar
//
//  Created by Курдин Андрей on 28.06.2022.
//

import SwiftUI

struct NavBarTitlePKey: PreferenceKey {
	static var defaultValue: String? = nil
	static func reduce(value: inout String?, nextValue: () -> String?) {
		value = nextValue()
	}
}

struct NavBarSubtitlePKey: PreferenceKey {
	static var defaultValue: String? = nil
	static func reduce(value: inout String?, nextValue: () -> String?) {
		value = nextValue()
	}
}

struct NavBarBackButtonHiddenPKey: PreferenceKey {
	static var defaultValue: Bool = false
	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue()
	}
}

struct NavBarIsDetailPKey: PreferenceKey {
	static var defaultValue: Bool = false
	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue()
	}
}

struct NavBarIsMainPKey: PreferenceKey {
	static var defaultValue: Bool = false
	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue()
	}
}

struct NavBarIsCongratulationsPKey: PreferenceKey {
	static var defaultValue: Bool = false
	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue()
	}
}



extension View {
	func navBarTitle(_ title: String?) -> some View {
		self.preference(key: NavBarTitlePKey.self, value: title)
	}
	func navBarSubtitle(_ subtitle: String?) -> some View {
		self.preference(key: NavBarSubtitlePKey.self, value: subtitle)
	}
	func navBarBackButtonHidden(_ hidden: Bool) -> some View {
		self.preference(key: NavBarBackButtonHiddenPKey.self, value: hidden)
	}
	func navBarIsDetail(_ isDetail: Bool) -> some View {
		self.preference(key: NavBarIsDetailPKey.self, value: isDetail)
	}
	func navBarIsMain(_ isMain: Bool) -> some View {
		self.preference(key: NavBarIsMainPKey.self, value: isMain)
	}
	func navBarIsCongratulations(_ isCongratulations: Bool) -> some View {
		self.preference(key: NavBarIsCongratulationsPKey.self, value: isCongratulations)
	}
	
	func navBarItems(title: String? = nil, subtitle: String? = nil, backButHidden: Bool = false, isDetail: Bool = false, isMain: Bool = false, isCongratulations: Bool = false) -> some View {
		self
			.navBarTitle(title)
			.navBarSubtitle(subtitle)
			.navBarBackButtonHidden(backButHidden)
			.navBarIsDetail(isDetail)
			.navBarIsMain(isMain)
			.navBarIsCongratulations(isCongratulations)
	}
}
