#initializing
github_token=`grep 'github_token=' .env | sed 's/^.*=//'`
github_username=`grep 'github_username=' .env | sed 's/^.*=//'`
github_repository=`grep 'github_repository=' .env | sed 's/^.*=//'`

path_printercfg=`grep 'path_printercfg=' .env | sed 's/^.*=//'`
path_mainsailcfg=`grep 'path_mainsailcfg=' .env | sed 's/^.*=//'`
path_moonrakercfg=`grep 'path_moonrakercfg=' .env | sed 's/^.*=//'`
path_timelapsecfg=`grep 'path_timelapsecfg=' .env | sed 's/^.*=//'`

backup_path=`grep 'backup_path=' .env | sed 's/^.*=//'`

#check backup folder or create one
if [ ! -d "$backup_path" ]; then
  mkdir $backup_path
fi

#copy important files into backup folder
cp $path_printercfg $path_mainsailcfg $path_moonrakercfg $path_timelapsecfg $backup_path

#git
git add .
git commit -m "new backup from $(date +"%d-%m-%y")"
git push https://"$github_token"@github.com/"$github_username"/"$github_repository".git
