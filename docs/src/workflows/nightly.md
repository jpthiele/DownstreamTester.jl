# Nightly workflow


## Idea
If you set up a CI job for the nightly version, which mirrors the typical Julia CI setup,
you may receive daily notifications about the same failing test in nightly.
If this is due to a problem with a package outside your control, it can lead you to ignore the notifications altogether.

To mitigate this, DownstreamTester opens an issue if *new* failures happen and closes the issue once
all failures of that day are resolved again.

## Example showcase
The nightly workflow is already set up in [VoronoiFVM.jl](https://github.com/WIAS-PDELib/VoronoiFVM.jl) and flagged an [issue](https://github.com/WIAS-PDELib/VoronoiFVM.jl/issues/175) about
the packages in the test environment not resolving.

Since the problem was fixed, a comment was added
to specify which failure is gone.

Since all failures of that issue were fixed
the issue was also closed automatically.

!!! todo
    add Screenshots

## Flowchart


```mermaid
flowchart TD
    Start(("
    call to
    nightly(configfile;
    kwargs)
    "))
    readconfig[read in config JSON file]
    clone["
    clone package repo
    get HEAD commit hash
    "]
    test[run tests and note failures]
    diff[compare failures with logs]
    newfail{New failures?}
    openissue[Open new issue on GitHub]
    logissue[Log information about issue]
    newfix{New fixes?}
    issueinfo[("
    issue info:
    - number
    - repo
    - failures(Set)
    - fixed(Set)
    ")]
    failureinfo[("
    failure info:
    - test suite
    - test case
    - error message
    - location
    ")]
    writelog["
    Write failures to logfile
    together with:
    package commit hash
    Julia nightly version
    "]
    markfixed["
    Search resp. issue
    mark failure(s) as fixed
    "]
    issuefixed{"
    for each issue:
    are all failures fixed?"
    }
    saveinfo[Update issue log]
    closeissue[Close issue on GitHub]
    done((done))
    Start --> readconfig --> clone --> test --> diff -->newfail
    newfail --> |Yes| openissue --> logissue --> newfix
    logissue--> issueinfo
    test --> failureinfo --> writelog
    newfail --> |No| newfix
    newfix --> |Yes| markfixed --> issuefixed
    newfix --> |No| saveinfo --> done
    issuefixed --> |Yes| closeissue --> issuefixed
    issuefixed --> |All checked| saveinfo
```
