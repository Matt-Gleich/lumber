FROM golangci/golangci-lint:v1.33

# Meta data
LABEL maintainer="email@mattglei.ch"
LABEL description="🪵 A feature rich and easy to use logger for golang"

# Copying over files
COPY . /usr/src/app
WORKDIR /usr/src/app

# Installing hadolint:
WORKDIR /usr/bin
RUN curl -sL -o hadolint "https://github.com/hadolint/hadolint/releases/download/v1.17.6/hadolint-$(uname -s)-$(uname -m)"
RUN chmod 700 hadolint

# Installing make
RUN apt-get update && apt-get install make=4.2.1-1.2 -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

CMD ["make", "local-lint"]
