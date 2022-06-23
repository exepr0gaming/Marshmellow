import UIKit
import GoogleMobileAds

class GADNativeViewController: UIViewController {

	/// The height constraint applied to the ad view, where necessary.
	var heightConstraint: NSLayoutConstraint?

	/// The ad loader. You must keep a strong reference to the GADAdLoader during the ad loading
	var adLoader: GADAdLoader!

	/// The native ad view that is being presented.
	var nativeAdView: GADNativeAdView!

	/// The ad unit ID.
	let adUnitID = "ca-app-pub-3940256099942544/3986624511"

	override func viewDidLoad() {
		super.viewDidLoad()

		guard
			let nibObjects = Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil),
			let adView = nibObjects.first as? GADNativeAdView
		else {
			assert(false, "Could not load nib file for adView")
			return
		}
		setAdView(adView)
		refreshAd()
	}

  func setAdView(_ view: GADNativeAdView) {

    nativeAdView = view
    self.view.addSubview(nativeAdView)
    nativeAdView.translatesAutoresizingMaskIntoConstraints = false

    // Layout constraints for positioning the native ad view to stretch the entire width and height
    // of the nativeAdPlaceholder.
    let viewDictionary = ["_nativeAdView": nativeAdView!]
    self.view.addConstraints(
      NSLayoutConstraint.constraints(
        withVisualFormat: "H:|[_nativeAdView]|",
        options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
    )
    self.view.addConstraints(
      NSLayoutConstraint.constraints(
        withVisualFormat: "V:|[_nativeAdView]|",
        options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
    )
  }

  // MARK: - Actions

  /// Refreshes the native ad.
  func refreshAd() {
    adLoader = GADAdLoader(
      adUnitID: adUnitID, rootViewController: self,
      adTypes: [.native], options: nil)
    adLoader.delegate = self
    adLoader.load(GADRequest())
  }

  /// Returns a `UIImage` representing the number of stars from the given star rating; returns `nil`
  /// if the star rating is less than 3.5 stars.
  func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
    guard let rating = starRating?.doubleValue else {
      return nil
    }
    if rating >= 5 {
      return UIImage(named: "stars_5")
    } else if rating >= 4.5 {
      return UIImage(named: "stars_4_5")
    } else if rating >= 4 {
      return UIImage(named: "stars_4")
    } else if rating >= 3.5 {
      return UIImage(named: "stars_3_5")
    } else {
      return nil
    }
  }
}

// MARK: - extension GADVideoControllerDelegate
extension GADNativeViewController: GADVideoControllerDelegate {

  func videoControllerDidEndVideoPlayback(_ videoController: GADVideoController) {
    print("Video playback has ended.")
  }
}

// MARK: - extension GADNativeAdLoaderDelegate
extension GADNativeViewController: GADNativeAdLoaderDelegate {

  func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {

    // Set ourselves as the native ad delegate to be notified of native ad events.
    nativeAd.delegate = self

    // Deactivate the height constraint that was set when the previous video ad loaded.
    heightConstraint?.isActive = false // в принципе роли не играет

		// Заполнить представление нативной рекламы собственными рекламными ресурсами.
		// Заголовок и медиаконтент обязательно присутствуют в каждом нативном объявлении.
    (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
    nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

		// В одних нативных объявлениях есть видео, а в других нет. Приложения могут использовать
		// Свойство GADVideoController hasVideoContent, чтобы определить, присутствует ли оно, и настроить их Интерфейс
    let mediaContent = nativeAd.mediaContent
    if mediaContent.hasVideoContent {
			// Действуя как делегат GADVideoController, этот ViewController получает сообщения
      mediaContent.videoController.delegate = self
      print("NativeAd contains a video asset.")
    } else {
      print("NativeAd does not contain a video.")
    }

		// Это приложение использует фиксированную ширину для GADMediaView и изменяет его высоту в соответствии с аспектом
		// ratio of the media it displays.
    if let mediaView = nativeAdView.mediaView, nativeAd.mediaContent.aspectRatio > 0 {
      heightConstraint = NSLayoutConstraint(
        item: mediaView,
        attribute: .height,
        relatedBy: .equal,
        toItem: mediaView,
        attribute: .width,
        multiplier: CGFloat(1 / nativeAd.mediaContent.aspectRatio),
        constant: 0)
      heightConstraint?.isActive = true
    }

    // These assets are not guaranteed to be present. Check that they are before
    // showing or hiding them.
    (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
    nativeAdView.bodyView?.isHidden = nativeAd.body == nil

    (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
    nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

    (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
    nativeAdView.iconView?.isHidden = nativeAd.icon == nil

    (nativeAdView.starRatingView as? UIImageView)?.image = imageOfStars(from: nativeAd.starRating)
    nativeAdView.starRatingView?.isHidden = nativeAd.starRating == nil

    (nativeAdView.storeView as? UILabel)?.text = nativeAd.store
    nativeAdView.storeView?.isHidden = nativeAd.store == nil

    (nativeAdView.priceView as? UILabel)?.text = nativeAd.price
    nativeAdView.priceView?.isHidden = nativeAd.price == nil

    (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
    nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil
	
				

				 
		// Чтобы SDK правильно обрабатывал сенсорные события, взаимодействие с пользователем должно быть отключено.
    nativeAdView.callToActionView?.isUserInteractionEnabled = false

		// Чтобы объявление было кликабельным, нужно связать представление нативной рекламы с объектом нр
		// Примечание: это всегда следует делать после заполнения просмотров рекламы.
    nativeAdView.nativeAd = nativeAd
  }

  func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
    print("\(adLoader) failed with error: \(error.localizedDescription)")
  }
}

// MARK: - GADNativeAdDelegate implementation
extension GADNativeViewController: GADNativeAdDelegate {

  func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }

  func nativeAdIsMuted(_ nativeAd: GADNativeAd) {
    print("\(#function) called")
  }
}
