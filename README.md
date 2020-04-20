# Selector

* Database dump is in db/ -> I would only take the data and fill it after running migrations
* Database configuration is in selector/config/packages/doctrine.yaml -> fill it
* run migrations 
```
php bin\console doc:mig:mig
```
* composer install
```
composer install
```