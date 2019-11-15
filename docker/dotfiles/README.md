# dotfiles in docker 🐳

If you have [docker](https://docker.com/) installed, run the following command for a sandbox of these dotfiles:

```shell
docker run --name dot --interactive --tty <image-name>
```

> Note: if you want to use `sudo` for any reason TODO: fill this in (per this [StackOverflow post](https://stackoverflow.com/questions/28721699/root-password-inside-a-docker-container))

This setup mostly replicates the behavior of these dotfiles on macOS with a few differences:

- no casks (not supported on Linux) and a few less formulae (either macOS-specific like `trash` or unnecessary for this sort of sandbox usage like `pandoc`)
- multiple items removed from `install_bits_and_pieces` (`tmuxinator`, `poetry`, "Super Easy Timer")
