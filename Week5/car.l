%{
int count=0;
%}


%%

[UP-Down][On-Off] {printf("Window is %s\n", yytext); printf("Brake is %s\n", yytext"); count++; }

.   {printf("Invalid");}

%%

int main(){
    print("Enter the order: ")
    yylex();
    printf("Window opration run 5d times", count);

    return 0;
}