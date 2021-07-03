public struct Profiles: Codable, Identifiable, Equatable {
    public let id: String
    public let firstname: String
    public let surname: String
    public let dob: String
    public let image: String?
    
    public init(
        id: String,
        firstname: String,
        surname: String,
        dob: String,
        image: String? = nil
    ) {
        self.id = id
        self.firstname = firstname
        self.surname = surname
        self.dob = dob
        self.image = image
    }
}
