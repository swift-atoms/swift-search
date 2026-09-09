# swift-search

Search stores a pattern independently of any source. Its position-based `first`
operation returns both match boundaries. Callbacks must inspect stable positions,
advance toward termination, and return the end of a complete match or nil.
Neither positions nor patterns need collection or sequence conformance.

`search.selecting(.start)` and `search.selecting(.end)` project the same search
result. Collection, Iterator, and Parser interpret those projections as selection
before or through a match. Missing patterns throw; empty patterns may match at
the terminal position. Searching itself does not commit source consumption.
