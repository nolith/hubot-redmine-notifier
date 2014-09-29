'use strict'
process.env.PORT = 0 # pick a random port for this test
Hubot = require('hubot')
Path = require('path')
request = require('supertest')
sinon = require('sinon')

adapterPath = Path.join Path.dirname(require.resolve 'hubot'), "src", "adapters"
robot = Hubot.loadBot adapterPath, "shell", true, "MochaHubot"

hubot_redmine_notifier = require('../scripts/hubot-redmine-notifier')(robot)

test_data = [
  {
    "name": "new issue",
    "expected_out": "[Test] tenten0213 opened Feature#20\nSubject: Some Feature\nStatus: New\nPriority: Normal\nAssignee: tenten0213\nURL: http://example.com/issues/20",
    "body": {
      "payload": {
        "url": "http://example.com/issues/20",
        "issue": {
          "assignee": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "Amanuma",
            "firstname": "Takehito",
            "mail": "takehito.0213@gmail.com",
            "login": "tenten0213",
            "id": 3
          },
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "Amanuma",
            "firstname": "Takehito",
            "mail": "takehito.0213@gmail.com",
            "login": "tenten0213",
            "id": 3
          },
          "priority": {
            "name": "Normal",
            "id": 2
          },
          "tracker": {
            "name": "Feature",
            "id": 2
          },
          "parent_id": null,
          "root_id": 20,
          "closed_on": null,
          "updated_on": "2014-10-01T10:34:03Z",
          "created_on": "2014-10-01T10:34:03Z",
          "description": "test",
          "subject": "Some Feature",
          "id": 20,
          "done_ratio": 0,
          "start_date": "2014-10-01",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 0,
          "project": {
            "homepage": "",
            "created_on": "2014-09-29T01:19:34Z",
            "description": "",
            "name": "Test",
            "identifier": "test",
            "id": 1
          },
          "status": {
            "name": "New",
            "id": 1
          }
        },
        "action": "opened"
      }
    }
  },
  {
    "name": "new issue with no assignee",
    "expected_out": "[Test] tenten0213 opened Feature#20\nSubject: Some Feature\nStatus: New\nPriority: Normal\nAssignee: \nURL: http://example.com/issues/20",
    "body": {
      "payload": {
        "url": "http://example.com/issues/20",
        "issue": {
          "assignee": null,
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "Amanuma",
            "firstname": "Takehito",
            "mail": "takehito.0213@gmail.com",
            "login": "tenten0213",
            "id": 3
          },
          "priority": {
            "name": "Normal",
            "id": 2
          },
          "tracker": {
            "name": "Feature",
            "id": 2
          },
          "parent_id": null,
          "root_id": 20,
          "closed_on": null,
          "updated_on": "2014-10-01T10:34:03Z",
          "created_on": "2014-10-01T10:34:03Z",
          "description": "test",
          "subject": "Some Feature",
          "id": 20,
          "done_ratio": 0,
          "start_date": "2014-10-01",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 0,
          "project": {
            "homepage": "",
            "created_on": "2014-09-29T01:19:34Z",
            "description": "",
            "name": "Test",
            "identifier": "test",
            "id": 1
          },
          "status": {
            "name": "New",
            "id": 1
          }
        },
        "action": "opened"
      }
    }
  },
  {
    "name": "update issue",
    "expected_out": "[Test] tenten0213 updated Bug#19\nSubject: Something is wrong\nStatus: InProgress\nPriority: Normal\nAssignee: tenten0213\nURL: http://example.com/issues/19",
    "body" : {
      "payload": {
        "url": "http://example.com/issues/19",
        "journal": {
          "details": "",
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example"
            "identity_url": null,
            "lastname": "Amanuma",
            "firstname": "Takehito",
            "mail": "takehito.0213@gmail.com",
            "login": "tenten0213",
            "id": 3
          },
          "private_notes": false,
          "created_on": null,
          "notes": "",
          "id": null
        },
        "issue": {
          "assignee": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "Amanuma",
            "firstname": "Takehito",
            "mail": "takehito.0213@gmail.com",
            "login": "tenten0213",
            "id": 3
          },
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "Amanuma",
            "firstname": "Takehito",
            "mail": "takehito.0213@gmail.com",
            "login": "tenten0213",
            "id": 3
          },
          "priority": {
            "name": "Normal",
            "id": 2
          },
          "tracker": {
            "name": "Bug",
            "id": 1
          },
          "parent_id": null,
          "root_id": 19,
          "closed_on": null,
          "updated_on": "2014-10-01T10:28:28Z",
          "created_on": "2014-10-01T09:44:12Z",
          "description": "",
          "subject": "Something is wrong",
          "id": 19,
          "done_ratio": 0,
          "start_date": "2014-10-01",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 14,
          "project": {
            "homepage": "",
            "created_on": "2014-09-29T01:19:34Z",
            "description": "",
            "name": "Test",
            "identifier": "test",
            "id": 1
          },
          "status": {
            "name": "InProgress",
            "id": 2
          }
        },
        "action": "updated"
      }
    }
  }
]

url = "/hubot/redmine-notify?room=tenten"

for test in test_data then do (test) ->
  describe test.name, ()->
    before (done) ->
      robot.adapter.send = sinon.spy()
      endfunc = (err, res) ->
        throw err if err
        do done
      request(robot.router)
        .post(url)
        .send(JSON.stringify(test.body))
        .expect(200)
        .end(endfunc)
    it 'Robot sent out respond', ()->
      robot.adapter.send.called.should.be.true
    it 'Robot sent to right room', ()->
      send_arg = robot.adapter.send.getCall(0).args[0]
      send_arg.room.should.eql 'tenten'
    it 'Robot sent right message', ()->
      robot.adapter.send.getCall(0).args[1].should.eql test.expected_out

