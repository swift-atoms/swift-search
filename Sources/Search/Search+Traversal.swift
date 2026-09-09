extension Search {
    /// Returns the first complete match. Callbacks inspect stable positions without consuming input.
    /// The terminal position is tested too, permitting empty patterns.
    public func first<Position>(
        from start: Position,
        advance: (Position) -> Position?,
        matching: (Pattern, Position) -> Position?
    ) throws(Search<Pattern>.Error) -> Match<Position> {
        var position = start
        while true {
            if let end = matching(pattern, position) { return Match(start: position, end: end) }
            guard let next = advance(position) else { throw .notFound }
            position = next
        }
    }
}
