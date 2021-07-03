public struct ProfilesResponse: Codable {
    public let success: Bool
    public let data: [Profiles]?
    public let error: String?
    
    public init(
        success: Bool,
        data: [Profiles]? = nil,
        error: String? = nil
    ) {
        self.success = success
        self.data = data
        self.error = error
    }
}
