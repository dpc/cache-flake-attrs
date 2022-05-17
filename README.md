# Cache builds of Nix flake attributes

This actions allows caching of builds of [Nix](https://nixos.org) flake attributes to improve workflow execution time. 

## Inputs

- `key` - An explicit key for restoring and saving the cache
- `flake_paths` - Flake paths to attributes to cache builds of

## Example workflow

```
name: example
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Cache install Nix packages
      uses: mtoohey31/cache-flake-attrs@v2
      with:
        key: ${{ runner.os }}-nix-${{ hashFiles('./flake.lock', './flake.nix') }}
    - name: Do some things
      run: nix --extra-experimental-features nix-command --extra-experimental-features flakes develop --ignore-environment --command make
```
