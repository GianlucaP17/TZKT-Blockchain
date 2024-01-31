import Foundation
public struct PostModel : Codable {
	let level : Int?
	let timestamp : String?
	let proposer : Proposer?

	enum CodingKeys: String, CodingKey {
		case level = "level"
		case timestamp = "timestamp"
		case proposer = "proposer"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		level = try values.decodeIfPresent(Int.self, forKey: .level)
		timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
		proposer = try values.decodeIfPresent(Proposer.self, forKey: .proposer)
	}
    
    public func dotPostEntity() -> PostEntity {
        return PostEntity(level: level, proposer: proposer, timestamp: timestamp, numberOfTransactions: 0)
    }
}
