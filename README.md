# Scan your Solidity files with BlueMachine System

Using this GitHub Action, scan your Solidity files to detects bugs, vulnerabilities and code issues.

[TMScanner](https://prod.tmscanner.info.net) is the solution to all your scanning needs.

## Requirements

* Have an account on BlueMachine. [Sign up](https://prod.tmscanner.info.net/signUp) if it's not already the case
* You have a valid token in the TMScanner system.
* You have already created a repository and have the repository id
* There is at least one .sol file in the repository where you will setup this github action

## Usage

Enable a workflow in the repository that contains your .sol files, usually declared in `.github/workflows/build.yml`. And edit it to look like:

```yaml
on:
  # Trigger analysis when pushing in "main" branch. Change this to another branch if you need to
  push:
    branches:
      - main
name: BlueMachineScanner Workflow
jobs:
  tmscan:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
      with:
        fetch-depth: 0
    - name: BlueMachinecanner Scan
      uses: raldozamora/bluemachine_ga@main
      with:
        # All arguments are required
        # TM_REPOSITORY_ID: Use an already existing repository id in the BlueMachineScanner system (in this example: 120)
        # TM_SOURCE: The .sol file (or .zip with many .sol files inside) that you want to analyze (in this example: hello.sol)        
        TM_REPOSITORY_ID: 120
        TM_SOURCE: hello.sol
      env:
        # All env variables are required
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        TOKEN_KEY: ${{ secrets.TOKEN_KEY }}
        API_URL: ${{ secrets.API_URL }}
```

### Secrets

- `TOKEN_KEY`: This is the token used to authenticate access to BlueMachineScanner. You can set a Github action secret in the "Secrets" settings page of your repository.
- `API_URL`: URL of the BlueMachineScanner system assigned to you by the BlueMachineScanner team
- `GITHUB_TOKEN`: Provided by Github (see [Authenticating with the GITHUB_TOKEN](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/authenticating-with-the-github_token)).


## Have question or feedback?

To provide feedback (requesting a feature or reporting a bug) please post on the [BlueMachineScanner contact page](https://prod.tmscanner.info.net/contactUs)