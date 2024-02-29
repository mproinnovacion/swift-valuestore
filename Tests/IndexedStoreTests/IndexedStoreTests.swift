import Foundation
import XCTest

import ValueStore
import IndexedStore

class IndexedStoreTests: XCTestCase {
	func testRef() async throws {
		let ref = Reference<[Int: String]>()
		try await ref.indexedStore().testCycle(7, value: "Hello")
	}

	func testOptionalSet() async throws {
		let ref = Reference<[Int: String]>()
		let store = ref.indexedStore()
		
		try await store.set(42, "Hello")
		let saved = try await store.load(42)
		
		XCTAssertEqual(saved, "Hello")
		
		try await store.set(42, nil)
		
		let loaded = try? await store.load(42)
		
		XCTAssertNil(loaded)
	}
}
