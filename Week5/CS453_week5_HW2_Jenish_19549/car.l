%{
int door_count=0;
int window_count=0;
int brake_count=0;
int throttle_count=0;
int trans_count=0;
%}



DOOR    Open|Close 
WINDOW  Up|Down
BRAKE   On|Off
Throttle Pump|Relese
Transmission [0-4]

Drive   DOOR+WINDOW+BRAKE+Throttle+Transmission

%%

{DOOR} {printf("Door is %s\n", yytext); door_count++; }
{WINDOW} {printf("Window is %s\n", yytext); window_count++; }
{BRAKE} {printf("Brake is %s\n", yytext); brake_count++; }
{Throttle} {printf("Throttle is %s\n", yytext); throttle_count++; }
{Transmission} {printf("Transmission is %s\n", yytext); trans_count++; }

{Drive}     {pritnf("Car is Running")}






\n {return 0;}
%%

yywrap() {}


int main(){
    printf("Enter the order: ");
    yylex();
    printf("\nDoor opration run %d times\nWindow opration run %d times\nBrakeopration run %d times\nThrottle opration run %d times\nTransmission opration run %d times\n", door_count,window_count,brake_count,throttle_count,trans_count);

    return 0;
}