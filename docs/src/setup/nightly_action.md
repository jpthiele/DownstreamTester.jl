# Nightly GitHub Action

As a final step we can now set up the GitHub action workflow file `downstreamtester.yml`.
This file has to be added to the main branch in the `.github/workflows/` folder.

In the following, we will go through the file step by step,
but a complete version can be found at the end of this page.
Many of the name choices in the following are arbitrary,
so feel free to change them according to your liking.

## General configuration

First we specify the category name and when the job should run.
Here, this is daily at 6 AM, but choose whatever suits you best.
Additionally, we want to be able to run the job manually, i.e. on `workflow_dispatch`

```YAML
name: DownstreamTester

on:
  schedule:
    - cron: 0 6 * * * # Every day at 6:00

  #Allow manual triggering of workflow
  workflow_dispatch:
```

## Nightly job configuration

Our job will be called `nightly`.

Since we are mostly interested in incompatibilities and breaking changes
between our package and the current nightly version of Julia we only
run the job on Linux, or more specifically the latest release of Ubuntu.

We also have to set our [Personal Access Token](@ref) as the environment
variable `ISSUETOKEN`. This is the variable DownstreamTester.jl will query
to authenticate with GitHub.
The variable is directly inserted into `authenticate()` of [Github.jl](https://github.com/JuliaWeb/GitHub.jl)
and is not read or saved in any other fashion.
If you feel unsure about this feel free to search the whole DownstreamTester.jl
code base for `ISSUETOKEN`!

```YAML
jobs:
  nightly:
    runs-on: ubuntu-latest

    env:
      ISSUETOKEN: ${{secrets.ISSUETOKEN}}
```
## Setup steps

We start with the first steps of the action to set up the directory structure,
Julia and git.

We will need to checkout the main branch into a subfolder `main`
and the logs (`ref:DownstreamTester/nightlylogs`) into a subfolder
with the name `testdeps/logs` (don't change this name, it's hardcoded!).

To be able to commit the logs into the logging branch we also have to set up
the git user email and name. If you have set up a "machine user" (see [GitHub Docs](https://docs.github.com/en/get-started/learning-about-github/types-of-github-accounts#user-accounts)),
you can use its name and email.
```YAML
    steps:
      # Check out main branch (to get the config file)
      - uses: actions/checkout@v4
        with:
          path: "main"

      # Check out logs branch into testdeps/logs
      - uses: actions/checkout@v4
        with:
          ref: DownstreamTester/nightlylogs
          path: "testdeps/logs"

      # Download  nightly version of Julia
      - uses: julia-actions/setup-julia@v2
        with:
          version: 'nightly'

      - name: setup git
        run: |
          git config --global user.email "me@mymailprovider.org"
          git config --global user.name "myusername"
```

## Add and run DownstreamTester

We execute the Julia code in the `main` folder,
i.e. the one containing the [Configuration](@ref) file.
We use Pkg to add and use DownstreamTester.

!!!note
   Registration of DownstreamTester in the general registry is planned
   for when the documentation of nightly is completed.
   But for now, the `Pkg.add` command has to be performed with the GitHub URL.


Finally, we run the nightly workflow by calling:

```@docs
nightly
```
!!!note "arguments"
    If you chose a different file name in [Configuration](@ref),
    be sure to set `configfile`.

    By default, the issue will be labeled with `nightly`, if that label exists.
    If you want a different label (or multiple) you can set `nightlylabels` to a vector of label names.

    The `do_clone` keyword can be ignored as it is only for developing
    DownstreamTester.

```YAML
      # Add DownstreamTester to local Julia environment and run nightly()
      - name: run nightly()
        working-directory: ./main
        run: |
          julia -e '
            using Pkg
            Pkg.add(url="https://github.com/jpthiele/DownstreamTester.jl")
            using DownstreamTester
            DownstreamTester.nightly()'
```

## Commit logs

Internally, DownstreamTester already calls `git add` and `git commit` for the new and updated log files, 
so we only need to push the new commit from `testdeps/logs`.
```YAML
      # Save the daily logs to the logs branch
      - name: commit logs
        working-directory: ./testdeps/logs
        run: git push
```


## Complete YAML

```YAML
# Set up DownstreamTester.jl to run nightly jobs

name: DownstreamTester


on: 
  schedule:
    - cron: 0 6 * * * # Every day at 6:00

  #Allow manual triggering of workflow
  workflow_dispatch:

jobs:
  nightly:
    runs-on: ubuntu-latest

    env:
      ISSUETOKEN: ${{secrets.ISSUETOKEN}}

    steps:
      # Check out main branch (to get the config file)
      - uses: actions/checkout@v4
        with:
          path: "main"

      # Check out logs branch into testdeps/logs
      - uses: actions/checkout@v4
        with:
          ref: DownstreamTester/nightlylogs
          path: "testdeps/logs"

      # Download  nightly version of Julia
      - uses: julia-actions/setup-julia@v2
        with:
          version: 'nightly'

      - name: setup git
        run: |
          git config --global user.email "me@mymailprovider.org"
          git config --global user.name "myusername"


      # Add DownstreamTester to local Julia environment and run nightly()
      - name: run nightly()
        working-directory: ./main
        run: |
          julia -e '
            using Pkg
            Pkg.add(url="https://github.com/jpthiele/DownstreamTester.jl")
            using DownstreamTester
            DownstreamTester.nightly()'

      # Save the daily logs to the logs branch
      - name: commit logs
        working-directory: ./testdeps/logs
        run: git push
```
