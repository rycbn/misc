public struct Profile: Codable, Identifiable, Equatable {
    public let id: String
    public let firstname: String
    public let surname: String
    public let dob: String
    public let image: String
    public let relationships: Relationships
    
    public init(
        id: String,
        firstname: String,
        surname: String,
        dob: String,
        image: String,
        relationships: Relationships
    ) {
        self.id = id
        self.firstname = firstname
        self.surname = surname
        self.dob = dob
        self.image = image
        self.relationships = relationships
    }
}

public struct Relationships: Codable, Equatable {
    public let spouse: String?
    public let mother: String?
    public let father: String?
    public let children: [String]?
    
    public init(
        spouse: String? = nil,
        mother: String? = nil,
        father: String? = nil,
        children: [String]? = nil
    ) {
        self.spouse = spouse
        self.mother = mother
        self.father = father
        self.children = children
    }
}
