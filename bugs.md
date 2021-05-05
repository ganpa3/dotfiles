#### Python Debugging Tips:

1. Pretty print all variables defined inside a function:
```python
exec('import inspect,pprint,sys\npp=pprint.PrettyPrinter(indent=4,width=100)\nd={k:v for k,v in locals().items() if not inspect.ismodule(v)}\npp.pprint(d)\nprint("\\nStack trace:")\nfor i in inspect.stack():\n    print(i.function, "\nin", i.filename, "at line no.", i.lineno)', globals())
```
```sh
find -name \*.py | xargs sed -i '1i import inspect, pprint, sys\npp = pprint.PrettyPrinter(indent=4, width=100, stream=sys.stderr)\ndef LOG(*args):\n    for arg in args:\n        pp.pprint(arg)'
```

#### Javascript Debugging Tips:

1. To print function call trace:
```javascript
console.trace();
```
2. Snippet to debug:

Pass arguments as an object in both cases. E.g. `log({a, b, c});`

##### For frontend

Run this to add this function to all JS files
```sh
find -name \*.js | xargs sed -i '1i function log(args) {\n    console.dir(args);\n}\n'
find -name \*.ts | xargs sed -i '1i function log(args: any) {\n    console.dir(args);\n}\n'
```
To add at end
```sh
find -name \*.js | xargs sed -i '$a function log(args) {\n    console.dir(args);\n}\n'
find -name \*.ts | xargs sed -i '$a function log(args: any) {\n    console.dir(args);\n}\n'
```
To delete
```sh
# from start of file
find -name \*.js | xargs sed -i '1,3d'
# from end of file
find -name \*.js | xargs sed -i -n -e :a -e '1,3!{P;N;D;};N;ba'
```
```javascript
function log(args) {
    console.dir(args);
}
```

##### For backend

Run this to add this function to all JS files
```sh
find -name \*.js | xargs sed -i '1i function log(args) {\n    console.log(JSON.stringify(args, null, 2));\n}\n'
```
To delete
```sh
find -name \*.js | xargs sed -i '1,3d'
```
```javascript
function log(args) {
    console.log(JSON.stringify(args, null, 2));
}
```

To find group of a file/directory: `stat -c "%U %G" /path/to/file`

first value is owner and second is group

To know whether you are using X11 or Wayland, use:

```sh
loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}'
```

Tips regarding building vlc:
If facing trouble with opencv and vlc, ignore. It's vlc's fault.

Ubuntu:
To build-deps, uncomment the deb-src line in the /etc/apt/sources.list file. Look for universe

Help : https://techpiezo.com/linux/install-vlc-media-player-in-ubuntu/

configure with:
`./configure --enable-avcodec --enable-avformat --enable-swscale --enable-mad --enable-a52 --enable-libmpeg2 --enable-dvdnav --enable-faad --enable-vorbis --enable-ogg --enable-theora --enable-freetype --enable-fribidi --enable-speex --enable-flac --enable-live555 --enable-caca --enable-skins2 --enable-alsa --enable-ncurses --enable-xcb --enable-pulse`

Extra packages to install for building vlc on Ubuntu:
`sudo apt-get install -y qtquickcontrols2-5-dev libxkbcommon-x11-dev qtdeclarative5-dev qml-module-qtquick-controls2 qml-module-qtquick-layouts  qml-module-qtquick2 qml-module-qtgraphicaleffects qml-module-qtqml-models2 liblivemedia-dev`

To list all the dependencies of an arch package, including optionals, using the hard way using python, run the following script:
```python
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait

browser = webdriver.Chrome(executable_path="/home/ganpa/source/Bodhitree-Scrapper/assets/chromedriver_linux")
link = "https://aur.archlinux.org/packages/google-chrome/" # Link of the package
browser.get(link)

try:
    show = WebDriverWait(browser, timeout=5).until(lambda b: b.find_element_by_css_selector("#pkgdepslistlink"))
    show.click()
except:
    pass

deps = browser.find_elements_by_css_selector("#pkgdepslist li a")

for i in deps:
    print(i.text, end = " ")
print("")
browser.quit()
```

To manage dotfiles, use these links:

* https://github.com/jesuswasrasta/dotfiles

* https://www.atlassian.com/git/tutorials/dotfiles

* https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles

For arch, install packages:
`sudo pacman -S xorg xorg-xinit xf86-video-intel`

To change battery colour in regolith, change file:
`/usr/share/i3xrocks/battery`

To change themes, icon themes, wallpapers, etc. in Regolith, change file `/etc/regolith/styles/lascaille/theme`.
E.g.
```C
#define gtk_theme           Adwaita-dark
#define icon_theme          Papirus-Dark
#define desktop_wallpaper   /home/ganpa/Pictures/Wallpapers/BG_1.jpg
#define rofi_theme          /etc/regolith/styles/lascaille/rofi.rasi
#define theme_terminal_scrollbar never

#define i3wm_window_border_size         2
#define i3wm_floatingwindow_border_size 1
#define i3wm_gaps_inner_size            5
#define i3wm_gaps_outer_size            0
#define i3wm_bar_position               bottom
```

Get Pull Requests associated with a commit(use full SHA1 of commit) using Github GraphQL API.
E.g.
```graphql
{
  repository(owner: "zulip", name: "zulip") {
    ref(qualifiedName: "master") {
      repository {
        object(oid: "5262ca76213a6585f4d6498f34467e87568cbf1b") {
          ... on Commit {
            associatedPullRequests(first: 100) {
              edges {
                node {
                  title
                  url
                }
              }
            }
          }
        }
      }
    }
  }
}
```
