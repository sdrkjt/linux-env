###Add a binary location with export PATH####
#export PATH=/home/users/trnguyen/BIN:${PATH}
#export QWTDIR=/usr/local/qwt

# load config files
setopt EXTENDED_GLOB
if [ -d ${HOME}/.zsh/config ]; then
	foreach file (${HOME}/.zsh/config/*~*~)
		source $file
	end
elif [ -d /home/users/setup/zsh/config ]; then
	foreach file (/home/users/setup/zsh/config/*~*~)
		source $file
	end
elif [ -d /etc/zsh/config ]; then
	foreach file (/etc/zsh/config/*~*~)
		source $file
	end

else
	echo "Warning : Cannot access to config directories."
fi

if [ -f ${HOME}/.zshrc.user ]; then
	source ${HOME}/.zshrc.user
fi

#export LD_LIBRARY_PATH=/usr/local/qwt/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH

