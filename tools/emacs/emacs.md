
To make Emacs look and feel like a full-fledged IDE, you'll need to configure it with features like:
- File navigation (Project management, tree view)
- Code completion (LSP, snippets, auto-completion)
- Syntax highlighting & themes
- Version control (Git integration)
- Debugging support
- Terminal inside Emacs

**Emacs as a Powerful C/C++ IDE - User Guide**

This guide provides an overview of how to efficiently use Emacs for working on large, multi-file C/C++ projects using the provided `init.el` configuration.

---

## **1. UI Enhancements & Navigation**
### **Opening and Managing Files**
- `C-x C-f` → Open a file
- `C-x b` → Switch between open buffers
- `C-x k` → Close the current buffer

### **Project Management with Projectile**
- `C-c p f` → Find a file in the project
- `C-c p p` → Switch between projects
- `M-x projectile-add-known-project` → Add a new project
- `M-x projectile-remove-known-project` → Remove a project

### **File Explorer with Treemacs**
- `C-x t t` → Toggle Treemacs file tree
- Click on files to open them

---

## **2. Code Editing & Auto-Completion**
### **Using LSP Mode for C/C++**
- Open a `.c` or `.cpp` file, and `lsp-mode` will start automatically.
- Code navigation:
  - `M-.` → Jump to definition
  - `M-,` → Jump back
  - `M-?` → Find references
  - `M-x lsp-execute-code-action` → Perform code actions (like quick fixes)
- Hover information:
  - `M-x lsp-ui-doc-show` → Show documentation for the symbol at point

### **Auto-Completion with Company Mode**
- Start typing, and suggestions will appear automatically.
- `TAB` → Select an autocomplete suggestion
- `M-/` → Manually trigger auto-completion

### **Snippets for Faster Coding**
- Use `for` + `TAB` to auto-expand loops.
- `while` + `TAB` for a while-loop template.
- `if` + `TAB` for an if-condition template.
- `M-x yas-new-snippet` → Define custom snippets

---

## **3. Debugging with DAP Mode**
- `M-x dap-debug` → Start debugging session
- Set breakpoints:
  - `M-x dap-breakpoint-toggle` → Toggle breakpoints
- Step through code:
  - `M-x dap-next` → Step over
  - `M-x dap-step-in` → Step into
  - `M-x dap-step-out` → Step out

---

## **4. Version Control with Git (Magit)**
- `C-x g` → Open Magit status buffer
- Stage/unstage changes → Navigate to a file and press `s` (stage) or `u` (unstage)
- Commit changes → Press `c` then `c`, enter commit message, then `C-c C-c`
- Push changes → Press `P P`

---

## **5. Built-in Terminal with Vterm**
- `C-x t v` → Open Vterm
- Inside Vterm, use shell commands just like in a regular terminal.
- Useful commands:
  - `gcc main.c -o main` → Compile a C program
  - `./main` → Run the compiled program
  - `gdb ./main` → Debug with GDB

---

## **6. Useful Utilities**
### **Which-Key for Keybinding Help**
- `M-x which-key-mode` → Enable which-key mode (displays possible keybindings)

### **Better Searching with Ivy**
- `C-s` → Incremental search
- `C-r` → Search backward
- `M-x counsel-rg` → Search entire project with ripgrep (if installed)

### **Saving Sessions**
- `M-x desktop-save` → Save current session
- `M-x desktop-read` → Restore session on next Emacs start


### **Use xclip (for X11-based systems like Xorg)**
- Run this in a terminal: sudo dnf install xclip  # Fedora
- Then, add this to your Emacs config (~/.emacs or ~/.emacs.d/init.el): (setq select-enable-clipboard t)
- This tells Emacs to use the system clipboard.

---

## **Final Notes**
With this configuration, Emacs becomes a powerful IDE for C/C++ development, providing features such as code completion, project management, debugging, Git integration, and an embedded terminal. Explore the keybindings and workflows to maximize your efficiency!

Happy coding! 🚀


1. Basic Window Commands

Emacs provides a set of built-in window management commands, which you can use with simple keybindings:

    Split windows:
        C-x 2: Split the window horizontally.
        C-x 3: Split the window vertically.
    Move between windows:
        C-x o: Move to the other window.
    Close windows:
        C-x 0: Close the current window.
        C-x 1: Delete all other windows and keep the current one.
    Balance windows:
        C-x +: Balance the size of all windows.