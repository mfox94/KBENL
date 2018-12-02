"""
Created on Mon Sep 10 16:27:26 2018

@author: Michele
"""

fname  = 'proper_names_row.csv'

with open(fname) as f:
    content = f.readlines()
content = [x.strip() for x in content]
final=':- dynamic(lex_proper_names/2).\n'
print(len(content))
for i in range(len(content)):
    string=content[i]

    list_nam=string.split(';')
    i=i+1
    output1='lex_proper_names('+list_nam[0]+','+list_nam[1]+').\n'
    final=final+output1

print(final)
f= open("lexicon_proper_names.pl","w+")
f.write(final)
f.close()