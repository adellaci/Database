#!/bin/sh

####################################################################################################
#
#   Simple helper script to insert clean UDB
#
####################################################################################################
#
# Comments to the lines added and the end of the lines
#
# Where the is "# Commented out" I believe where to show a progress bar, but the statement is not
# a valid Linux statement as far as i can tell. I looks like it maybe valid in BSD
#
####################################################################################################



#internal use
SCRIPT_FILE="./InstallFullDB_Linux.sh"           #  changed to reference the corrected script
CONFIG_FILE="./InstallFullDB.config"             #  changed to reference the .config file
# testing only
ADDITIONAL_PATH=""

#variables assigned and read from $CONFIG_FILE
MANGOS_DBHOST=""
MANGOS_DBNAME=""
MANGOS_DBUSER=""
MANGOS_DBPASS=""
MYSQL=""
CORE_PATH=""

create_config() {			         #  function creat_config() {
# Re(create) config file
cat >  $CONFIG_FILE << EOF
####################################################################################################
# This is the config file for the '$SCRIPT_FILE' script
#
# You need to insert
#   MANGOS_DBHOST:	Your MANGOS database host
#   MANGOS_DBNAME:	Your MANGOS database schema
#   MANGOS_DBUSER:	Your MANGOS username
#   MANGOS_DBPASS:	Your MANGOS password
#   CORE_PATH:    	Your path to core's directory (OPTIONAL: Use if you want to apply remaining core updates automatically)
#   ACID_PATH:    	Your path to a git-clone of ACID (OPTIONAL: Use it if you want to install recent downloaded acid)
#   MYSQL:        	Your mysql command (usually mysql)
#
####################################################################################################

## Define the host on which the mangos database resides (typically localhost)
MANGOS_DBHOST="localhost"

## Define the database in which you want to add clean UDB
MANGOS_DBNAME="mangos"

## Define your username
MANGOS_DBUSER="mangos"

## Define your password (It is suggested to restrict read access to this file!)
MANGOS_DBPASS="mangos"

## Define the path to your core's folder (This is optional)
##   If set the core updates located under sql/updates/mangos from this mangos-directory will be added automatically
CORE_PATH=""

## Define the path to the folder into which you cloned ACID (This is optional)
##   If set the file acid_wotlk.sql will be applied from this folder
ACID_PATH=""

## Define your mysql programm if this differs
MYSQL="mysql"

# Enjoy using the tool
EOF
}

display_help() {                                 #  function display_help() {
echo
echo "Welcome to the UDB helper $SCRIPT_FILE"
echo
echo "Run this tool from a bash compatible terminal (on windows like Git Bash)"
echo
echo "To configure edit the file $CONFIG_FILE"
echo
}

# Check if config file present
if [ ! -f $CONFIG_FILE ]
then
  create_config
  display_help
 exit 1
fi

. $CONFIG_FILE

MYSQL_MANGOSDB_CMD="$MYSQL -h$MANGOS_DBHOST -u$MANGOS_DBUSER -p$MANGOS_DBPASS $MANGOS_DBNAME"

## Print header
echo
echo "Welcome to the UDB helper $SCRIPT_FILE"
echo
echo "ATTENTION: Your database $MANGOS_DBNAME will be reset to UDB!"
echo "Please bring your repositories up-to-date!"
echo "Press CTRL+C to exit"
# show a mini progress bar                       # Commented out
#for i in {1..19}                                # Commented out
#do                                              # Commented out
# echo -ne .                                     # Commented out
# sleep 1                                        # Commented out
#done                                            # Commented out
#echo .                                          # Commented out

## Full
echo "Process Full_DB ${ADDITIONAL_PATH}Current_Release/Full_DB/UDB_0.12.2_mangos_11792_SD2_2279.sql"      # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Full_DB/UDB_0.12.2_mangos_11792_SD2_2279.sql
echo "Test1"
# [[ $? != 0 ]] && exit 1                                                                                  # Commented out
echo $?

# 403
echo "Process Corepatch ${ADDITIONAL_PATH}Current_Release/Updates/403_corepatch_mangos_11793_to_11840.sql" # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/403_corepatch_mangos_11793_to_11840.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out
echo "Process Updatepapack ${ADDITIONAL_PATH}Current_Release/Updates/403_updatepack_mangos.sql"            # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/403_updatepack_mangos.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out

## 404
echo "Process Corepatch ${ADDITIONAL_PATH}Current_Release/Updates/404_corepatch_mangos_11841_to_11928.sql" # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/404_corepatch_mangos_11841_to_11928.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out
echo "Process Updatepapack ${ADDITIONAL_PATH}Current_Release/Updates/404_updatepack_mangos.sql"            # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/404_updatepack_mangos.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out 

## 405
echo "Process Corepatch ${ADDITIONAL_PATH}Current_Release/Updates/405_corepatch_mangos_11929_to_12111.sql" # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/405_corepatch_mangos_11929_to_12111.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out
echo "Process Updatepapack ${ADDITIONAL_PATH}Current_Release/Updates/405_updatepack_mangos.sql"            # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/405_updatepack_mangos.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out

