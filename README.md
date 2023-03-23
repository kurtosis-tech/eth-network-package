Ethereum Network Package
===========================
This is a Kurtosis Starlark Package that will spin up a network of ethereum EL and CL nodes.

SET UP KURTOSIS BRANCH PROTECTION
1. [ ] Under "Branches", create a new branch protection rule
1. [ ] Set the rule name to `main`
1. [ ] Check "Require pull request reviews before merging"
1. [ ] Check "Require approvals" (leaving it at 1)
1. [ ] Check "Require status checks to pass before merging" and select all useful status checks
1. [ ] Check "Require conversation resolution before merging" (NOTE: this is important as people sometimes forget comments)
1. [ ] Check "Do not allow bypassing these settings"
1. [ ] Select "Create" at the bottom

SET UP CIRCLECI
1. [ ] Visit [the CircleCI projects page](https://app.circleci.com/projects/project-dashboard/github/kurtosis-tech/) and select "Set Up Project"
1. [ ] **VERY IMPORTANT:** Open the CircleCI project settings, go to Advanced, and set the following values:
    * [ ] `Pass secrets to builds from forked pull requests` = `false`
        * **HUGE WARNING:** This is VERY VERY IMPORTANT to be set to `false`!!! If it's `true`, somebody could fork our repo, add an `echo "${GITHUB_TOKEN}"` in their fork, our CI would happily run it and print the value, and they'd get to impersonate us and do all sorts of nasty things like delete repos!!!!!
    * [ ] `Only build pull requests` = `true`
        * If this is set to `false` (the default), CircleCI will build _every_ commit, which will quickly exhaust our CircleCI credits and mean we can't build CI
    * [ ] `Auto-cancel redundant builds` = `true`
        * If this is set to `false` (the default), CircleCI will waste credits unnecessarily (which is probably why it defaults to `false` - because they want you using more credits :P)
    * [ ] `Build forked pull requests` = `true` If your repository is going to be public, enable this otherwise CI checks don't run on PRs created through forks.
    * [ ] `Free and Open Source` = `true` If your repository is public, enable this. This gets you free builds!
1. [ ] If you need any additional secrets (Docker, Kurtosis user, etc.), find the ones you need [from the list](https://app.circleci.com/settings/organization/github/kurtosis-tech/contexts?return-to=https%3A%2F%2Fapp.circleci.com%2Fpipelines%2Fgithub%2Fkurtosis-tech) add them to the `context` section of the project's CircleCI `config.yml` using Circle)
