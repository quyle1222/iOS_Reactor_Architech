struct NewsOutput:Codable {
    var success:Bool
    var data:[NewsModel]?
}

struct NewsModel:Codable {
    var title:String
    var description:String
    var date:Int?
}
