FROM ubuntu:latest

RUN apt update -y && apt upgrade -y
RUN apt install -y python3 pip curl git zsh neovim wget tmux

RUN pip3 install autopep8 flake8

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
