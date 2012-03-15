#!/bin/bash

## make sure that the script is being called from the right directory
pushd . > /dev/null
cd ${0%/*}/conf

## setup symbolic links
i=0
for file in $(ls) ; do
  if [[ ( ! -L "$HOME/.$file" ) && ( $file != *.sh ) && ( $file != README* ) ]] ; then

    if [[ $i -eq 0 ]] ; then
      echo "## -- setting up symbolic links -- ##"
      i=1
    fi

    rm $HOME/.$file &> /dev/null
    ln -s ${PWD}/${file} ${HOME}/.${file}
    echo "ln -s $file \$HOME/.$file"

  #else
    #rm $HOME/.$file
  fi
done

## return to the original directory
popd > /dev/null

