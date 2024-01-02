
The main components of the Metasploit Framework can be summarized as follows;
- msfconsole
- Modules
- Tools

msfconsole
- help
- use
- show options
- set PARAMETER_NAME VALUE
- unset
- setg
- unsetg
- run / exploit
- back  

Metasploit Database Setup
- systemctl enable postgresql
- systemctl start postgresql
- msfdb init
- msfconsole
- db_status

Metasploit Workspace
- workspace                  List workspaces
- workspace -v               List workspaces verbosely
- workspace [name]           Switch workspace
- workspace -a [name] ...    Add workspace(s)
- workspace -d [name] ...    Delete workspace(s)
- workspace -D               Delete all workspaces
- workspace -r               Rename workspace
- workspace -h               Show this help information
- db_namp
- hosts
- services

Msfvenom to generate payloads
- msfvenom -l payloads
- msfvenom -l formats

Meterpreter
- help

Sessions
- ctl + z
- sessions -i 1