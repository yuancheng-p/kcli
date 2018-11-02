#!/bin/bash
# set -x

KCLI_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )
KCLI=$KCLI_HOME/kcli
KCLI_LINK=/usr/local/bin/kcli
ENV_DIR=$HOME/.kcli

if [ ! -d $ENV_DIR ]; then
    echo "Create $ENV_DIR"
    mkdir $ENV_DIR
fi


if [ ! -f $ENV_DIR/env.json ]; then
    echo "Create $ENV_DIR/env.json"
    cp $KCLI_HOME/env.json $ENV_DIR/env.json
fi


# (re-)create the link to kcli
echo "Link to kcli..."
rm $KCLI_LINK > /dev/null 2>&1
ln -s $KCLI $KCLI_LINK
echo "Done."

echo "Please try 'kcli --help'"
