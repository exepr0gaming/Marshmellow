//
//  NetworkEnums.swift
//  Marshmellow
//
//  Created by Курдин Андрей on 26.05.2022.
//

import Foundation

enum FetchUrlsE: String {
	case wallpapers = "/api/wallpapers/"
	case live = "/wallpapers/live/"
}

enum APIErrorE: Error, CustomStringConvertible {
	case badURL
	case badResponse(statusCode: Int)
	case url(URLError?)
	case parsing(DecodingError?)
	case unknown
	
	var localizedDescription: String {
		// feedback for users
		switch self {
			case .badURL, .parsing, .unknown: return "Sorry, something went wrong."
			case .badResponse(_): return "Sorry, the connection to our server failed."
			case .url(let err): return err?.localizedDescription ?? "Something went wrong"
		}
	}
	
	var description: String {
		// info for debugging
		switch self {
			
			case .badURL: return "invalid URL"
			case .badResponse(statusCode: let statusCode): return "bad response with status code \(statusCode)"
			case .url(let err): return err?.localizedDescription ?? "url session err"
			case .parsing(let err): return "parsing error \(err?.localizedDescription ?? "")"
			case .unknown: return "unknown error"
		}
	}
}
