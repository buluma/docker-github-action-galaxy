FROM python:3.9-alpine

LABEL maintainer="Michael Buluma"

WORKDIR /github/workspace

RUN apk add --update --no-cache --virtual build_dependencies gcc musl-dev libffi-dev openssl-dev rust cargo && \
    pip install --no-cache-dir ansible-core && \
    rm -rf /root/.cache /root/.cargo && \
    apk del build_dependencies

CMD cd ${path:-./} ; ansible-galaxy role import --branch ${git_branch} --api-key ${galaxy_api_key} $(echo $GITHUB_REPOSITORY | cut -d/ -f1) $(echo $GITHUB_REPOSITORY | cut -d/ -f2)

# vim: set filetype=dockerfile:
