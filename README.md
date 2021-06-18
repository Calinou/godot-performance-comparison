# Godot performance comparison (`master` vs `3.x`)

The goal of this repository is to compare Godot performance between the
`3.x` branch and `master` (upcoming 4.0). This way, we can track significant
regressions and try to address them.

See also [godot-benchmarks](https://github.com/godotengine/godot-benchmarks).
This repository is an independent project because it also needs to run on the
`3.x` branch, whereas godot-benchmarks makes use of 4.0-only functionality to
provide more independent CPU/GPU timings.

## Structure

- `3.x` contains a Godot project for Godot 3.x (3.3.2 as of writing).
- `master` contains a Godot project for Godot `master` branch (unstable).

Both projects should be developed with the same features so that they can be
compared with each other.

## Benchmark results

- **OS:** Fedora 34
- **GPU:** NVIDIA GeForce GTX 1080
- **Screen resolution:** 2560×1440 (borderless maximized window)

The window manager (KWin) has compositing disabled during the test.

Batching is enabled in both GLES2 and GLES3. Godot's Vulkan renderer does not
use batching and makes use of instancing instead.

**Note:** A debug build is used for both `3.x` and `master` to ensure fairness.
With a fully optimized release build, it's possible to get double the framerate
in `3.x` at least (not tested in `master` since things are currently broken with
optimizations).

**Note:** The `master` branch is still in flux, which means the performance
figures here may evolve in the future.

All measurements are in milliseconds per frame rendered (16.66 ms ~= 60 FPS).
**Lower is better.**

|         Benchmark | `3.x` (GLES2) | `3.x` (GLES3) | Vulkan (`master`) |
|------------------:|---------------|---------------|-------------------|
|    10,000 Sprites | 20.41 mspf    | 40.00 mspf    | 23.81 mspf        |
| 10,000 Polygon2Ds | 11.63 mspf    | 11.36 mspf    | 7.30 mspf         |

The Vulkan renderer should generally be compared against GLES3 rather than
GLES2, since it's much more full-featured than GLES2 (and is also significantly
more full-featured than GLES3).

## License

Copyright © 2021 Hugo Locurcio and contributors

Unless otherwise specified, files in this repository are licensed under the
MIT license. See [LICENSE.md](LICENSE.md) for more information.
