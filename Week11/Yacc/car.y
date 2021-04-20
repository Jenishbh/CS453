%{
#include <stdio.h>
#include "y.tab.h"
int door_count=0;
int window_count=0;
int brake_count=0;
int throttle_count=0;
int trans_count=0;
%}

%token Open Close Up Down On Off Pump Relese Transmission 
%left '+'




%%
prog:
prog Drive
|
; 


Drive : Door Window Brake Throttle Transmission {printf("Valid Statment\n");door_count++;window_count++;brake_count++;throttle_count++;trans_count++;}
| Drive : Close Window Off Pump Transmission {printf("The car is Running\n");door_count++;window_count++;brake_count++;throttle_count++;trans_count++;}
| Drive: Door Window On Relese Transmission {printf("The car is Stady\n");door_count++;window_count++;brake_count++;throttle_count++;trans_count++;}
| Drive : add {fprintf(stderr, "\n", $1); };



add :   Drive '+' Open                    {$$ = $1 + $3;printf("\nThe Door is Open\n"); door_count++; }
        | Drive '+' Close                    {$$ = $1 + $3;printf("\nThe Door is Close\n"); door_count++; }
        | Drive '+' Up              {$$ = $1 + $3;printf("\nThe Window is Up\n");window_count++;}
        | Drive '+' Down              {$$ = $1 + $3;printf("\nThe Window is Down\n");window_count;}
        | Drive '+' On               {$$ = $1 + $3;printf("\nThe Brake is On\n");brake_count++;}
        | Drive '+' Off               {$$ = $1 + $3;printf("\nThe Brake is Off\n");brake_count++;}
        | Drive '+' Pump            {$$ = $1 + $3;printf("\nThe Throttle is Pump\n");throttle_count++;}
        | Drive '+' Relese            {$$ = $1 + $3;printf("\nThe Throttle is Relese\n");throttle_count++;}
        | Drive '+' Transmission       {$$ = $1 + $3;printf("\nThe Transmission is on\n");trans_count++;}
        | '(' Drive ')'                 {$$ = $2;} 
        ;


Door : Open | Close ;
Window : Up| Down;
Brake : On | Off ;
Throttle: Pump| Relese;








               

%%
int yywrap()
{
    return 1;
}
main(){
    printf("\nEnter Car Movment: ");
    yyparse();
    printf("The Door Runs %d Times\nThe Window Runs %d Times\nThe Brake Perform %d Times \nThe Thorttle Perform %d Times \nThe Transmission Perform %d Times\n", brake_count,window_count, brake_count,throttle_count,trans_count);
}
yyerror(char *s){
    fprintf(stderr, "%s\n",s);
}