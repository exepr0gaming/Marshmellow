import SwiftUI


// Custom View that will return offset for Page Control
struct OffsetPageTabView<Content: View>: UIViewRepresentable {
	
	var content: Content
	@Binding var maxTabs: CGFloat
	@Binding var offset: CGFloat
	@Binding var selection: Int
	
	func makeCoordinator() -> Coordinator {
		return OffsetPageTabView.Coordinator(parent: self)
	}
	
	init(maxTabs: Binding<CGFloat>, selection: Binding<Int>, offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
		self.content = content()
		self._maxTabs = maxTabs
		self._offset = offset
		self._selection = selection
	}
	
	func makeUIView(context: Context) -> UIScrollView {
		let scrollView = UIScrollView()
		// Extracting SwiftUI View and embedding into UIKit ScrollView
		let hostview = UIHostingController(rootView: content)
		hostview.view.translatesAutoresizingMaskIntoConstraints = false
		
		let scrViewConstraints = [
			hostview.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
			hostview.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			hostview.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			hostview.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			
			// if using vertical Paging - then don't declate height constraint
			hostview.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
		]
		
		scrollView.addSubview(hostview.view)
		scrollView.addConstraints(scrViewConstraints)
		
		// Enabling Paging
		scrollView.isPagingEnabled = true
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		
		// Vertical scroll DISABLED
		scrollView.contentInsetAdjustmentBehavior = .never
		
		// settings Delegate
		scrollView.delegate = context.coordinator
		return scrollView
	}
	
	func updateUIView(_ uiView: UIScrollView, context: Context) {
		// need to update only when offset changed manually
		// just check the current and scrollView offsets
		let currentOffset = uiView.contentOffset.x
		if currentOffset != offset {
			uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
		}
	}
	
	// Pager Offset...
	class Coordinator: NSObject, UIScrollViewDelegate {
		var parent: OffsetPageTabView
		
		init(parent: OffsetPageTabView) {
			self.parent = parent
		}
		
		func scrollViewDidScroll(_ scrollView: UIScrollView) {
			let offset = scrollView.contentOffset.x
			let maxTabs = parent.maxTabs

			// Safer side updating selection on scroll
			let maxSize = scrollView.contentSize.width
			//let currentSelection = (offset / maxSize).rounded()
			let currentSelection = maxTabs / (maxSize / offset)
			parent.selection = Int(currentSelection)
//			print("maxTabs= \(maxTabs), offset= \(offset), maxSize= \(maxSize), cS= \(currentSelection), intCS= \(Int(currentSelection))")
			
			parent.offset = offset
		}
	}
	
}

//struct OffsetPageTabView_Previews: PreviewProvider {
//	static var previews: some View {
//		SecondScreenView(linkToFetchCategory: "")
//	}
//}
