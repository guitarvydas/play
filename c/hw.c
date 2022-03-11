#include <stdio.h>


int main0()
{
    return 0;
}
int main1()
{
    putc ('b', stdout);
    fputs ("yz\n", stdout);
    return 1;
}

int main3 ()
{
    char c;
    fputs ("waiting for input...\n", stdout);
    c = getchar ();
    putc (c, stdout);
    return 3;
}

int main4 () 
{
    fputs ("done\n", stdout);
    return 4;
}

int main ()
{
    main0 ();
    main1 ();
    main3 ();
    main4 ();
}