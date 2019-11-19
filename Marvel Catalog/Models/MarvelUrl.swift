enum MarvelUrlType: String, Codable {
    case detail = "detail"
    case comiclink = "comiclink"
    case wiki = "wiki"
}

struct MarvelUrl: Codable {
    var type: MarvelUrlType
    var url: String
}
