//
//  NotificationManager.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 16.06.2022.
//

import SwiftUI

class NotificationManager {
	static let shared = NotificationManager()
	
	func requestAuthorization() {
		let options: UNAuthorizationOptions = [.alert, .sound, .badge, .provisional] // provisional - для тестового уведомления без разрешения пользователя
		UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, err) in
			switch success {
				case true:
					print("Success requestAuthorization True")
				case false:
					print("Success requestAuthorization False")
			}
			if let err = err {
				print("Error from requestAuthorization: \(err)")
			}
		}
	}
	
	func setNotification(title: String, subtitle: String, sound: UNNotificationSound = .default, badge: NSNumber = 1, _ hour: Int, _ minute: Int, _ second: Int = 0, weekday: Int) {
		let notContent = UNMutableNotificationContent()
		notContent.title = title
		notContent.subtitle = subtitle
		notContent.sound = sound
		notContent.badge = badge
		
		let dateComponents = DateComponents(hour: hour, minute: minute, second: second, weekday: weekday)
		let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
		let request = UNNotificationRequest(identifier: UUID().uuidString, content: notContent, trigger: calendarTrigger)
		UNUserNotificationCenter.current().add(request)
	}
	
	// MARK: - для отмены всех планов будущих уведомлений
	func cancelNotification() {
		UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
		UNUserNotificationCenter.current().removeAllDeliveredNotifications()
	}
	
	func setAllNotifications() {
		// Sunday
		setNotification(title: "Sunday Marshmello 😋", subtitle: "Decorate your phone🌻", 9, 15, weekday: 1)
		setNotification(title: "What will you choose?", subtitle: "TwoSub", 13, 15, weekday: 1)
		setNotification(title: "Marshmello wallpaper😋", subtitle: "Choose a wallpaper for the coming week", 19, 15, weekday: 1)
		
		// Monday
		setNotification(title: "New week - new wallpapers!", subtitle: "Upgrade your phone!🌻", 9, 15, weekday: 2)
		setNotification(title: "New, New, New", subtitle: "Hundreds of amazing Wallpapers have been added!", 13, 15, weekday: 2)
		setNotification(title: "How to cheer up?", subtitle: "Update your wallpaper right now!", 19, 15, weekday: 2)
		
		// Tuesday
		setNotification(title: "Marshmello wallpaper😋", subtitle: "New wallpapers are available ⚡", 9, 15, weekday: 3)
		setNotification(title: "What will you choose?", subtitle: "New wallpapers is available 🌟", 13, 15, weekday: 3)
		setNotification(title: "Marshmello wallpaper😋", subtitle: "New wallpapers is available 🌟", 19, 15, weekday: 3)
		
		// Wednesday
		setNotification(title: "The middle of the week 🌟", subtitle: "How long have you changed your wallpaper?", 9, 15, weekday: 4)
		setNotification(title: "New, New, New", subtitle: "Hundreds of amazing Wallpapers have been added!", 13, 15, weekday: 4)
		setNotification(title: "How to cheer up?", subtitle: "Update your wallpaper right now!", 19, 15, weekday: 4)
		
		// Thursday
		setNotification(title: "Marshmello wallpaper😋", subtitle: "Don't forget to change your wallpaper!⚡", 9, 15, weekday: 5)
		setNotification(title: "What will you choose?", subtitle: "New wallpapers is available 🌟", 13, 15, weekday: 5)
		setNotification(title: "Marshmello wallpaper😋", subtitle: "New Live wallpapers is available 🌟", 19, 15, weekday: 5)
		
		// Friday
		setNotification(title: "Marshmello wallpaper😋", subtitle: "New wallpapers are available ⚡", 9, 15, weekday: 6)
		setNotification(title: "New, New, New", subtitle: "Hundreds of amazing Wallpapers have been added!", 13, 15, weekday: 6)
		setNotification(title: "How to cheer up?", subtitle: "Update your wallpaper right now!", 19, 15, weekday: 6)
		
		// Saturday
		setNotification(title: "New, New, New", subtitle: "Hundreds of amazing Wallpapers have been added!", 9, 15, weekday: 7)
		setNotification(title: "Marshmello wallpaper😋", subtitle: "New wallpapers is available 🌟", 13, 15, weekday: 7)
		setNotification(title: "Marshmello wallpaper😋", subtitle: "New Live wallpapers is available 🌟", 19, 15, weekday: 7)
	}
}
