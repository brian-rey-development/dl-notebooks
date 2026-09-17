# notebooks

Jupyter notebooks for deep learning and AI experiments. Companion to `00. foundations`.

## Setup

```sh
make install   # uv sync
make kernel    # register the venv as a Jupyter kernel (for VS Code / other frontends)
make lab       # launch JupyterLab
```

Notebooks live in `notebooks/`, generated figures in `outputs/`, local datasets in `data/` (git-ignored).

Outputs are stripped on commit via `nbstripout` so diffs stay readable.
