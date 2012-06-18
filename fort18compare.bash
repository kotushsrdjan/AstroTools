#!/bin/bash

awk '/reject/{print $1, $2, $3}; /chi/{VAR1 = $1; VAR2 = $3}END{print VAR1, VAR2}' fort.18

# breaks 18 into different file per iteration 
ENDN=$(awk -v n=100 '/squared/{n++}{if (NF > 8) print >"out" n ".txt"}END{print n}' fort.18) 
cat temp.head out$((ENDN - 1 )).txt > current.13

echo 
echo Iteration: $((ENDN - 100))

paste out$((ENDN - 5 )).txt out$((ENDN - 4 )).txt out$((ENDN - 3 )).txt out$((ENDN - 2 )).txt out$((ENDN - 1 )).txt | awk '{printf("%2.6f %2.6f %2.6f %2.6f %2.6f  %s %s %s\n"), $42 - $2, $12 - $2, $22 - $12, $32-$22, $42-$32, $43, $42, $41}' | sort -n


