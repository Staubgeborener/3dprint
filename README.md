# 3dprint
### Backup of my 3d printing files

I use the script `backup_script.sh` to automatically upload my Klipper files as a backup. If someone wants to use this:

#### Configuration

```
mv .env.example .env
chmod +x backup_script.sh
```

Modify the `.env` file:
1. In GitHub click on the profile in the upper right corner
2. click "Settings"
3. click "Developer settings"
4. click "Personal access tokens"
5. Generate new token

Copy the new token into the `.env` file at `github_token`. Add your username in `github_username` and change the `github_repository` to your backup repository name in GitHub (in my case: 3dprint).

Adjust the remaining paths in the `.env` file where your files are located or add even more file. I am using the default paths. If you want to add more files please keep an eye to [line 29](https://github.com/Staubgeborener/3dprint/blob/main/backup_script.sh#L29) of the `backup_script.sh`.

Since i like to sort the files in appropriate folders i have adjusted the parameter `backup_folder` with `./klipper`. You could also use `backup_folder=.` for example.

#### Execute

Thats pretty much it. There are two ways to run the script:
1. Run the script when starting mainsailos respectively the 3d printer. Type `crontab -e` and add this line: `@reboot /home/pi/3dprint/backup_script.sh`
2. I created a klipper macro `[gcode_macro update_git]` to run the backup manually in the mainsailos gui (see `printer.cfg`)
