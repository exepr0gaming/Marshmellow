//
//  MarshmellowApp.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 18.05.2022.
//

import SwiftUI

@main
struct MarshmellowApp: App {
    var body: some Scene {
        WindowGroup {
//					SplashScreenView()
//						.preferredColorScheme(.dark)
//					ContentPresentationView(image: "man2", title: "qweqwe", subTitle: "qweqweqwe", presentationVM: PresentationVM())
//						.preferredColorScheme(.dark)
					PresentationView()
						.preferredColorScheme(.dark)
					//MainView()
					//SecondScreenView()
        }
				
    }
}
