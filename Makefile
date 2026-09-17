.DEFAULT_GOAL := help

.PHONY: help install kernel lab notebook lint format check clean

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies (including dev tools)
	uv sync

kernel: ## Register this venv as a Jupyter kernel named "notebooks"
	uv run python -m ipykernel install --user --name notebooks --display-name "Python (notebooks)"

lab: ## Launch JupyterLab
	uv run jupyter lab

notebook: ## Launch classic Jupyter Notebook
	uv run jupyter notebook

lint: ## Lint notebooks and scripts with ruff
	uv run ruff check .

format: ## Format notebooks and scripts with ruff
	uv run ruff format .
	uv run ruff check --fix .

check: lint ## Run every quality gate

clean: ## Remove caches, checkpoints and generated plots
	rm -rf .ruff_cache outputs/*.png
	find . -type d \( -name __pycache__ -o -name .ipynb_checkpoints \) -exec rm -rf {} +
