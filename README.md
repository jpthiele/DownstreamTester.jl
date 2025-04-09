# DownstreamTester.jl


[![Build status](https://github.com/jpthiele/DownstreamTester.jl/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/jpthiele/DownstreamTester.jl/actions/workflows/ci.yml?query=branch%3Amain)
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://jpthiele.github.io/DownstreamTester.jl/stable/index.html)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://jpthiele.github.io/DownstreamTester.jl/dev/index.html)
[![code style: runic](https://img.shields.io/badge/code_style-%E1%9A%B1%E1%9A%A2%E1%9A%BE%E1%9B%81%E1%9A%B2-black)](https://github.com/fredrikekre/Runic.jl)


This package is aimed at simplifying and denoising nightly and downstream tests.
Instead of notifications for the same failing tests in scheduled CI runs
this package will open an issue on the respective repository and close it
once the failing tests pass again. 

**IMPORTANT** The downstream workflow is still work in progress

## Showcase 
The nightly workflow is already in use in [VoronoiFVM.jl](https://github.com/WIAS-PDELib/VoronoiFVM.jl).

For an example issue see [VoronoiFVM.jl#175](https://github.com/WIAS-PDELib/VoronoiFVM.jl/issues/175).

## Recent Changes
Please look up the list of recent [changes](https://jpthiele.github.io/DownstreamTester.jl/stable/changes)
