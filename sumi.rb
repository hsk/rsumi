src = "1 + 2 * 3"
tokens = src.split(/[\s]*([0-9]+|[+\-\/*])/).reject!{|x| x==""}
p tokens
