#!/bin/zsh
STARTINGDIR=$(pwd)
REPO_LOCATION=${REPO_LOCATION:-""}

setrepolocation() {
  # See if we are in the root of an existing clone...
  if [[ "$STARTINGDIR" =~ www-gitlab-com$ ]]; then
    REPO_LOCATION=$STARTINGDIR
  fi

  # If not, try to find it or ask for it
  if [ -z $REPO_LOCATION ]; then
    findexistingrepo
  fi
}

findexistingrepo() {
  # See if we can find an existing clone...

  # TODO: This could potentially find multiple matching directories, in which
  # case it will error out below.  We should handle that case more gracefully
  repo=$(mdfind kind:folder "www-gitlab-com")

  if [ -z $repo ]; then
    echo "Repo not found, I'll create it in: $STARTINGDIR"
  else
    if [[ -d "$repo/.git" ]]; then
      echo "Repo found: $repo"
      echo "Is this the location of the GitLab handbook on your computer? ($repo)"
      select yn in "Yes" "No"; do
          case $yn in
              Yes ) REPO_LOCATION=$repo; break;;
              No ) echo "What is the path of the GitLab handbook on your computer?"; read REPO_LOCATION; break;;
          esac
      done
    else
      echo "Repo found but wasn't a git repository: $repo"
      printf "\n\n\nYou can manually specify the location with REPO_LOCATION, e.g. 'export REPO_LOCATION=~/path/to/www-gitlab-com'\n\n"
      printf "Or, you can run this from the root of an existing www-gitlab-com clone with: 'script/setup-macos-dev-environment.sh'"
      exit 1
    fi
  fi

  echo "REPO_LOCATION: $REPO_LOCATION"
}

installxcodetools() {
  if [[ ! $(xcode-select -v ) ]]; then
    check=$((xcode-\select --install) 2>&1)
    echo $check
    str="xcode-select: note: install requested for command line developer tools"
    while [[ "$check" == "$str" ]];
    do
      osascript -e 'tell app "System Events" to display dialog "xcode command-line tools missing." buttons "OK" default button 1 with title "xcode command-line tools"'
      echo "Once the command line tools have finished installing, please run this script again"
      exit;  
    done
  fi
}

installhomebrew() {
  # Check if brew is installed
  which brew
  s=$(echo $?)

  # Install brew if it's not installed
  if [[ $s != 0 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install some dependencies from brew
  brew install coreutils git gpg
}

installasdf() {
  # Install asdf

  brew install asdf

  cat ~/.zshrc | grep "$(brew --prefix asdf)/asdf.sh"
  s=$(echo $?)

  if [[ $s == 1 ]]; then
    echo "Adding asdf config to zshrc"
    echo "\n. $(brew --prefix asdf)/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
  fi

  if [[ ! -d "${ZDOTDIR:-~}/.asdfrc" ]]; then
    touch ${ZDOTDIR:-~}/.asdfrc
  fi

  cat ~/.asdfrc | grep "legacy_version_file = yes"
  s=$(echo $?)

  if [[ $s == 1 ]]; then
    echo "Enabling legacy asdf version support"
    echo "\nlegacy_version_file = yes" >> ${ZDOTDIR:-~}/.asdfrc
  fi

  source ~/.zshrc

  # asdf deps
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
  asdf plugin-add nodejs
}

clone_repo_if_needed() {
  if [ -z $REPO_LOCATION ]; then
    cd $STARTINGDIR

    # Test if we can SSH to gitlab
    ssh -T git@gitlab.com
    s=$(echo $?)

    # Clone the code
    if [[ $s == 0 ]]; then
      echo "Cloning with SSH"
      git clone git@gitlab.com:gitlab-com/www-gitlab-com.git
    else
      echo "Cloning with HTTPS"
      git clone https://gitlab.com/gitlab-com/www-gitlab-com.git
    fi

    # Set the repo location now that we know it
    REPO_LOCATION="$STARTINGDIR/www-gitlab-com"
  fi
}

handbook() {
  # Setup local environment
  cd $REPO_LOCATION
  local rversion
  rversion=$(cat .ruby-version)

  asdf install ruby $rversion
  asdf global ruby $rversion

  asdf install
  asdf reshim

  asdf reshim ruby

  # In some cases this is more reliable than reshimming with asdf
  cd ..
  cd www-gitlab-com

  # Local gem deps
  bundle

  # Ensure that yarn is installed
  which yarn
  s=$(echo $?)

  if [[ $s != 0 ]]; then
    npm install -g yarn
  fi

  # Install yarn deps
  yarn
}

doctor() {
  bin/doctor
}

finished() {
  echo "\n===============================================\n"
  echo "If there were no failures listed above, you should now be able to open a new terminal to $REPO_LOCATION and run the sites locally.\n"
  echo "See https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/README.md#local-development for more instructions.\n"
  echo "\n===============================================\n"
}

main() {
  echo 'This script is provided as a convenience, but is currently unsupported. If you have problems with it, please follow the manual instructions at https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/doc/development.md#local-development'
  setrepolocation
  installxcodetools
  installhomebrew
  installasdf
  clone_repo_if_needed
  handbook
  doctor
  finished
}

main
