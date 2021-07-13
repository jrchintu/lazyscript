## GENERATE COMBO OF TEXT FROM CMDLINE WITHOUT OOM [5-digit]

```
perl -le '@c = (0..9);
for $a(@c){
for $b(@c){
for $c(@c){
for $d(@c){
for $e(@c){
print "https://s3-ap-southeast-1.amazonaws.com/olts-static-content/assets/data/images/allen_new/paperpdf/paper-$a$b$c$d$e.pdf"
}}}}}'
```

## OLD [6-digit]
```
perl -le '@c = ("a".."z",0..9);
for $a(@c){
for $b(@c){
for $c(@c){
for $d(@c){
print "Https://github.com/$a$b$c$d"
}}}}'
```

## PRINTF
```
printf "https://github.com/test-%s.pdf\n" {1111..9999} >./url.txt
```
