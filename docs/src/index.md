# DownstreamTester.jl

This package offers a toolkit for performing and tracking tests through GitHub issues.
There are two workflows:

A [Nightly workflow](@ref), to test your package
against the nightly release of the Julia development version

A Downstream workflow (WIP), to test your package
against downstream packages which depend on your package.

!!! note
    The downstream workflow is still a work in progress.
