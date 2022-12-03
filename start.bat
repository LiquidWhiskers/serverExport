::Reimports Configuration Data
rename CONFIG.bat DEFAULT.bat 
echo Ignore error if config file already exists
call DEFAULT.bat
rename DEFAULT.bat CONFIG.bat

::Checks for correct configuration
if %serverID%=="GUILD_ID" if %authToken%=="TOKEN" echo Incorrect Arguments (possibly default values were left) && cmd /k && exit 1

::Changes to bash current folder
cd %~dp0

::Creates exports folder
mkdir \guilds\
cd %~dp0\guilds\

::Creates folder for each guild it downloads
mkdir %serverID%
cd %serverID%

::Executes
%~dp0%bin%\DiscordChatExporter.Cli.exe  exportguild -g %serverID% -f %exportFormat% --media "False" -t %authToken%

::Hangs on exit
cmd /k