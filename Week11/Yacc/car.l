%{
#include<stdio.h>
#include "y.tab.h"

%}






%%

Open {return Open; printf("Door is %s\n", yytext);   }
Close { return Close;printf("Door is %s\n", yytext);    }
Up {return Up; printf("Window is %s\n", yytext);   }
Down {return Down; printf("Window is %s\n", yytext);  }
On {return On;printf("Brake is %s\n", yytext);  }
Off {return Off;printf("Brake is %s\n", yytext); }
Pump {return Pump;printf("Throttle is %s\n", yytext); }
Relese {return Relese;printf("Throttle is %s\n", yytext); }
[0-4] {return Transmission;printf("Transmission is %s\n", yytext); }
[+()] {return *yytext;}



\n {return 0;}
%%




