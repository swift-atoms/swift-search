import Search
import Testing

@Suite
struct `Search boundaries` {
    private let text = Array("abcabc")

    private func find(_ pattern: Character, from start: Int) throws(Search<Character>.Error) -> Search<Character>.Match<Int> {
        try Search(pattern).first(
            from: start,
            advance: { $0 + 1 < text.count ? $0 + 1 : nil },
            matching: { pattern, position in text[position] == pattern ? position + 1 : nil }
        )
    }

    @Test
    func `a match at the start position is found without advancing`() throws {
        let match = try find("a", from: 0)
        #expect(match.start == 0)
        #expect(match.end == 1)
    }

    @Test
    func `the first match after the start wins`() throws {
        #expect(try find("a", from: 1).start == 3)
    }

    @Test
    func `a match at the last position is found`() throws {
        #expect(try find("c", from: 3).start == 5)
    }

    @Test
    func `a pattern that is absent after the start is not found`() {
        #expect(throws: Search<Character>.Error.notFound) { try find("b", from: 5) }
    }

    @Test
    func `a selection returns the chosen boundary`() throws {
        let advance: (Int) -> Int? = { $0 < 10 ? $0 + 1 : nil }
        let matching: (Int, Int) -> Int? = { pattern, position in position == pattern ? position + 2 : nil }
        #expect(try Search(4).selecting(.start).end(from: 0, advance: advance, matching: matching) == 4)
        #expect(try Search(4).selecting(.end).end(from: 0, advance: advance, matching: matching) == 6)
        #expect(Search(4).selecting(.end).delimiter == 4)
    }
}
