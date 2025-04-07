# Logging branch(es)

We need a place to store the daily log files and list of opened issues.
The simplest way is to set up an orphan branch, i.e. one not connected to the
git history of the main branch.

To avoid merge conflicts between individual actions
we suggest to setup one branch each action.
The name is arbitrary but a clear name is recommended.

In the following we will show the setup for a single nightly
action with a branch named `DownstreamTester/nightlylogs`

To create the branch, go to your local copy and call

```sh
git switch --orphan DownstreamTester/nightlylogs
```

Next, we add a `README.md` to explain what the branch is for.
(Be sure to change the package name in the example)

```markdown
# MyPackage.jl DownstreamTester nightly log branch

This branch is an 'orphan' branch to log information about DownstreamTester.jl nightly runs.
```

Finally, we add the `README.md` to git and push the new branch to the repository.

```sh
git add README.md
git commit -m "Initial commit, add Readme"
git push -u origin DownstreamTester/nightlylogs
```
