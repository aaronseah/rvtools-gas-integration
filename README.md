# RVTools + Google Apps Script Automation
Automate updating of VM inventory to Google Sheets using Powershell and Google App Scripts
This is currently an amateur way of updating the VM inventory but it works, will improve on it during the following weeks.

Step 1:
Download RVTools here: https://www.robware.net/rvtools/

Step 2:
Install on your machine. The default location is at "C:\Program Files (x86)\Robware\RVTools" but you may set the path you want.

Step 3:
Navigate to "C:\Program Files (x86)\Robware\RVTools" and you should see a powershell script titled "RVToolsBatchMultipleVCs.ps1".
Create a copy and update the parameters for your vCenter. Use "RVToolsPasswordEncryption.exe" located in the same path to encrypt the password for the script.
You can also update the argument to export a certain tab or CSV. More details here: https://www.vgemba.net/vmware/RVTools-Export/

I've edited the script to save to a local drive instead of sending it to my email. You may use it as a reference.

Step 4:
Upload the CSV file to Google Drive (future update to automate this section - probably email and use a script to upload it to Drive)

Step 5:
Create a new Google Sheet (master sheet that will run the script to get updated data from CSV)
Click on Extensions > Apps Script
![image](https://user-images.githubusercontent.com/26889802/215939053-c3732a6b-2d2d-4122-ae94-6d12bb5e3e07.png)

Step 6:
Replace the Code.gs code with the one here. Read through the code and change the parameters according to your environment.
I've implemented a button to manually import the CSV. You may set a time trigger as well.

Future Implementation:
1. Automate the upload of CSV to Google Drive by using the Powershell export script to send it via SMTP to an IT email. Google Apps Script will then pick it up and upload it to a drive. 
2. Update Code.gs to look for the CSV file within a folder instead of the whole Drive.
3. Add support for exporting multiple CSVs into a single Google Sheets
4. Use the master Google Sheet as a database for other Sheets / Dashboards
5. Automate the update of Jira Asset Management from the master Google Sheet

Please feel free to add comments or improvements if any. Thanks!
