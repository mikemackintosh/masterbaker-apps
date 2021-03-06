name             "apps"
maintainer       "Mike Mackintosh"
maintainer_email "m@splug.io"
license          "Apache 2.0"
description      "Manage Apps for OSX"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.5"
supports         "apps"

depends "homebrew"
depends "mac_os_x"
depends "dmg"


# 0.2.5
# - Added Mou
#
# 0.2.4
# - Added kaleidoscope
#
## 0.2.3
# - Added knox
#
# <= 0.2.2
# - Bunch of stuff