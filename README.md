# swift-search

Use this package to find the first place a pattern occurs when you define the positions yourself: you supply how to step from one position to the next and how to test the pattern at a position. Start from `Search<Pattern>`. Use `Search<Pattern>.Selection` when you need only one boundary of the match, for example where a run of input ends at a delimiter. To search a Swift sequence or collection directly, use swift-iterator with its `Search` trait instead. It builds on these types.

## Laws

- The scan is linear and starts at `start` itself. `matching` is tried at `start` before `advance` is called, so a match at the start position is found without advancing.
- The first position where `matching` returns a value wins. Later matches are never examined.
- `matching` is also tried at the last position, the one for which `advance` returns `nil`. The search throws `.notFound` only after that position fails too.
- The match runs from the position that matched to whatever `matching` returned there. Nothing checks that the end does not come before the start. An end equal to the start is a valid empty match.
- If `advance` never returns `nil` and nothing matches, the search never ends.
- Nothing is cached. Every call runs `advance` and `matching` again from `start`.
- `Search<Pattern>.Selection.end(from:advance:matching:)` runs the same search and returns the match's start for `.start` and its end for `.end`.
