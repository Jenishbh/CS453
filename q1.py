def solve(word):

    a=len(word)
    if any (s.isdigit() for s in word):
        return None
    if a>10:
        b=a-2
        print(str(word[0])+str(b)+str((word[-1])))
        
    else:
        print(str(word))

n=int(input())
for i in range(0,n):
    word=input()

    solve(word)


        

