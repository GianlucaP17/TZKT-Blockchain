import Foundation
public struct Sender : Codable {
	let alias : String?
	let address : String?

	enum CodingKeys: String, CodingKey {

		case alias = "alias"
		case address = "address"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		address = try values.decodeIfPresent(String.self, forKey: .address)
	}

}
