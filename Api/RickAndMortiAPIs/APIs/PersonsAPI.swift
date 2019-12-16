//
// PersonsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class PersonsAPI {
    /**
     new page
     
     - parameter page: (query) number of page (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func callGet(page: Int? = nil, completion: @escaping ((_ data: PersonList?,_ error: Error?) -> Void)) {
        callGetWithRequestBuilder(page: page).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     new page
     - GET /
     - parameter page: (query) number of page (optional)
     - returns: RequestBuilder<PersonList> 
     */
    open class func callGetWithRequestBuilder(page: Int? = nil) -> RequestBuilderForRAM<PersonList> {
        let path = "/"
        let URLString = RickAndMortiAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilderForRAM<PersonList>.Type = RickAndMortiAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}