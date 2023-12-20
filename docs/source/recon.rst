Reconnaissance
=====

Process
------------
- Make Coffee
- vpn connection
- Prepare Tools    
- Create Room
- Play Music
- Set Timer

Tools
----------------
.. code-block:: console
    
    cp ~/Projects/bible/tools/tmux/.tmux.conf ~    
    sudo cp ~/Projects/bible/tools/nmap/setip /usr/local/bin
    sudo cp ~/Projects/bible/tools/nmap/portip /usr/local/bin
    sudo cp ~/Projects/bible/tools/nmap/explore /usr/local/bin 
    code ~/Projects/bible

Operation Room
----------------
.. code-block:: console

    mkdir -p ~/Operations/<room>
    cd ~/Operations/<room>
    touch ~/Operations/<room>/clue.txt
    tmux; tmux Ctrl+B `
    cp -r ~/Projects/bible/tools/0box . 
