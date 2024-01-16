
Recon-ng is a framework that helps automate the OSINT work. 
- It uses modules from various authors and provides a multitude of functionality. 
- Some modules require keys to work; the key allows the module to query the related online API. 


# Using recon-ng
- Basic
    - help
    - dashboard
- Workspace
    - workspaces create <WORKSPACE_NAME>
    - workspaces <list/load/..>
- Database
    - db schema
    - db insert <domains>
- Marketplace
    - marketplace search <domains->
    - marketplace info <recon/domains-hosts/google_site_web>
    - marketplace install <recon/domains-hosts/google_site_web>
- Module
    - modules search
    - modules load <recon/domains-hosts/google_site_web>
    - info
    - options list
    - options set <SOURCE> <tesla.com>
    - run
- Keys
    - keys add <KEY_NAME> <KEY_VALUE>
    - keys remove <KEY_NAME>
