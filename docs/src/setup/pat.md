# Personal Access Token

To open, comment and close issues on GitHub,
you need a fine-grained personal access token (PAT).

!!! note "machine user accounts"
    If you use a PAT linked with your account,
    you will not receive GitHub notifications for issue actions 
    performed by DownstreamTester.
    However, you are allowed to setup a `machine user account`,
    as stated in the [Github Docs](https://docs.github.com/en/get-started/learning-about-github/types-of-github-accounts).

## Generating a new token

Log in to the account for which you want to generate the token
and go to https://github.com/settings/personal-access-tokens 
and click on `Generate new token`.

Choose a `Token name` which makes sense to you,
e.g. `DownstreamTester issues`.

If you want to use the token in a GitHub organization, 
be sure to select the organization as `Resource owner`.

Choose an Expiration date that is convenient for you,
but keep in mind that regulare renewal of tokens is recommended.

To be able to open issue `Repository access` has to be set to `All repositories` 
or `Only select repositories`.
Then, the category `Repository permissions` will be available. Expand that category and set `Issues` to `Read and write`

!!! note 
    This will automatically enable read access to `Metadata`, 
    which is mandatory for opening issues.

Click on `Generate token` at the bottom,
which opens a popup to show you all selected 
permissions, which should be 
- Issues (Read and write)
- Metadata (Read-only)

Click on `Generate token` again and copy the 
token and/or keep the tab open for now.

## Adding the token as a secret

There are two options for setting up the secret,
for a single repository or for a whole organization. This depends on where you want to use DownstreamTester.

### For a single repository
Go to `Settings > Secrets and variables > actions`

Click on `New repository secret`,
choose a name that makes sense to you, e.g.
`ISSUETOKEN` and add the PAT under `Secret`

### For an organization
Go to `Settings > Secrets and variables > actions`

Click on `New organization secret`,
choose a name that makes sense to you, e.g. 
`ISSUETOKEN` and add the PAT under `Value`.
By default the secret will be accessible by GitHub actions in all public repositories.
Private repositories only have GitHub actions available on paid plans.

You can also choose `selected repositories`
and then select specific repositories by clicking on the cogwheel. 
