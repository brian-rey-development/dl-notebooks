# 01. Notebooks

A series of Jupyter notebooks that build up deep learning from the very first artificial neuron,
one idea per notebook, at a pace meant for someone starting from zero. Every notebook mixes short
explanations, code you can edit and re-run, figures that show what the code is doing, and challenges
with collapsible solutions.

Companion to [dl-foundations](https://github.com/brian-rey-development/dl-foundations), which builds
a full network from scratch as a package. The notebooks go slower and start earlier; the package shows
where it all ends up.

## The notebooks

| # | Notebook | What you learn |
|---|----------|----------------|
| 00 | [Sanity check](notebooks/00-sanity-check.ipynb) | The environment works: imports, versions, a plot |
| 01 | [The McCulloch-Pitts neuron](notebooks/01-mcculloch-pitts-neuron.ipynb) | The 1943 neuron in plain Python. Logic gates, the step function, why one neuron draws a straight line, why XOR breaks it, and how a hidden layer fixes it |

Coming next: the perceptron (same neuron, plus a learning rule), then gradient descent, then the
multi-layer network that the foundations package implements.

## Quick start

Requires [uv](https://docs.astral.sh/uv/). Python 3.13 is installed automatically.

```bash
make install   # uv sync
make lab       # launch JupyterLab and open notebooks/ in the browser
```

Open a notebook, make sure the kernel is `Python (notebooks)`, and run cells with `Shift+Enter`.

Other ways to run them:

```bash
make notebook  # classic Jupyter Notebook interface instead of Lab
make kernel    # register the venv as a kernel for VS Code, Cursor or any other frontend
uv run jupyter execute notebooks/01-mcculloch-pitts-neuron.ipynb   # headless, to check it runs
```

## How the notebooks are written

**Slow ramp.** Plain Python first, NumPy only after you have felt why loops get tedious. Every cell
introduces one idea. Type hints are used throughout and explained the first time they appear.

**Pictures over prose.** Anything geometric is drawn: decision lines, the step function, network
diagrams, the hidden-layer transformation. The plotting code is there to read but you can skip it.

**Challenges with solutions.** After each key idea there is a challenge in a quote block, with the
solution folded under a "Show solution" toggle. Try before opening.

**Reproducible.** Every notebook runs top to bottom without manual steps. CI lints and format-checks
the notebook cells with ruff.

## Project layout

```
01. notebooks/
├── notebooks/           the notebooks, numbered in reading order
├── outputs/             figures saved from notebooks (gitignored)
├── data/                local datasets (gitignored)
├── pyproject.toml       dependencies and ruff config (notebooks included)
├── Makefile             install, lab, notebook, kernel, lint, format, check, clean
└── .github/workflows    CI: ruff check and format on .py and .ipynb
```

## Tooling

| Tool | Role |
|------|------|
| [uv](https://docs.astral.sh/uv/) | Environment, dependencies, lockfile, Python version |
| [JupyterLab](https://jupyterlab.readthedocs.io/) | Notebook interface |
| [ruff](https://docs.astral.sh/ruff/) | Linting and formatting, including notebook cells |
| [nbstripout](https://github.com/kynan/nbstripout) | Strips outputs on commit so diffs stay readable |
| pre-commit | Runs ruff, nbstripout and keeps `uv.lock` in sync on every commit |

Because outputs are stripped, a freshly cloned notebook shows no figures until you run it. That is
on purpose: the figures are part of the exercise.
