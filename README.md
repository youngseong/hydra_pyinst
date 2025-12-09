# Hydra + PyInstaller Example

## Requirements

- Python 3.10+
- [Poetry](https://python-poetry.org/)

## How to set up the environment

```bash
poetry install
```

## How to build

```bash
./build.sh

ls -l dist/

# total 15780
# -rwxr-xr-x 1 young young 16156768 Dec  9 22:57 main
```

## How to run

You can compare the console output of both [src/main.py](./src/main.py) and the built binary.

```bash
# Python script
poetry run python3 src/main.py  # {'driver': 'mysql', 'user': 'omry', 'password': 'secret'}

# Built binary
./dist/main  # {'driver': 'mysql', 'user': 'omry', 'password': 'secret'}
```

## How to verify the config file access

You can either add `--info searchpath` to the CLI or try changing the file name of [config.yaml](./config.yaml).

### Add `--info searchpath` to CLI

```bash
./dist/main --info searchpath

# Config search path
# ******************
# | Provider | Search path                |
# -----------------------------------------
# | hydra    | pkg://hydra.conf           |
# | main     | file://<hydra_pyinst_root> |
# | schema   | structured://              |
# -----------------------------------------
```

### Change the config file name

```bash
mv config.yaml config.yaml.bak

./dist/main

# Cannot find primary config 'config'. Check that it's in your config search path.

# Config search path:
#         provider=hydra, path=pkg://hydra.conf
#         provider=main, path=file://<hydra_pyinst_root>
#         provider=schema, path=structured://

# Set the environment variable HYDRA_FULL_ERROR=1 for a complete stack trace.
```
