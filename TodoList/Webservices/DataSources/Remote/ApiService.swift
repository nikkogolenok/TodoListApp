//
//  ApiService.swift
//  TodoList
//
//  Created by Никита Коголенок on 27.09.22.
//

import Foundation
import Combine

struct ApiService {
    static let baseURL = URL(string: "https://todolist.dev2.cogniteq.com/api/v1")
}

enum RequestMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

extension ApiService {
    
    static func request(_ path: ApiPath, method: RequestMethod, token: String = "", formData: Data = Data()) -> URLRequest {
        guard  let baseURL = baseURL,
               let components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true),
               let url = components.url
        else { fatalError("Can't open the url") }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("\(String(describing: formData.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !token.isEmpty {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch method {
        case .post, .put:
            request.httpBody = formData
        case .get:
            break
        case .delete:
            break
        }
        
        return request
    }
}
