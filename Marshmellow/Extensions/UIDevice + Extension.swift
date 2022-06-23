//
//  UIDevice + Extension.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 22.06.2022.
//

import Foundation
import UIKit

extension UIDevice {
	static var isIPad: Bool {
		UIDevice.current.userInterfaceIdiom == .pad
	}
	static var isIPhone: Bool {
		UIDevice.current.userInterfaceIdiom == .phone
	}
}
