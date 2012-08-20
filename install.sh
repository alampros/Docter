# Install Pygments
echo; echo "Installing Pygments"
tput setaf 243
sudo easy_install pygments
sudo ln -s /usr/local/bin/pygmentize /usr/bin
tput sgr0

# Install redcarpet
gem=redcarpet
echo; echo "Installing $gem"
tput setaf 243
sudo gem install redcarpet
tput sgr0

# Install pygments.rb
gem=pygments.rb
echo; echo "Installing $gem"
tput setaf 243
sudo gem install pygments.rb
tput sgr0

# Setting the destination
destination=~/.Flavored
[ ! -d "$destination" ] && mkdir "$destination"
cd "$destination"

# Download github-flavored-marked.css
file=github-flavored-marked.css
echo; echo "Downloading $file"
tput setaf 243
curl -#OL https://raw.github.com/porada/Flavored/marked/$file
tput sgr0

# Download github-flavored-marked.rb
file=github-flavored-marked.rb
echo; echo "Downloading $file"
tput setaf 243
curl -#OL https://raw.github.com/porada/Flavored/marked/$file
tput sgr0

# Setting Marked’s custom processor
echo; echo "Setting $file as Marked’s custom processor"
tput setaf 243
processor=$PWD/$file
chmod a+x "$processor"
defaults write com.brettterpstra.marky customMarkdownProcessor -string "$processor"
defaults write com.brettterpstra.marky useCustomMarkdownProcessor -bool true
echo "$processor"
tput sgr0

# Finish
echo; echo "All done."