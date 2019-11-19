struct Comics: Codable {
    var available: Int
    var collectionURI: String
    var items: [Resource]
    var returned: Int
}
