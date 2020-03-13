# myst.example-project
An self contained example project for testing and development of myst syntax

## Required software

- html theme: https://github.com/pandas-dev/pydata-bootstrap-sphinx-theme 

## Creating an environment to work with the MyST-parser

1. Run `conda create -n myst_parser_env` and `source activate myst_parser_env` where `myst_parser_env` is the name of the virutal environment
2. Run `conda install pip` which will install pip in your virtual environment
3. Find your anaconda environment directory, for example: `opt/anaconda3/envs/myst_parser_env`
4. Install package by doing: `opt/anaconda3/envs/myst_parser_env/bin/pip install -e "git+https://github.com/ExecutableBookProject/MyST-Parser.git#egg=myst-parser[sphinx]"
`

## Converting rST to MyST

We use the `Pandoc` package to convert files from `rST` to `Pandoc` syntax.

1. Install `Pandoc` package by running: `brew install pandoc`
2. Run the following bash script to convert from `rST` to `Pandoc` syntax:

```bash
FILES=source_rst/*.rst
for f in $FILES

do
	s="${f##*/}"                                         # remove path
	filename="source/${s%.*}-MyST"                       # remove file suffix
	echo "Converting $f to $filename.md"
	`pandoc $f -f rst -t markdown -o $filename.md`
done
```

## Work in Progress

- [x] Decision on MyST footnote reference: update this MyST file `finite_markov-MyST.md`
- [x] Test cross-references: `finite_markov` has a potential test-case @JIT
- [ ] Comment label in math equation? `%` doesn't work
- [ ] Math labels are not always present post conversion (this information is not present at all in the document)
- [ ] Check whether using int footnote produces a bug for `[^1]`
- [ ] Add space: `[Tau86]George Tauchen.`
- [ ] References appear after citations by design. Does it make sense?
- [ ] Remove "\n" from citation because it does not render in MyST

## rST to Pandoc to MyST

|    rST        |      Pandoc   |     MyST      | 
| ------------- | ------------- | ------------- |
| `---`         |    `\-\--`    |      `---`    |
| ``` `P` ```  | `[P]{.title-ref}`  | ``` `P` ```  |
| ``` `rich` ```  | `[rich]{.title-ref}`  | ``` `rich` ```  |
| ``` :eq:`fin_mc_fr` ``` | ``` `fin_mc_fr`{.interpreted-text role="eq"} ```  | ``` {math:numref}`fin_mc_fr` ```  |
| ``` :doc:`lecture on AR(1) processes <ar1_processes>` ``` | ```` `lecture on AR(1) processes <ar1_processes>`{.interpreted-text role="doc"} ```` | `[lecture on AR(1) processes](ar1_processes)` |
| ``` :cite:`caplin1985variability` ``` | ```` `caplin1985variability`{.interpreted-text role="cite"} ```` | ```` {cite}`caplin1985variability` ```` |

1. Also `.. code:: ipython3` > `{.sourceCode .ipython3}`
```
.. code-block:: python3

    P = [[0.4, 0.6], 
         [0.2, 0.8]]
```
````
```{.sourceCode .python3}
	P = [[0.4, 0.6], 
	     [0.2, 0.8]]
```
````
>>
````
```python
P = [[0.4, 0.6], 
     [0.2, 0.8]]
```
````

2. 
```
.. _new_interp_sd:

This gives us another way to interpret the stationary distribution --- provided that the convergence result in :eq:`llnfmc0` is valid.
```

````
::: {#new_interp_sd}
This gives us another way to interpret the stationary distribution ---
provided that the convergence result in `llnfmc0`{.interpreted-text
role="eq"} is valid.
:::
````

```
(new_interp_sd)=

This gives us another way to interpret the stationary distribution --- provided that the convergence result in :eq:`llnfmc0` is valid.
```

3. 
```
.. code-block:: none

    d -> h;
```
````
``` {.sourceCode .none}
d -> h;
```
````

````
```
d -> h;
```
````

4. 
```
Even better, write a function that returns an instance of `QuantEcon.py's <http://quantecon.org/quantecon-py>`__ `MarkovChain` class.
```

```
Even better, write a function that returns an instance of
    [QuantEcon.py\'s](http://quantecon.org/quantecon-py)
    [MarkovChain]{.title-ref} class.
```

````
Even better, write a function that returns an instance of
    [QuantEcon.py\'s](http://quantecon.org/quantecon-py)
    `MarkovChain` class.
````

5.
```
.. highlight:: python3
```

```
::: {.highlight}
python3
:::
```

```

```

6.
```
******************
Inventory Dynamics
******************
```

```
Inventory Dynamics
==================
```

```
# Inventory Dynamics
```

7.
```
************************************
:index:`Finite Markov Chains`
************************************
```

```
`Finite Markov Chains`{.interpreted-text role="index"}
======================================================
```

```
# Finite Markov Chains
```

8. 
```
.. contents:: :depth: 2
```

```
::: {.contents}

depth

:   2
:::
```

```{contents}
---
depth: 2
---
```

9.
```
.. include:: /_static/includes/header.raw
```

```

```

````
```{note}
You can {download}`Download the source file for this page <./finite_markov-MyST.md>`
```
````

10.
```
.. index::
    single: Markov process, inventory
```

```
::: {.index}
single: Markov process, inventory
:::
```

```

```

11.
````
We can also approximate the distribution using a `kernel density estimator
<https://en.wikipedia.org/wiki/Kernel_density_estimation>`__. 
````
```
We can also approximate the distribution using a [kernel density
estimator
\<https://en.wikipedia.org/wiki/Kernel\_density\_estimation\>]{.title-ref}\_\_.
```
````
We can also approximate the distribution using a 
[kernel density estimator](https://en.wikipedia.org/wiki/Kernel_density_estimation/)
````
_Note the broken link above._

**HOWEVER**
````
We will use a kernel density estimator from `scikit-learn <https://scikit-learn.org/stable/>`__
````

```
We will use a kernel density estimator from
[scikit-learn](https://scikit-learn.org/stable/)
```

```
We will use a kernel density estimator from
[scikit-learn](https://scikit-learn.org/stable/)
```

**Note**:
* Don't fully understand what `:index:` means in the lectures...

### To do:

1. rST headings:
```
******************
Inventory Dynamics
******************
```
`=========`   
`----------`  
Documentation states that `**********************` or `########` can also be used.
