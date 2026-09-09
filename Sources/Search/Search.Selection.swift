extension Search {
    /// Projects a match boundary; searching remains independent of selection.
    public struct Selection {
        public let search: Search
        public let boundary: Boundary
        public init(_ search: Search, boundary: Boundary) { self.search = search; self.boundary = boundary }
    }
}

extension Search {
    public func selecting(_ boundary: Boundary) -> Selection { Selection(self, boundary: boundary) }
}

extension Search.Selection {
    public typealias Error = Search<Pattern>.Error
    public var delimiter: Pattern { search.pattern }
    public func end<Position>(from start: Position, advance: (Position) -> Position?, matching: (Pattern, Position) -> Position?) throws(Search<Pattern>.Error) -> Position {
        let match = try search.first(from: start, advance: advance, matching: matching)
        switch boundary { case .start: return match.start; case .end: return match.end }
    }
}
