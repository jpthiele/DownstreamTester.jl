# Configuration

The configuration is done with a JSON file.
The default file is called `DownstreamTester.json` and placed in the root folder of the repository.
You can however provide a different configuration file/path through the keyword arguments.

## Your package repository

The first information you set is the repository
for the 'upstream' package, i.e. the package for which you want to run nightly tests or test its changes against the downstream packages.

### Minimal setup

The bare minimum information is the `"name"`
of the package and its `"url"` as shown below.
```
{
    "repo":{
        "name": "MyPackage",
        "url": "https://github.com/myusername/MyPackage.jl"
    },
    # Downstream information will follow below
}
```

### Reporting to a different repo

Optionally, you can specify a different repository for keeping issues raised by DownstreamTester.
This can be done by adding a `"reporting"` value to the `"repo"` entry, e.g.
```
        "reporting": "myusername/myissuerepo"
```
!!! note
    Make sure that you generate the [Personal Access Token](@ref) for the
    `"reporting"` repository.

## Downstream packages
!!! todo
    This feature is still work in progress,
    so configuration description will be added once final.
