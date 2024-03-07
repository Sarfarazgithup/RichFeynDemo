import Foundation
import Alamofire

// MARK: - UserResponseModel
struct UserResponseModel: Codable {
    var page, perPage, total, totalPages: Int?
    var data: [User]?
    var support: Support?

   
}




struct User : Codable {
var id : Int?
var email : String?
var first_name : String?
var last_name : String?
var avatar : String?
}


// MARK: - Support
struct Support: Codable {
    var url: String
    var text: String
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}



