from pathlib import Path
from ruamel.yaml import YAML
from sbpack.pack import pack

fast_yaml = YAML(typ="safe")


def py_pack_file(input, output):
    fast_yaml.dump(pack(input), Path(output))
