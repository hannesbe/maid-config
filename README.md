# Maid config rules

> My [maid](https://github.com/benjaminoakes/maid) config rules 

- Install Maid & clone config
  ```
  sudo gem install maid
  git clone https://github.com/hannesbe/maid-config ~/.maid
  ```

- Run a dry-run to see what would happen:
  ```
  maid clean --dry-run
  ```  

- Run manually: 
  ```
  maid clean --force && tail ~/.maid/maid.log
  ```  

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
-   Read [the Maid README](https://github.com/benjaminoakes/maid/blob/master/README.md), [tutorial](https://github.com/benjaminoakes/maid/blob/master/README.md#tutorial), and [documentation](http://www.rubydoc.info/github/benjaminoakes/maid/master/Maid/Tools)
-   Check out how others are using Maid in [the Maid wiki](https://github.com/benjaminoakes/maid/wiki)
