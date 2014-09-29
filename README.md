# hubot-redmine-notifier

[![Build Status](https://travis-ci.org/tenten0213/hubot-redmine-notifier.png?branch=master)](https://travis-ci.org/tenten0213/hubot-redmine-notifier)

Notifies about Redmine creating and updating tickets.
![notification to chat screenshot](notification-screenshot.png)

## Getting Started

### Hubot
1. Install the module: `npm install --save hubot-redmine-notifier`
2. Add it `hubot-redmine-notifier` to your external-scripts.json file in your hubot directory

### Redmine
1. Install [Redmine Webhook Plugin](https://github.com/suer/redmine_webhook) to your Redmine.
2. Add hubot's endpoint to Redmine Project - Settings - WebHook - URL `http://<hubot-host>:<hubot-port>/hubot/redmine-notify?room=<room>` (see Screenshot)

![webhook settings of redmine screenshot](redmine-webhook-settings-screenshot.png)

## License
Licensed under the MIT license.

This script created with reference to the [halkeye/hubot-jenkins-notifier](https://github.com/halkeye/hubot-jenkins-notifier).
