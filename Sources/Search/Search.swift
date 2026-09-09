/// A reusable pattern. Searching and consuming its result are separate operations.
public struct Search<Pattern> {
    public let pattern: Pattern
    public init(_ pattern: Pattern) { self.pattern = pattern }
}
