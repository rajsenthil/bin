# GO-LANG learning.
This is the course offered in golang by the name GO-Lang complete tutorial.


## Emacs
Key binding
- General
  C-u (universal argument)
  C-h k (describe-key)
  C-h f (describe-function)

- Frames
  C-x 3 (split-window-right)
  C-x 2 (split-window-below)
  C-x o (other-window)
  C-x 1 (delete-other-window)
  C-x 0 (delete-window)

- Buffers
  C-x C-b (list-buffers)
  C-x b (switch to buffer)
  C-x k (kill-buffer)
  C-x <RIGHT> (next-buffer)
  C-x <LEFT> (previous-buffer)
  
- Working with files.

  - PART 1
    C-x C-f (find-file) # Opens a new buffer with content from file. Or an empty buffer with given name.
    	    		# /sudo::/path/to/file
			# /ssh:user@host:/path/to/file
			# /ssh:user@host|sudo:host:/path/to/file
    C-x C-v (find-alternate-file) # Replace the current buffer with a new file			
    C-x C-r (find-alternate-file) # Replace the current buffer with a new file.
    C-x i (insert-file) # Insert content of file at point.
    C-x C-s (save-buffer) # Ask for file name if non existant, or save existing file.
    C-x C-w (write-file) # Like save-as, ask for file name even if buffer sources an existing files.
    C-x C-q (toggle-read-only)

  - PART 2    
    C-<HOME> (beg-of-buf) # Go to beginning of buffer.
    C-<END> (end-of-buf) # Go to end of buffer.
    C-a (move-beginning-of-line)
    C-e (move-end-of-line)
    C-s (isearch-forward) # With a prefix argument, do a regular expression (C-u C-s)
    C-r (isearch-backward) # With a prefix argument, do a regular expression (C-u C-s)
    C-x ( (kmacro-start-macro)
    C-x ) (kmacro-end-macro)
    C-x e (kmacro-end-and-call-macro)
    C-<SPACE> C-<SPACE> Save cursor position
    C-u C-<SPACE> Got back to save position
    
  - PART 3
    C-<SPACE> (set-mark-command)
    C-w (kill-region) # Cut
    M-w (kill-ring-save) # Copy
    C-k (delete-line)
    C-<BACKSPACE> (backward-kill-word)
    M-<BACKSPACE> (backward-kill-word)
    C-<DELETE> (delete-forward)
    C-y (yank) # Paste
    M-y (yank-pop) # Replace with previous entry in kill ring
    M-- M-y # Go forward after going backward
    C-x u | C-<SHIFT> _ (undo) # Undo
    	    	  	 # Emacs does not have a concept of redo
			 # To simulate redo after some undo, send a non editing command like C-f.
			 # then proceed with undo, you will undo what you undid.
			 # Emacs undo/redo concept can get a little confusing and few more tries to remember.
			 
- DIRED mode
  - <RET> Open files or directory in a new buffer
  - (a) After activation, open files or directory in current buffer
  - (d) Flagged for deletion
  - (u) Remove deletion flag.
  - (x) Delete flagged entries
  - (C) Copy
  - (R) Rename
  - (+) Create directory
  - (!) Execute command on file at 

