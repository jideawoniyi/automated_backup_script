
#!/bin/bash

# Automated Backup Script

# Configuration
backup_source="/path/to/source/directory"  # Directory to backup
backup_destination="/path/to/backup/directory"  # Backup storage directory
backup_name="backup_$(date +%Y%m%d_%H%M%S)"  # Backup name with timestamp
incremental_backup=false  # Set true for incremental backup

# Function to perform full backup
perform_full_backup() {
    echo "Performing full backup..."
    tar -czvf "$backup_destination/$backup_name.tar.gz" "$backup_source"
    echo "Full backup completed: $backup_name.tar.gz"
}

# Function to perform incremental backup
perform_incremental_backup() {
    echo "Performing incremental backup..."
    # File to keep track of the last backup timestamp
    last_backup_file="$backup_destination/last_backup.txt"
    if [ ! -f $last_backup_file ]; then
        echo "No previous backup found, performing full backup."
        perform_full_backup
    else
        last_backup_date=$(cat $last_backup_file)
        tar -czvf "$backup_destination/$backup_name.tar.gz" --newer "$last_backup_date" "$backup_source"
        echo "Incremental backup completed: $backup_name.tar.gz"
    fi
    date +%Y%m%d_%H%M%S > $last_backup_file
}

# Main function
main() {
    if $incremental_backup; then
        perform_incremental_backup
    else
        perform_full_backup
    fi
}

# Execute main function
main
