extension Search {
    public struct Match<Position> {
        public let start: Position
        public let end: Position
        public init(start: Position, end: Position) { self.start = start; self.end = end }
    }
}
