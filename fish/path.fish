# Android sdk
set --export ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $HOME/Library/Android/sdk/platform-tools $PATH
set -x PATH $ANDROID_HOME/tools $PATH

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH
