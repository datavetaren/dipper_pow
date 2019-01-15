#!/bin/bash
bibtex dipper_pow
latex dipper_pow.latex
dvipdfmx dipper_pow.dvi
open -g -a Preview.app dipper_pow.pdf
