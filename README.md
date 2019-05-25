# MATSCI 142 Coursereader

## About
This repo contains the MATSCI 142 coursereader used in Aaron Lindenberg's undergraduate quantum mechanics course at Stanford University. It is shared with the intent that future contributors can update the coursereader as the class continues to evolve. 

## Reading
If you would just like to read the coursereader, the PDF can be downloaded from [here](tex/MSE_142_CR_main.pdf).

## Contributing
There are many ways to contribute. From readers, I welcome any and all feedback through [this Google form](https://docs.google.com/forms/d/e/1FAIpQLSfBslPX-CTW2bvkPTJsWzHlVSHXC_u8ixhXTY8gSjVxzC-yyA/viewform). You can also follow the GitHub workflow and [file an Issue](https://github.com/enze-chen/mse_142_cr/issues) at the top.

If you would like to work on updating the coursereader, even better! After cloning this repo, you will need to have [LaTeX]("http://www.latex-project.org/") installed on your system in order to work with it. Feel free to use your favorite TeX distribution and editor, but for people who are new to the typesetting language, one recommendation is to first install either [MikTex](https://miktex.org/) (Windows) or [MacTex](http://tug.org/mactex/) (Mac OS), followed by the [TexStudio](http://texstudio.sourceforge.net/) editor which has many handy features.

The organization of the repo is as follows:
* All the `.tex` files for book content are in the [tex](./tex/) folder, and all the referenced figures (`PDF` and `PNG` files only) are in the [fig](./fig/) folder.
* The [`MSE_142_CR_main.tex`](./tex/MSE_142_CR_main.tex) file links each of the individual chapters together and loads the necessary packages. The actual content for each chapter is contained in its own `.tex` file. This refactoring maintains readability and localized changes.
* To compile the entire coursereader, build the **main** file. It will automatically join all the chapters together and link all references appropriately.
    * If you want to test an individual chapter, you can uncomment the lines at the top of the chapter and the last line, and compile it separately.
    * [`142crstyle.sty`](./tex/142crstyle.sty) has all of the packages and macros that would normally be in the preamble. Add any new packages and macros to this file, which is called by main.

## Figures
The LaTeX graphics path has been defined to search only within the [fig](./fig/) folder, so you only need to call the name of the figure in the text. The current set of figures that aren't screenshots of online sources are made natively using [MATLAB](https://www.mathworks.com/products/matlab.html) (accessible through Stanford [FarmShare](https://web.stanford.edu/group/farmshare/cgi-bin/wiki/index.php/MATLAB)) and [TikZ/PGF](http://www.texample.net/tikz/) (LaTeX package). These programs create lightweight, high-resolution *vector* graphics (when saved as `.pdf` file) that can rescale to any size without loss of resolution. There is no requirement to continue using these programs, but try to make future figures vectorized if possible.
