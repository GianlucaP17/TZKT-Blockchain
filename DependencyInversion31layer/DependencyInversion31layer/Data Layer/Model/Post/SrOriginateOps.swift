/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct SrOriginateOps : Codable {
	let type : String?
	let id : Int?
	let level : Int?
	let timestamp : String?
	let hash : String?
	let sender : Sender?
	let counter : Int?
	let gasLimit : Int?
	let gasUsed : Int?
	let storageLimit : Int?
	let storageUsed : Int?
	let bakerFee : Int?
	let storageFee : Int?
	let status : String?
	let pvmKind : String?
	let kernel : String?
	let originationProof : String?
	let parameterType : String?
	let genesisCommitment : String?
	let rollup : Rollup?
	let errors : [Errors]?
	let quote : Quote?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case id = "id"
		case level = "level"
		case timestamp = "timestamp"
		case hash = "hash"
		case sender = "sender"
		case counter = "counter"
		case gasLimit = "gasLimit"
		case gasUsed = "gasUsed"
		case storageLimit = "storageLimit"
		case storageUsed = "storageUsed"
		case bakerFee = "bakerFee"
		case storageFee = "storageFee"
		case status = "status"
		case pvmKind = "pvmKind"
		case kernel = "kernel"
		case originationProof = "originationProof"
		case parameterType = "parameterType"
		case genesisCommitment = "genesisCommitment"
		case rollup = "rollup"
		case errors = "errors"
		case quote = "quote"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		level = try values.decodeIfPresent(Int.self, forKey: .level)
		timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
		hash = try values.decodeIfPresent(String.self, forKey: .hash)
		sender = try values.decodeIfPresent(Sender.self, forKey: .sender)
		counter = try values.decodeIfPresent(Int.self, forKey: .counter)
		gasLimit = try values.decodeIfPresent(Int.self, forKey: .gasLimit)
		gasUsed = try values.decodeIfPresent(Int.self, forKey: .gasUsed)
		storageLimit = try values.decodeIfPresent(Int.self, forKey: .storageLimit)
		storageUsed = try values.decodeIfPresent(Int.self, forKey: .storageUsed)
		bakerFee = try values.decodeIfPresent(Int.self, forKey: .bakerFee)
		storageFee = try values.decodeIfPresent(Int.self, forKey: .storageFee)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		pvmKind = try values.decodeIfPresent(String.self, forKey: .pvmKind)
		kernel = try values.decodeIfPresent(String.self, forKey: .kernel)
		originationProof = try values.decodeIfPresent(String.self, forKey: .originationProof)
		parameterType = try values.decodeIfPresent(String.self, forKey: .parameterType)
		genesisCommitment = try values.decodeIfPresent(String.self, forKey: .genesisCommitment)
		rollup = try values.decodeIfPresent(Rollup.self, forKey: .rollup)
		errors = try values.decodeIfPresent([Errors].self, forKey: .errors)
		quote = try values.decodeIfPresent(Quote.self, forKey: .quote)
	}

}