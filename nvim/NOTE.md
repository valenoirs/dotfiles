| Keymap | Description |
| :--- | :--- |
| **1. Navigation & Motion** | |
| `gg` | Jump to the first line of the file. |
| `G` | Jump to the last line of the file. |
| `g_` | Jump to the last non-blank character of the current line. |
| `ge` / `gE` | Jump backward to the end of the previous word (or WORD). |
| `gj` / `gk` | Move the cursor down/up by "screen lines" (useful for wrapped text). |
| `gd` | Go to the local declaration of the variable under the cursor. |
| `gD` | Go to the global declaration. |
| **2. Text Manipulation** | |
| `gu{motion}` | Change text to lowercase (e.g., `guw` for one word). |
| `gU{motion}` | Change text to uppercase. |
| `g~{motion}` | Swap case (lowercase to uppercase and vice versa). |
| `ga` | Show the ASCII/Unicode value of the character under the cursor. |
| `gJ` | Join lines without inserting a space. |
| `gr{char}` | Virtual replace (replaces characters without shifting text). |
| **3. Visual Mode & Selection** | |
| `gv` | Re-select the last visual selection. |
| `g CTRL-G` | Display word, line, and byte count for the current selection. |
| `gh` / `gH` | Enter "Select mode" (replace text immediately upon typing). |
| **4. Miscellaneous Commands** | |
| `gf` | Open the file whose name is under the cursor. |
| `gi` | Return to the last insertion point and enter Insert mode. |
| `g;` / `g,` | Move backward/forward through the change list. |
| `g?` | Apply Rot13 encoding to the text motion. |
| **5. The Global Command** | |
| `:g/pattern/command` | Execute a command on every line matching the pattern. |
| `:g/pattern/d` | Delete all lines that match a specific pattern. |
| `:v/pattern/command` | Execute a command on every line that does **not** match. |

<br/>
---
<br/>

| Keymap | Function | Description |
|---|---|---|
| `gg` | Go to line 1 | Moves the cursor to the first line of the file. A count prefix (e.g., 10gg ) goes to that specific line number. |
| `G` | Go to the last line | Moves the cursor to the last line of the document. A count prefix also goes to that specific line number (e.g., 5G ). |
| `ga` | Show character encoding | Displays the ASCII value of the character under the cursor and its encoding. |
| `gv` | Reselect last selection | Re-selects the last visually selected block of text. |
| `gr` | Virtual replace | Used to virtually replace characters. For example, gr {char} replaces N characters with {char} without changing the file's content (useful for some multi-byte characters). |
| `gH` | Start Select line mode | Begins Select line mode (similar to Visual line mode). |
| `g_` | Go to last non-blank | Moves the cursor to the last non-blank character of the current line. |
| `:g` | Global command | An Ex command (used with : ) that executes a given command on all lines that match a specified pattern. 

<br/>
---
<br/>

| VSCode Keymap | Vim Keymap | Description |
|---|---|---|
| `F12`| | |
| `Ctrl+F12` | | |
| `Alt+F12` | | |
| `Shift+F12` | | |

