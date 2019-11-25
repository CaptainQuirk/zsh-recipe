FROM registry.gitlab.com/leonardmessier/shef/shef:1.0.0

ARG USERNAME
COPY --chown=linuxbrew:linuxbrew ./ /home/${USERNAME}/.config/shef/recipes/captainquirk/zsh-recipe
WORKDIR /home/${USERNAME}/.config/shef/recipes/captainquirk/zsh-recipe

RUN shef install-recipe
CMD ["/usr/bin/zsh"]
