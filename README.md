iCub Tech Docs
==============

[![GitHub Pages](https://github.com/icub-tech-iit/documentation/actions/workflows/gh-pages.yml/badge.svg)](https://github.com/icub-tech-iit/documentation/actions/workflows/gh-pages.yml)
[![Check Links](https://github.com/icub-tech-iit/documentation/actions/workflows/check-links.yml/badge.svg)](https://github.com/icub-tech-iit/documentation/actions/workflows/check-links.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

- 🌐 Browse our [online documentation](https://icub-tech-iit.github.io/documentation).
- ℹ️ You may consider checking out also our [old documentation](http://wiki.icub.eu/wiki/Main_Page), which might contain useful information that we haven't migrated yet.
- 📝 Importantly, you can contribute to these docs by fixing typos and proposing new additions (see below).

# Contributing
Check out our [CONTRIBUTING guidelines](./.github/CONTRIBUTING.md).

### 👨🏻‍💻 Maintainers
This repository is maintained by:

| | |
|:---:|:---:|
| [<img src="https://github.com/pattacini.png" width="40">](https://github.com/pattacini) | [@pattacini](https://github.com/pattacini) |

# ☁ Cloud Workflow
You can leverage on the following Cloud IDE's to quickly get a testing platform where to try out how the documentation is rendered.

## 🔘 [Gitpod](https://www.gitpod.io)
First off, sign up for Gitpod using your GitHub credentials. You'll have 50 hours/month of free usage on public and private repositories. Also, remember to visit the [Gitpod Integrations](https://gitpod.io/integrations) to make sure that all GitHub permissions are ticked in.

Then, install the [Gitpod browser extension](https://www.gitpod.io/docs/browser-extension).

| Click to enlarge |
| :---: |
| ![](./assets/gitpod.gif) |

## 🔘 [GitHub Codespaces](https://github.com/features/codespaces) (if available)

| Click to enlarge |
| :---: |
| ![](./assets/codespaces.gif) |

## 🔘 [GitHub Pages](https://pages.github.com) on Forks
> [!Warning]
When forking the repository, remember to copy out all the branches. Then, work on the default branch.

Follow the steps below where you have to correctly fill up the signature `your-fork`:
- Browse to https://github.com/your-fork/documentation/actions and enable the actions if they got disabled.
- Browse to https://github.com/your-fork/documentation/actions/workflows/gh-pages.yml and click on the <kbd>Run workflow</kbd> button.
- Browse to https://github.com/your-fork/documentation/settings/pages, select the `gh-pages` branch and wait until the GitHub Pages link becomes green to click on!

# 🔽 Local Workflow

## 💻 Install the environment yourself
If you prefer to work on the documentation on your own computer without using Cloud IDEs as described in the previous section,
you need to install [**`mkdocs`**](https://www.mkdocs.org/) first.

Once installed, just clone this repo, navigate to it and install the required dependencies:
```console
git clone https://github.com/icub-tech-iit/documentation.git
cd documentation
pip install $(mkdocs get-deps)
```

Finally, serve the content:
```console
mkdocs serve
```

## 📦 Rely on package managers
In the next sections, we will describe in detail how to install the required dependencies using different package managers.

### 🐍 conda
You can use the [conda-forge](https://conda-forge.org/) distribution to install the required dependencies on Linux, macOS or Windows.
First of all you need a conda distribution, for example [Miniforge3](https://github.com/conda-forge/miniforge).

If you already have a conda distribution, just create a new [environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) (for example called `mkdocs-env`) and install in it the require dependencies:
```console
git clone https://github.com/icub-tech-iit/documentation.git
cd documentation
conda create -n mkdocs-env
conda activate mkdocs-env
conda install --channel conda-forge mkdocs
conda install --channel conda-forge $(mkdocs get-deps)
```

After the installation, whenever you need to test the website just activate the `mkdocs-env` environment and call `mkdocs serve` in the `documentation` directory:
```console
cd documentation
conda activate mkdocs-env
mkdocs serve
```
