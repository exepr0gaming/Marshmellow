//
//  LivePhotoView.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 21.06.2022.
//

import PhotosUI
import SwiftUI

struct LivePhotoView: UIViewRepresentable {
		@Binding var livePhoto: PHLivePhoto?

		func makeUIView(context: Context) -> PHLivePhotoView {
				let liveView = PHLivePhotoView()
				return liveView
		}

		func updateUIView(_ lpView: PHLivePhotoView, context: Context) {
				lpView.livePhoto = livePhoto
		}
}

struct LiveSwiftUIView: View {
		@State var livePhoto: PHLivePhoto?
		var body: some View {
				LivePhotoView(livePhoto: $livePhoto)
		}
}
