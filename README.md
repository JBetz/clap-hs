# clap

Haskell bindings for the [CLAP](https://cleveraudio.org/) audio plugin API.

Clap version: 1.1.6

`Clap.Interface.Foreign.*` has low-level C ABI bindings generated by [c2hsc](https://hackage.haskell.org/package/c2hsc) using [bindings-DSL](https://hackage.haskell.org/package/bindings-DSL).

`Clap.Interface.*` provides idiomatic Haskell types and functions for using the CLAP interface.

`Clap.*` has higher-level functions for building a CLAP host.

# Implementation status

Overall, this library is very WIP and not ready for production use. But it very much aims to be, with the long term goal of being a piece of a larger audio engine written in Haskell that can be used as a modular backend for building DAWs and other music software. It would handle things like sequencing, audio I/O, plugin hosting, SoundFonts, and more. 


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
- [x] process
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
- [x] params
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
- [x] windows