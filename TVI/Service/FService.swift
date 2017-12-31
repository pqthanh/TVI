//
//  FService.swift
//  Folotrail
//
//  Created by Phan Quoc Thanh on 9/1/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class FService: NSObject {
    
    static let sharedInstance = FService()
    
    func request(urlRequest: URLRequestConvertible, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        Alamofire.request(urlRequest).validate().responseJSON { (response) in
                guard response.result.isSuccess else {
                    completion(nil, response.result.error)
                    return
                }
                
                guard let value = response.result.value as? [String: Any] else {
                    completion(nil, nil)
                    return
                }
                
                completion(value["data"], nil)
        }
    }
    
    func request (url: URLConvertible, method: HTTPMethod, params: [String: Any]?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            guard response.result.isSuccess else {
                completion(nil, response.result.error)
                return
            }
            
            guard let value = response.result.value as? [String: Any] else {
                completion(nil, nil)
                return
            }
            
            completion(value, nil)
        }
    }
    
    func apiGoogleMap(origin : String, destination: String, completion: @escaping (_ userInfo: String?) -> ()) -> () {
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=AIzaSyAf_q9ycWDV2x-wT7Q76eYLOpwQk5MJXgs"
        request(url: url, method: .get, params: nil) { (result, error) in
            
            if let result = result as? [String: Any] {
                let routesArray = (result["routes"] as? Array) ?? []
                let routes = (routesArray.first as? Dictionary<String, AnyObject>) ?? [:]
                let overviewPolyline = (routes["overview_polyline"] as? Dictionary<String,AnyObject>) ?? [:]
                let polypoints = (overviewPolyline["points"] as? String) ?? ""
                let line  = polypoints
                completion(line)
            }
            else {
                completion(nil)
            }
        }
    }
    
}
