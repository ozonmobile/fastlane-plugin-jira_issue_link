# jira_issue_link plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-jira_issue_link)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-jira_issue_link`, add it to your project by running:

```bash
fastlane add_plugin jira_issue_link
```

## About jira_issue_link

Plugin to add remote link to jira issue. 
This plugin fully implement [Jira REST API for remote issue link](https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/)

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

| Key & Env Var | Description | Default |
|-----------------|--------------------|-----------------|
| `url` <br/> `FL_JIRA_SITE` | URL for Jira instance | |
| `context_path` <br/> `FL_JIRA_CONTEXT_PATH` | Owner name, as found in the App's URL in App Center |''|
| `username` <br/> `FL_JIRA_USERNAME` | Username for JIRA instance ||
| `password` <br/> `FL_JIRA_PASSWORD` | Password for Jira ||
| `ticket_id` <br/> `FL_JIRA_TICKET_ID` | Ticket ID for Jira, i.e. IOS-123 ||
| `global_id` | A globally unique identifier that uniquely identifies the remote link. See https://developer.atlassian.com/server/jira/platform/using-fields-in-remote-issue-links/ ||
| `application` <br/> `FL_JIRA_USERNAME` | Remote application instance that stores the remote object. See https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/ ||
| `relationship` <br/> `FL_JIRA_PASSWORD` | Relationship between the remote object and the Jira issue used to group together links in the UI. See https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/ |links to|
| `object` <br/> `FL_JIRA_USERNAME` | The object in the remote system. See https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/ |

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
