import Foundation
public struct DetailModel : Codable {
	let id : Int?
	let level : Int?
	let sender : Sender?
    let target: Target?
	let amount : Int?
	let status : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case level = "level"
		case sender = "sender"
        case target = "target"
		case amount = "amount"
		case status = "status"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		level = try values.decodeIfPresent(Int.self, forKey: .level)
		sender = try values.decodeIfPresent(Sender.self, forKey: .sender)
        target = try values.decodeIfPresent(Target.self, forKey: .target)
        amount = try values.decodeIfPresent(Int.self, forKey: .amount)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
