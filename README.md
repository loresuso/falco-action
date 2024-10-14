# Falco Action

Run [Falco](https://github.com/falcosecurity/falco) in a GitHub Action to detect suspicious behavior in your CI/CD workflows. 

This GitHub Action can be used to monitor your GitHub runner and detect Software Supply Chain attacks.

The repository contains two GitHub Actions:
- The [start](start/action.yaml) action is used to start a [Sysdig](https://github.com/draios/sysdig) file
- The [stop](stop/action.yaml) action is used to stop Sysdig and run Falco on the recorded capture file get visibility on the steps of your GitHub Actions job

As a result, you will get a summary of what happened in the [job summary](https://github.blog/news-insights/product-news/supercharging-github-actions-with-job-summaries/)

## Usage

### Start

```
- uses: falcosecurity/action/start@<commit-sha>
  todo(loresuso): document inputs
```

### Stop

```
- uses: falcosecurity/action/stop@<commit-sha>
  todo(loresuso): document inputs
```

## Scenario
```
```

