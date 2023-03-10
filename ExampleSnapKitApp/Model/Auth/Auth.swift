import Foundation

struct AuthInput: Codable {
    let username:String
    let password:String
}

struct AuthOutput:Codable {
    let success:Bool
    let message:String?
    let data: AuthModel?
}

struct AuthModel: Codable {
    let userId:String?
    let username:String?
}
