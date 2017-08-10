# erb-maker

A simple Sinatra webapp that lets you generate HTML using ERB.

Uses [Ace](https://ace.c9.io) for the code editor.  Visit `/file-name` on the server to allow you to save as `file-name` in your local storage.

Editing is done in the left side pane, and the result is in the right side pane.  You have to "build" in order to update the right side pane; see **Keyboard Shortcuts** for more on that.

## Keyboard Shortcuts

**CMD/CTRL + S** - save to local storage
**CMD/CTRL + R** - load from local storage
**CMD/CTRL + Shift + B** and **CMD/CTRL + ENTER** - build with ERB and put result in the right side pane.