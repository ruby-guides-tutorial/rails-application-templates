# learn-puma-100


[Deploying Rails Applications with the Puma Web Server | Heroku Dev Center](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server)


* `Procfile `、<https://github.com/ddollar/foreman>

## Config

```bash
# equestia-api.service、equestia-api.socket
/home/equestia/.config/systemd/user

/bin/systemctl --user daemon-reload
/bin/systemctl --user enable equestia-api
/bin/systemctl --user enable equestia-api.socket
```

```
bundle exec puma --help
```

```bash
# config/puma.rb
bundle exec puma -C config/puma.rb
```

```
bundle exec puma -b unix:///var/www/equestia-api/shared/tmp/sockets/puma.sock
```


## Ref


* <https://github.com/puma/puma>
* <https://puma.io/>、**<https://puma.io/puma/>**
* <https://github.com/puma/puma/blob/master/docs/systemd.md>
* <https://github.com/seuros/capistrano-puma/tree/v6.0.0.beta.1>

