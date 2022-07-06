//
//  CustomNavLink.swift
//  CustomNavBar
//
//  Created by Курдин Андрей on 28.06.2022.
//

import SwiftUI

struct CustomNavLink<Label:View, Destination:View>: View {
	
	let destination: Destination
	let label: Label
	@State var isDetail: Bool = false
	
	init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
		self.destination = destination()
		self.label = label()
	}
	
    var body: some View {
			NavigationLink {
				CustomNavBarContainerView { destination }
					.navigationBarHidden(true)
			} label: { label }

    }
}

//struct CustomNavLink_Previews: PreviewProvider {
//    static var previews: some View {
//			CustomNavView {
//				CustomNavLink {
//					Text("Destination")
//				} label: {
//					Text("Navigate")
//				}
//			}
//    }
//}
