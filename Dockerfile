FROM ubuntu:latest

RUN apt update -y
RUN apt install python3 -y
RUN apt install pip -y
RUN apt install curl -y
RUN apt install git  -y
RUN apt install zsh -y
RUN apt install neovim -y
RUN apt install wget -y
RUN apt install tmux -y 

RUN pip3 install autopep8
RUN pip3 install flake8

# node js >= 14
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install nodejs -y

#  nvim config dir
RUN mkdir -p ~/.config/nvim

# plugin manager
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# copy nvim config
COPY init.vim /root/.config/nvim/

# install plugins
RUN nvim +PlugInstall +qall
RUN nvim +'CocInstall -sync coc-pyright' +qall
RUN nvim +CocUpdateSync +qall

# install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN ln -f /bin/zsh /bin/sh

# tmux conf
ENV TERM=xterm-256color
RUN echo "set -g default-shell /bin/zsh" > /root/.tmux.conf

ENTRYPOINT ["zsh"]
