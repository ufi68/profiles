@echo off

REM Clone profiles Repository to your local computer into your git
REM pushd c:\Users\%username%\git $T git clone https://github.com/ufi68/profiles.git

REM if you don't want to add this git path to your %PATH% variable 
REM add a doskeys.cmd or aliases.cmd to a path directory f.e. bin
REM @ECHO OFF
REM c:\Users\%username%\git\profiles\cmd\doskeys.cmd %1

REM Add this to Autorun
REM reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d  "Doskeys"="\"C:\\Users\\%username%\\git\\profiles\\cmd\\doskeys.cmd\""
REM reg query "HKCU\Software\Microsoft\Command Processor" /v Autorun

REM Set Prompt Green 
REM https://ss64.com/nt/syntax-ansi.html
prompt $E[32;1m$P$G$E[37m

REM Set Title 
REM https://www.pcwelt.de/ratgeber/Prompt-zum-individuellen-Prompt-1209216.html
title Doskey CMD Session %Username% - %date%

REM Show where it runs from
echo Load settings from %~f0 

if "%1"=="on" ECHO ON 
if "%~1"=="" ECHO OFF 

REM =============================================
REM Proxy Settings in different Environments
REM =============================================
REM set http_proxy=http://
REM set https_proxy=http://
REM set no_proxy=

REM =============================================
REM Edit the aliases cmd 
REM =============================================
doskey a=doskey /macros
doskey alias=doskey /macros
doskey aliases=doskey /macros 
doskey e=notepad $1
doskey h=doskey /historyapull

doskey as=c:\Users\%username%\git\profiles\cmd\doskeys.cmd

REM https://stackoverflow.com/questions/39771663/evaluate-environment-variable-at-runtime-with-doskey
setlocal enableextensions disabledelayedexpansion
doskey uhr=echo %%date%%%%time:~0,8%%

doskey ae=notepad c:\Users\%username%\git\profiles\cmd\doskeys.cmd
doskey acd=cd c:\Users\%username%\git\profiles\cmd

REM Update your cmd with lates version from github
doskey apull=pushd c:\Users\%username%\git\profiles $T git pull $T popd

REM Save latest Changes - usage aup "commit message"
doskey aup=pushd c:\Users\%username%\git\profiles\cmd $T git commit -a -m $* $T git pull $T git push $T popd

doskey c=start cmd 
doskey clear=cls
doskey e=explorer
doskey hash=certutil -hashfile $1 MD5
doskey ip=ipconfig $*
doskey ls=dir 
doskey n=notepad $*

REM Creates a file name starting with actual date YYYYMMTT
REM https://stackoverflow.com/questions/203090/how-do-i-get-current-date-time-on-the-windows-command-line-in-a-suitable-format
doskey nlog=for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j $T set ld=%%ldt:~0,4%%%%ldt:~4,2%%%%ldt:~6,2%% $T notepad %%ld%%_$1

doskey vi=notepad $1
doskey wordpad="C:\Program Files\Windows NT\Accessories\wordpad.exe $*"
doskey wp="C:\Program Files\Windows NT\Accessories\wordpad.exe $*"
doskey pwd=cd
doskey v=type $1

REM Doskey  
doskey dk=doskey $*
doskey dkm=doskey /macros
doskey dkh=doskey /history

REM =============================================
REM Chocolaty
REM =============================================
REM choco https://chocolatey.org/
REM Install from Admin Powershell console 

REM Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

doskey renv=refreshenv

REM choco install -y git
REM choco install -y hub
REM choco install -y golang
REM choco install -y vscode 
REM choco install -y jq
REM choco install -y Firefox
REM choco install -y chromium
REM choco install -y dbeaver
REM choco install -y wget
REM choco install -y curl
REM choco install -y Postman
REM choco install -y sql-server-management-studio
REM choco install -y gh
REM choco install -y http

REM choco install -y nodejs
REM npm config set proxy http://10.123.0.132:3128
REM npm config set https-proxy http://10.123.0.132:3128
REM npm install -g newman (after new start of CMD console) 

REM asciidoctor via choco
REM chock install -y ruby 
REM gem install asciidoctor 
REM gem install asciidoctor-pdf

doskey chocol=choco list --local-only
doskey chocos=choco search $1

REM With Administrator Rights only 
doskey chocou=choco upgrade all


REM =============================================
REM git - Git CLI
REM https://git-scm.com/book/de/v2
REM https://swcarpentry.github.io/git-novice/reference.html
REM git --version
REM git config --global user.name "<user-id>"
REM git config --global user.email <email>
REM git config --list
REM =============================================
REM pushd / popd
doskey gitadd=git add -A
doskey gita=git add -A
doskey gitblame=git blame $1
doskey gitbranchv=git branch -v
doskey gitcommit=git commit -a -m $*
doskey gitc=git commit -a -m $*
doskey gitcheckout=git checkout $1 &:: Branch Name 
doskey gitdiff=git diff $1 &:: Commit ID f.e from git log
doskey gitfsck=git fsck
doskey gitpushd=pushd c:\Users\%username%\git\
doskey gitseti=pushd c:\Users\%username%\git\cbf.SETI
doskey gitf=git fetch
doskey gitp=git pull
doskey gitpush=git push
doskey gitl=git log --oneline --all --graph --decorate
doskey gitlog=git log --oneline --all --graph --decorate
doskey gitlogs=git log --oneline --all --graph --decorate
doskey gitlc=git log -1
doskey gitreflog=git reflog
doskey gitreset=git reset HEAD . &:: Reset Stage Bereich 
doskey gitrestore=git restore $1
doskey gits=git status
doskey gitstatus=git status


REM =============================================
REM gh - GitHub CLI
REM https://ct.de/yq7e c't 2021 Heft 18 S. 152-153
REM https://github.com/cli/cli
REM https://cli.github.com/manual/
REM https://github.com/cli/cli/releases
REM gh auth login / github.com / Y / https / Web-Browser
REM =============================================
doskey ghreprolist=gh repo list 
doskey ghissue=gh issue view $1
doskey ghprstatus=gh pr status
rem gh issue list --json id,author,state

REM =============================================
REM az - Azure CLI
REM =============================================
doskey azlogin=az login --use-device-code 
doskey azacclist=az account list --output table
rem az --version
rem az vm show --resource-group <rg> --name <vm>

rem Show Ressource Group 
doskey azgroupshow=az group show --name $1

REM =============================================
REM oc - OpenShift (OCP)
REM =============================================
REM https://access.redhat.com/documentation/en-us/openshift_container_platform/4.6/html-single/cli_tools/index#cli-developer-commands

REM =============================================
REM scp 
REM Using Zertificates for a Linux Box 
REM Linux: ssh-keygen -C "<user-id>@<hostname>"
REM Linux: .ssh: cp -p id_rsa.pub authorized_keys
REM scp -i "C:\Users\%userid>\<user-id>@<hostname>.id_rsa" <user-id>@<hostname>:/home/<user-id>
REM =============================================

REM =============================================
REM Windows (CMD) stuff
REM =============================================
REM Check if it run as administrator and set Background color to red
REM took very long so until now as REM only 
REM whoami /groups | find "S-1-16-12288"
REM if not errorlevel 1 (
REM    color 47 
REM    prompt $E[33;1m$P$Gwinsat disk -drive $E[0;37;41m
REM )

REM Loop 
REM FOR /L %i IN (1,1,999) DO <command>  && timeout /t 60

Rem https://www.thomas-krenn.com/de/wiki/Cmd-Befehle_unter_Windows
rem systeminfo
rem ver 
rem ftype - 
rem tasklist 
rem ipconfig 
rem netstat
rem hostname

REM Links
REM c't 18/2020 S.137 Windows-Eingabeaufforderung | Praxis 
REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/doskey

REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands
REM https://docs.microsoft.com/de-de/windows-server/administration/windows-commands/windows-commands

REM Hardware 
REM https://4sysops.com/archives/using-doskey-aliases/
doskey hardware=WMIC BIOS Get Manufacturer,Name,Version /Format:csv $T wmic csproduct get Version $T wmic csproduct get name 

REM Operation System
REM Show Windows Version CLI
REM ver 
REM Show Windows Version GUI
REM winver

:: Comment 
REM Comment after &:: New Comment
