# refs:
# - https://runnable.com/blog/9-common-dockerfile-mistakes
# - https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

FROM ubuntu:18.04

LABEL version=1.0

# homebrew dependencies
# ref - https://docs.brew.sh/Homebrew-on-Linux#debian-or-ubuntu
# TODO: use `--no-install-recommends` here, causes issues with ssl certs
RUN apt update && apt -y install \
      build-essential \
      curl \
      git \
      locales

# add `brew`-installed `zsh` to allowed shells
# note: this shell doesn't actually exist at the time of user creation but by
# the time it's used it will
RUN echo /home/dot/.linuxbrew/bin/zsh >> /etc/shells

# add `dot` user in order to use standard homebrew installation
# refs:
# - https://stackoverflow.com/questions/27701930/add-user-to-docker-container
# - https://docs.brew.sh/Homebrew-on-Linux
RUN useradd --create-home --shell /home/dot/.linuxbrew/bin/zsh dot

# fix locale issues - must be run as root
# ref - http://jaredmarkell.com/docker-and-locales/
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# switch to user for homebrew installation
USER dot
# set working directory (relative paths later in this file resolve from here)
WORKDIR /home/dot

# clone dotfiles to docker config
# TODO: use COPY instead of a monolithic clone
RUN git clone --single-branch --branch docker https://github.com/nathanshelly/.files

# set dotfiles for use in scripts
ENV DOTFILES /home/dot/.files
# install brew & all formulae - this takes a long time so run early for caching
RUN $DOTFILES/setup/bin/install_brew

RUN $DOTFILES/setup/bin/symlink

# add all formula to path
ENV PATH "/home/dot/.linuxbrew/bin:/home/dot/.linuxbrew/sbin:$PATH"

# needed for `zplugin` plugins during installation
# TODO: figure out other solution here
ENV TERM xterm-256color
RUN $DOTFILES/setup/bin/setup_bits_and_pieces

# cleans up git directory
# as of 11/14/19 removes only the unnecessary chunk added by `zplugin`
# installer
# TODO: remove this?
RUN cd "$DOTFILES" && git reset --hard

VOLUME ["/external"]

CMD ["zsh"]
