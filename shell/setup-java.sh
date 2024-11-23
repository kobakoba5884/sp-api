#!bin/bash

JAVA_VERSION=17.0.4-amzn
GRADLE_VERSION=7.3
MAVEN_VERSION=3.9.8
PKG=("zip", "unzip")

for PKG in "${PKG[@]}" ; do
  # https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
  if ! command -v zip &> /dev/null; then
    echo "zip is not installed. Installing..."
    if [ -x "$(command -v apt)" ]; then
      sudo apt update
      sudo apt install -y zip
    elif [ -x "$(command -v yum)" ]; then
      sudo yum install -y zip
    else
      echo "Unsupported package manager. Please install 'zip' manually."
      exit 1
    fi
  else,
    echo "zip is already installed."
  fi
done

curl -s "https://get.sdkman.io" | bash \
  && source "${HOME}/.sdkman/bin/sdkman-init.sh" \
  && sdk install java "${JAVA_VERSION}" \
  && sdk install gradle ${GRADLE_VERSION} \
  && sdk install maven ${MAVEN_VERSION}