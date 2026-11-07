public struct Search<Pattern> {
    public let pattern: Pattern
    public init(_ pattern: Pattern) { self.pattern = pattern }
}

extension Search {

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
