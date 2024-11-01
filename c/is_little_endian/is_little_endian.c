#include <stdio.h>
 
union myunion
{
	int a;
	char b;
};
 
int is_little_endian(void)
{
	union myunion u1;
	u1.a = 0x12345678;
    if(0x78 == u1.b)
        return 1;
    else if(0x12 == u1.b)
	    return 0;
}
 
int is_little_endian2(void)
{
	int a = 0x12345678;
	char b = *((char *)(&a));
	if(0x78 == b)
        return 1;
    else if(0x12 == b)
	    return 0;
}
 
 
int main(void)
{
	int i = is_little_endian2();
	//int i = is_little_endian();
	if (i == 1)
	{
		printf("Litte Endian\n");
	}
	else
	{
		printf("Big Endian\n");
	}
	
	return 0;
}