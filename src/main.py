#!/usr/bin/env python

from pathlib import Path
import sys
import hydra
from omegaconf import DictConfig


def is_frozen() -> bool:
    return getattr(sys, "frozen", False) and hasattr(sys, "_MEIPASS")

def get_config_path() -> str:
    bin_path = Path(sys.executable if is_frozen() else __file__)
    return str(bin_path.parent.parent)


@hydra.main(version_base=None, config_path=get_config_path(), config_name="config")
def main(config: DictConfig):
    print(config.db)


if __name__ == "__main__":
    main()
