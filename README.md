# Code Sync Script
This script facilitates the synchronization of code folders between a local (home) computer and a remote (work) computer using rsync over SSH. It supports two primary operations: pushing changes from the local computer to the remote computer and pulling changes from the remote computer to the local computer.

## Features
Push Operation: Synchronizes files from the local computer to the remote work computer, ensuring that the work computer's code folder mirrors the local one.
Pull Operation: Synchronizes files from the remote work computer to the local computer, updating the local code folder to match the work one.
Safety Checks: Verifies the presence of rsync before attempting to sync, reducing the risk of errors.
User Interaction: Prompts the user for the desired operation if not specified as a command-line argument.
Prerequisites
## Before using this script, ensure that:

rsync is installed on both the local and remote computers.
SSH access is configured between the local and remote computers. Using SSH keys for authentication is recommended for security and convenience.
## Installation
Clone the repository or download the script directly to your local computer.
Modify the script's constants (LOCAL_CODE_FOLDER and WORK_CODE_FOLDER) to match your local and remote code folder paths, respectively.
Ensure the script is executable:
```bash
chmod +x code_sync_script.sh
```
## Usage
To use the script, navigate to the directory containing the script and execute it with the desired operation as an argument:

```bash
./code_sync_script.sh -push
```
or

```bash
./code_sync_script.sh -pull
```
If no argument is provided, the script will prompt you to input the desired operation (push or pull):

```bash
No action specified. Do you want to push or pull?
```
## Arguments
-push : Syncs the local code folder to the remote work computer.
-pull : Syncs the remote work code folder to the local computer.
-h or --help : Displays usage information.
## Configuration
To configure the script for your specific needs, edit the following variables within the script:

LOCAL_CODE_FOLDER: Path to the local code folder on your home computer.
WORK_CODE_FOLDER: SSH path and folder location on your work computer, in the format username@work_computer_ip:/path/to/your/work/code/folder.
Dependencies
rsync: Must be installed on both the local and remote computers.
SSH: SSH access must be configured between your local and remote computers.
## Contributing
Contributions to the script are welcome! Please feel free to submit pull requests or open issues for bugs, feature requests, or improvements.

## License
This project is open-sourced under the MIT License. See the LICENSE file for more details.

## Acknowledgements
This script is created to simplify the synchronization process for developers working across multiple machines. Feedback and contributions are greatly appreciated to make it more versatile and user-friendly.
