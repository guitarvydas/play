#!/usr/bin/env python3

import sys
import json
import html
import re

def tr (s, pattern, replacement):
    return s.replace (pattern, replacement)

get s from input file
tr ('@¹', '@1')
tr ('@²', '@2')
tr ('@⁰', '@0')
tr ('⟨*od ', '(list ')
tr ('“', '"')
tr ('”', '"')
tr ('_', ':_')
tr ('⟨int ', '(od-int ')
tr ('⟨void ', '(od-void ')
tr ('⟨char ', '(od-char ')
tr ('⟨varargs ', '(od-varargs ')
tr ('⟨function ', '(od-function ')
tr ('⟨bifunction ', '(od-bifunction ')
tr ('⟩', ')')
