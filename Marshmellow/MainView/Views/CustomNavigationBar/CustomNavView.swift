//
//  CustomNavView.swift
//  CustomNavBar
//
//  Created by Курдин Андрей on 28.06.2022.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
	
	let content: Content
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}
	
	var body: some View {
			NavigationView {
				CustomNavBarContainerView { content }
				.navigationBarHidden(true)
			}
			.navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Для распознования жестов (swap from detailView)
extension UINavigationController {
	open override func viewDidLoad() {
		super.viewDidLoad()
		interactivePopGestureRecognizer?.delegate = nil
	}
}

//struct CustomNavView_Previews: PreviewProvider {
//    static var previews: some View {
//			CustomNavView {
//				Color.orange.ignoresSafeArea()
//			}
//    }
//}


