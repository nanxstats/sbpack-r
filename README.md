# sbpack-r

sbpack-r is an R wrapper offering a functional interface for the Python package [sbpack](https://github.com/rabix/sbpack), which supports packing local or remote [Common Workflow Language](https://www.commonwl.org/) (CWL) apps and uploading them to Seven Bridges powered platforms.

## Installation

Install sbpack-r from GitHub:

```r
remotes::install_github("nanxstats/sbpack-r")
```

It depends on the Python package sbpack. Installed via pip:

```bash
pip3 install git+https://github.com/rabix/sbpack
```

## Usage

```r
reticulate::use_python("/usr/local/bin/python3")
library("sbpack")

"foo.cwl" %>% pack_to_file("bar.cwl")
"https://example.com/foo.cwl" %>% pack_to_file("bar.cwl")

"foo.cwl" %>% pack_to_sb("cgc", "user/project/app")
"https://example.com/foo.cwl" %>% pack_to_sb("cgc", "user/project/app")
```

## Developers

If you have already installed Python and sbpack, and want to develop sbpack-r in RStudio, simply create a file `.Rprofile` under the package directory and set the Python binary path (Homebrew Python 3 path example below):

```r
Sys.setenv(RETICULATE_PYTHON = "/usr/local/bin/python3")
```

The next time you open the project, the correct Python path and library path should be already set. For more technical details, see [reticulate Python version configuration](https://rstudio.github.io/reticulate/articles/versions.html).

## Copyright

© 2020 Seven Bridges Genomics, Inc. All rights reserved.

This project is licensed under the GNU Affero General Public License v3.
