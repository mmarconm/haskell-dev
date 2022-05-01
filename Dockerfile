FROM ubuntu:20.04

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for general locale data
# by Marcelo Marcon
ENV LANG C.UTF-8
ENV TZ=America/Cuiaba
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Haskell
# ARG GHCI_VERSION=9
# ARG CODE_PATH=/mnt

# Create the user
ARG USERNAME=me
ARG USER_UID=1001
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -s /bin/bash -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    sudo \
    tree \
    haskell-platform

# RUN chmod +x /entrypoint.sh
# ENTRYPOINT [ "/entrypoint.sh" ]
# EXPOSE 8069
USER me

# DOCKER_BUILD: docker build -t haskell_dev:9.1 .