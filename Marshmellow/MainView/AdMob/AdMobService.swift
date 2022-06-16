//
//  AdMobService.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 02.06.2022.
//

import SwiftUI
import GoogleMobileAds

class AdMobService: ObservableObject {
    
	func adStarted(){
		let ads = GADMobileAds.sharedInstance()
		ads.start { status in
			// Optional: Log each adapter's initialization latency.
			let adapterStatuses = status.adapterStatusesByClassName
			for adapter in adapterStatuses {
				let adapterStatus = adapter.value
				NSLog("@@@Adapter Name: %@, Description: %@, Latency: %f", adapter.key,
				adapterStatus.description, adapterStatus.latency)
			}

			// Start loading ads here...
		}
	} // adStarted
}