## 406
echo "Process Corepatch ${ADDITIONAL_PATH}Current_Release/Updates/406_corepatch_mangos_12112_to_12444.sql" # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/406_corepatch_mangos_12112_to_12444.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out
echo "Process Updatepapack ${ADDITIONAL_PATH}Current_Release/Updates/406_updatepack_mangos.sql"            # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/406_updatepack_mangos.sql
#[[ $? != 0 ]] && exit 1                                                                                   #Commented out

## 407
echo "Process Corepatch ${ADDITIONAL_PATH}Current_Release/Updates/407_corepatch_mangos_12445_to_12670.sql" # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/407_corepatch_mangos_12445_to_12670.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out
echo "Process Updatepack ${ADDITIONAL_PATH}Current_Release/Updates/407_updatepack_mangos.sql"              # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/407_updatepack_mangos.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Comment out

## 408
echo "Process Updatepack ${ADDITIONAL_PATH}Current_Release/Updates/408_updatepack_mangos.sql"              # Show exact location and file being processed
$MYSQL_MANGOSDB_CMD < ${ADDITIONAL_PATH}Current_Release/Updates/408_updatepack_mangos.sql
#[[ $? != 0 ]] && exit 1                                                                                   # Commented out


## Change these settings with new updatepacks
LAST_CORE_REV="12938"

# Process files in Updates folder
echo
echo "Applying additional updates from Updates folder"
echo
for f in Updates/*.sql
do
  CUR_REV=`basename "$f" | sed 's/^\([0-9]*\)_.*/\1/' `
  echo "Applying Update $CUR_REV"
  $MYSQL_MANGOSDB_CMD < "$f"
#  [[ $? != 0 ]] && exit 1                                                                                 # Commented out
done

#
# Process core updates if desired
#
if [ "$CORE_PATH" != "" ]
then
  if [ ! -e "$CORE_PATH" ]
  then
    echo "Path to core provided, but directory not found! $CORE_PATH"
    exit 1
  fi

  # Convert path to unix style
  CORE_PATH=`(cd "$CORE_PATH"; pwd)`
#
#               Core updates
#
  echo
  echo
  echo "Applying additional core updates from path $CORE_PATH"
  echo
# process future release folders
  for NEXT_MILESTONE in ${NEXT_MILESTONES};
  do
    # A new milestone was released, apply additional updates
    if [ -e "${CORE_PATH}"/sql/updates/archive/${NEXT_MILESTONE}/ ]
    then
      echo "Apply core updates from milestone $NEXT_MILESTONE"
      for f in "${CORE_PATH}"/sql/updates/archive/${NEXT_MILESTONE}/*_*_mangos_*.sql
      do
        CUR_REV=`basename "$f" | sed 's/^\([0-9]*\)_.*/\1/' `
        if [ "$CUR_REV" -gt "$LAST_CORE_REV" ]
        then
          # found a newer core update file
          echo "Append core update `basename "$f"` to database $MANGOS_DBNAME"
          $MYSQL_MANGOSDB_CMD < "$f"
#          [[ $? != 0 ]] && exit 1                                                                        # Commented out
        fi
      done
    fi
  done

  # Apply remaining files from main folder
  for f in "${CORE_PATH}"/sql/updates/mangos/*_*_mangos_*.sql
  do
    CUR_REV=`basename "$f" | sed 's/^\([0-9]*\)_.*/\1/' `
    if [ "$CUR_REV" -gt "$LAST_CORE_REV" ]
    then
      # found a newer core update file
      echo "Append core update `basename "$f"` to database $MANGOS_DBNAME"
      $MYSQL_MANGOSDB_CMD < "$f"
#      [[ $? != 0 ]] && exit 1                                                                             # Commented out
    fi
  done
  echo "All core updates applied"

#
#               ScriptDev2 updates
#

  # Apply ScriptDev2.sql
  echo
  echo "Applying $ScriptDev2/scriptdev2.sql ..."
  echo
  $MYSQL_MANGOSDB_CMD < "${CORE_PATH}"/sql/scriptdev2/scriptdev2.sql
#  [[ $? != 0 ]] && exit 1                                                                                 # Commented out
  echo "Recent state of ScriptDev2 applied"
fi

#
#               ACID Full file
#

if [ "$ACID_PATH" != "" ]
then
  if [ ! -e "$ACID_PATH" ]
  then
    echo "Path to acid provided, but directory not found! $ACID_PATH"
    exit 1
  fi

  # Convert path to unix style
  ACID_PATH=`(cd "$ACID_PATH"; pwd)`

  # Apply acid_wotlk.sql
  echo
  echo "Applying $ACID_PATH/acid_wotlk.sql ..."
  echo
  $MYSQL_MANGOSDB_CMD < "${ACID_PATH}"/acid_wotlk.sql
#  [[ $? != 0 ]] && exit 1                                                                                 # Commented out
  echo "Recent state of ACID applied"
fi

echo
echo "You have now a clean and recent UDB database loaded into $MANGOS_DBNAME"
echo "Enjoy using UDB"
echo

