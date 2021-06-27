# GENERATE COMBO OF TEXT FROM CMDLINE WITHOUT OOM

```
perl -le '@c = ("a".."z",0..9);
for $a(@c){
for $b(@c){
for $c(@c){
for $d(@c){
print "Https://github.com/$a$b$c$d"
}}}}' > ll
```
