# clap

Haskell bindings for the [CLAP](https://cleveraudio.org/) audio plugin API.

`Clap.Interface.Foreign.*` has low-level C ABI bindings generated by [c2hsc](https://hackage.haskell.org/package/c2hsc) using [bindings-DSL](https://hackage.haskell.org/package/bindings-DSL).

`Clap.Interface.*` provides idiomatic Haskell types and functions for using the CLAP interface.

`Clap.*` has higher-level functions for building a CLAP host.

# Implementation status

Clap version: 1.1.6

## Modules

- [x] audio-buffer
- [x] color
- [x] entry
- [x] events
- [x] fixedpoint
- [x] host
- [x] id
- [x] plugin-factory
- [x] plugin-features
- [x] plugin-invalidation
- [x] plugin
- [ ] process
- [x] stream
- [x] string-sizes
- [x] version

## Extensions

- [ ] audio-ports-config
- [x] audio-ports
- [ ] audio-registry
- [x] gui
- [x] latency
- [x] log
- [ ] note-name
- [x] note-ports
- [ ] params
- [ ] posix-fd-support
- [x] render
- [x] state
- [x] tail
- [x] thread-check
- [ ] thread-pool
- [ ] timer-support
- [ ] voice-info

## Platforms

- [x] unix
- [ ] windows