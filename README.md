
# Automated Backup Script

## Overview
This script is designed for regular, automated backups of important data. It can be configured to perform either full or incremental backups, ensuring secure storage and easy retrieval of backup data.

## Features
- **Scheduled Backups**: Can be scheduled to run at regular intervals using cron jobs or similar schedulers.
- **Full or Incremental Backups**: Option to perform either full backups or incremental backups, where only changes since the last backup are saved.
- **Secure Storage**: Backups are stored in a specified directory, which can be a mounted remote storage for added security.

## Requirements
- A Linux-based system.
- `tar` command for creating backup archives.

## Configuration
Before running the script, configure the following variables in the script:
- `backup_source`: Directory that contains the data to be backed up.
- `backup_destination`: Directory where backup files will be stored.
- `incremental_backup`: Set to `true` for incremental backups, `false` for full backups.

## Usage
1. Edit the script to set the `backup_source` and `backup_destination` variables.
2. Make the script executable:
   ```
   chmod +x automated_backup_script.sh
   ```
3. Run the script:
   ```
   ./automated_backup_script.sh
   ```
4. For regular backups, schedule the script using cron or a similar scheduler.

## Customization
Feel free to modify the script to suit your specific needs, such as adding encryption for backups or sending notifications after backup completion.

## License
MIT. This script is provided "as is", without warranty of any kind. Use at your own risk.
