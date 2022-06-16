//
//  NativeAdViewRepresentable.swift
//  AdmobNativeSample
//
//  Created by Sakura on 2021/05/07.
//

import SwiftUI

struct NativeAdViewRepresentable : UIViewControllerRepresentable {
	
	//var adUnitID: String

  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = GADNativeViewController()
    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }

}
