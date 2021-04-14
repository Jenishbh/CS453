
n = int(input())

for i in range(0,n):
    a=input()


x=0

if a in "X++" or "++X":
    x=x+1
elif a in "X--" or "--X":
    x=x-1


print(x)
