#!/usr/bin/env python

import hydra
from omegaconf import DictConfig

@hydra.main(version_base=None, config_path="..", config_name="config")
def main(config: DictConfig):
    print(config.db)

if __name__ == "__main__":
    main()
