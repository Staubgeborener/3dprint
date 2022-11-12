parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

#initializing
github_token=`grep 'github_token=' $parent_path/.env | sed 's/^.*=//'`
github_username=`grep 'github_username=' $parent_path/.env | sed 's/^.*=//'`
github_repository=`grep 'github_repository=' $parent_path/.env | sed 's/^.*=//'`

path_printercfg=`grep 'path_printercfg=' $parent_path/.env | sed 's/^.*=//'`
path_mainsailcfg=`grep 'path_mainsailcfg=' $parent_path/.env | sed 's/^.*=//'`
path_moonrakercfg=`grep 'path_moonrakercfg=' $parent_path/.env | sed 's/^.*=//'`
path_timelapsecfg=`grep 'path_timelapsecfg=' $parent_path/.env | sed 's/^.*=//'`
path_telegramcfg=`grep 'path_telegramcfg=' $parent_path/.env | sed 's/^.*=//'`
path_pacalcfg=`grep 'path_pacalcfg=' $parent_path/.env | sed 's/^.*=//'`
path_getprobelimitcalcfg=`grep 'path_getprobelimitcalcfg=' $parent_path/.env | sed 's/^.*=//'`
path_savedvariablescfg=`grep 'path_savedvariablescfg=' $parent_path/.env | sed 's/^.*=//'`


backup_folder=`grep 'backup_folder=' $parent_path/.env | sed 's/^.*=//'`

cd $parent_path

#check backup folder or create one
if [ ! -d "$parent_path/$backup_folder" ]; then
  mkdir $parent_path/$backup_folder
fi

#copy important files into backup folder
cp $path_printercfg $path_mainsailcfg $path_moonrakercfg $path_timelapsecfg $path_telegramcfg $path_pacalcfg $path_getprobelimitcalcfg $path_savedvariablescfg $parent_path/$backup_folder

#git
git init
git rm -rf --cached $parent_path/.env
git add $parent_path
git commit -m "new backup from $(date +"%d-%m-%y")"
git push https://"$github_token"@github.com/"$github_username"/"$github_repository".git
