# Deployer test VMs

This repository is simply a vagrant configuration for the 3 test VMs which are in the [DB seeds](https://github.com/REBELinBLUE/deployer/blob/master/database/seeds/ServerTableSeeder.php) for [Deployer](https://github.com/REBELinBLUE/deployer).

Nothing exciting, yes I know there is an SSH key in the files, that is fine, it is the matching public key to the [project in the database seeds](https://github.com/REBELinBLUE/deployer/blob/master/database/seeds/ProjectTableSeeder.php).

Start the VMs in the usual way

```bash
$ vagrant up
```

and then enter then using the name `web`, `cron` or `db`

```bash
$ vagrant ssh web
```