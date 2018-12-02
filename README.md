# KBENL
(Knowledge Explaination in Natural Language)
It is a tool, written in prolog, able to explain in natural language a series of facts present in any knowledge base.
It uses DCG for define a grammar that is the skeleton of each sentences produced.

There are 3 type of sentences that are compatible with this grammar:
```
  Simple sentences: they are simple phrases constructed following the pattern.
<Subject> <Verb> <List of complement>
```
or
```
Negative sentences: They follows the previous pattern, but the difference is that they are in the negative sense, so there is the auxiliary verb “don’t” or “doesn’t” properly conjugated. Obviously, also the logic form of the negative sentence will be different from the simple sentence.
<Subject> <don’t/ doesn’t> <Verb> <List of complement>
```
or
```
Descriptive Sentences: They are used for describing an entity and uses the following pattern.
<Subject> <is> <Adjective>
  ```
## Getting Started
Run 
```main.pl``` 
with your interpreter and choose the knowledge base provided among 
``` general_kb.pl``` 
or 
``` kb2.pl``` 
