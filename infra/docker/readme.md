# dotfiles in docker 🐳

## quick sandbox

If you have [docker](https://docker.com/) installed, run the following command for a sandbox of these dotfiles:

> See this [container on Docker Hub](https://hub.docker.com/repository/docker/nathanshelly/dotfiles/)

```bash
# `--name <name>` is entirely optional, makes it easier to reference the container
# `--interactive --tty` launches a shell (specifically `zsh`) in the container
docker run --name dot --interactive --tty nathanshelly/dotfiles:latest

# Run the below to mount a folder from your local filesystem for exploration with this
# dotfiles config. Access the folder in the container by `cd`ing to `/external`.
# Note: this allows for accidentally (or purposefully) running destructive commands against
# your local files, changes will persist after the container is stopped. Also, at least on
# macOS using Docker Desktop, mounting a directory murders your CPU and is still terribly slow.
docker run -it --mount src=<dir-to-mount>,target=/external,type=bind nathanshelly/dotfiles:latest
```

> Note: the `latest` tag is kept up to date with `HEAD` of the [`docker` branch](https://github.com/nathanshelly/.files/tree/docker) through automated builds (with about a 2.5 hour delay between pushes to `HEAD` and [deploys on Docker Hub](https://hub.docker.com/repository/docker/nathanshelly/dotfiles/builds). As of March 2021 this branch hasn't been updated for a while. Once [#111](https://github.com/nathanshelly/.files/pull/111) lands it should be easier to update going forward.

> Note II: if you want to use `sudo` inside the container for any reason you'll need to open a `root` shell into the running process from another shell by running the below (per this [StackOverflow post](https://stackoverflow.com/questions/28721699/root-password-inside-a-docker-container)):

```bash
# run commands as root in resulting shell (as `sudo`)
# Note: `--name dot` argument to `docker run` above comes in handy
# here. Without it we'd have to substitute a container id for `dot`
docker exec --user 0 --interactive --tty dot zsh
```

## differences from `main`/`macOS` setup

This setup mostly replicates the behavior of these dotfiles on macOS.

Among the few differences are no casks (or `mas` apps like Super Easy Timer) as they are not supported on Linux and a few less formulae (for example macOS-specific utilities like `trash`).
