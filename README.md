# mousestrip (KWin script)
Kwin script that displays a read strip around the mouse.
The main purpose is to help focusing on the zone of the screen where the pointer is located. This is an aid for improving attemption-related or color perception issues when working with a computer.

## Install

Clone the repo and install the content of src/ with kpackagetool

```
cd $HOME
mkdir git_mousestrip
cd git_mousestrip
kpackagetool5 --install src/
````

## Configure

Configuration options are available at systemsettings->window management->kwin scripts.

Available options:

* Strip height: Amount of lines for the strip, from 1 to 5. Each line is 48px.
* Strip color: Color for the strip. **Light colors could have a big decrease in readability**
* Strip opacity: Adjustable from 0 (transparent) to 50. **High values could decrease readability**
* Border height: Height of the border around the strip
* Border color: ...
* Border opacity: Adjustable from 0 (transparent) to 100 (opaque)
* Fill screen: If this option is enabled then the border will fill all the screen around the strip.
