#!/bin/sh

SHORTCUT = "[Desktop Entry]
Name = Sublime Text
Comment = Edit text files
Exec = /usr/local/sublime-text-3/sublime_text
Icon = /usr/local/sublime-text-3/Icon/128x128/sublime-text.png
Terminal = false
Type = Application
Encoding = UTF-8
Categories = Utility; TextEditor;"

SCRIPT = "#!/bin/sh
if[\"\${1}\" == \"--help\"]; then
	/usr/local/sublime-text-3/sublime-text --help
else
	/usr/local/sublime-text-3/sublime-text \$@ > /dev/null 2>&1 &
fi"

if [\"\${whoami}\" != 'root' ] then
	echo "Dear $USER"
	echo "You have no permission to run $0 as non-root user."
	exit 1;
else	

curl -L "http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3059_x64.tar.bz2" -o "/usr/src/Sublime_Text_3.tar.bz2"
cd /usr/src
tar -xvjf "Sublime_Text_3.tar.bz2"
cd "Sublime_Text_3"
mkdir -pv "/usr/local/sublime-text-3"
mv -fv * "/usr/local/sublime-text-3"
echo "${SCRIPT}" > "/usr/local/bin/subl"
chmod +x "/usr/local/bin/subl"
echo "${SHORTCUT}" > "/usr/share/applications/sublime-text-3.desktop"
cd "/usr/local/sublime-text-3/"
rm -rf "sublime_text_3_build_3059_x64.tar.bz2"

echo "Done!"

fi