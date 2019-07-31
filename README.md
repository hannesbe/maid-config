# maid rules config

> My [maid](https://github.com/hannesbe/maid) rules config - h@nnes.be 

- Install Maid & clone config
  `sudo gem install maid`
  `git clone https://github.com/hannesbe/maid-config ~/.maid`

- Run a dryrun to see what would happen:
  `maid clean --dry-run`

- Run manually: 
  `maid clean --force && tail ~/.maid/maid.log`

- Create a cron to schedule it: 

  - Edit your crontab using: 
    ```
    crontab -e
    ```
    This examples adds a schedule twice a day (5AM and 5PM)
    ```
    0 5,17 * * * /usr/local/bin/maid clean --force --silent
    ```
    Save, exit & verify the newly added schedule: 
    ```
    crontab -l
    ``` 

---

For more help on Maid:

-   Run `maid help`
-   Read the [README, tutorial, and documentation] (https://github.com/hannesbe/maid-config)
-   Check out how others are using Maid in [the Maid wiki](https://github.com/hannesbe/maid-config/wiki)
