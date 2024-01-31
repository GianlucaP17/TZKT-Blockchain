/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Quote : Codable {
	let btc : Int?
	let eur : Int?
	let usd : Int?
	let cny : Int?
	let jpy : Int?
	let krw : Int?
	let eth : Int?
	let gbp : Int?

	enum CodingKeys: String, CodingKey {

		case btc = "btc"
		case eur = "eur"
		case usd = "usd"
		case cny = "cny"
		case jpy = "jpy"
		case krw = "krw"
		case eth = "eth"
		case gbp = "gbp"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		btc = try values.decodeIfPresent(Int.self, forKey: .btc)
		eur = try values.decodeIfPresent(Int.self, forKey: .eur)
		usd = try values.decodeIfPresent(Int.self, forKey: .usd)
		cny = try values.decodeIfPresent(Int.self, forKey: .cny)
		jpy = try values.decodeIfPresent(Int.self, forKey: .jpy)
		krw = try values.decodeIfPresent(Int.self, forKey: .krw)
		eth = try values.decodeIfPresent(Int.self, forKey: .eth)
		gbp = try values.decodeIfPresent(Int.self, forKey: .gbp)
	}

}