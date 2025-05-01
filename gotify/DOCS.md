# Home Assistant Add-on: Gotify

Gotify/server features a WebUI and functionality for:

- Sending messages via a REST-API
- Subscribing/receiving messages via a web socket connection
- Managing users, clients and applications

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Find the "Gotify" add-on and click it.
3. Click on the "INSTALL" button.
4. Check the logs of the "Gotify" add-on to see if everything went well.
5. Click the "OPEN WEB UI" button and login using: **admin** / **changeme**


## How to use


## Configuration

**Note**: _Please change the default password in the web ui!_

### Add-on configuration with internal SQLite3 database:

```yaml
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
database: sqlite3
registration: true
```

### Add-on configuration with external MySQL database:

```yaml
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
database: mysql
database_connection: gotify:secret@tcp(localhost:3306)/gotifydb?charset=utf8&parseTime=True&loc=Local
registration: true
```
Please see also here: https://gotify.net/docs/config#database

### Gotify plugins

You can also use gotify plugins. 
Just copy them to the addon configuration folder: 
E.g.
```
\\<HOMEASSISTANT_IP>\addon_configs\db21ed7f_gotify\plugins
```

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[gotify]: https://gotify.net/