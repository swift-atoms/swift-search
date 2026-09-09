import Search
import Testing
@Test func scalarSearchReturnsBothBoundaries() throws {
    let result = try Search(42).first(from: 0, advance: { $0 < 3 ? $0 + 1 : nil }, matching: { pattern, position in
        pattern == 42 && position == 2 ? 5 : nil
    })
    #expect(result.start == 2)
    #expect(result.end == 5)
}
@Test func emptySearchCanMatchTerminalPosition() throws {
    let result = try Search(()).first(from: 0, advance: { _ in nil }, matching: { _, p in p })
    #expect(result.start == result.end)
}
@Test func missingSearchFails() {
    #expect(throws: Search<Int>.Error.notFound) {
        _ = try Search(42).first(from: 0, advance: { _ in nil }, matching: { _, _ in nil })
    }
}
