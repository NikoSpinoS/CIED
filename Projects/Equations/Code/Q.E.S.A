#include <stdio.h>
#include <math.h>

main() {
	float a,b,c,Distinctive,x,x1,x2;
	printf("Assign a number in the variable a.\n");
	scanf("%f",&a);
	printf("Assign a number in the variable b.\n");
	scanf("%f",&b);
	printf("Assign a number in the variable c.\n");
	scanf("%f",&c);
	Distinctive = (pow(b,2)) - (4*a*c);
	printf("The distinctive of the quadric equation equals to %f\n",Distinctive);
	
	if (Distinctive > 0) {
		printf("The distinctive is greater than 0. 2 solutions are found.\n");
		x1 = ((-b + sqrt(Distinctive))/2*a);
		printf("The first solution equals to: %f\n",x1);
		x2 = ((-b - sqrt(Distinctive))/2*a);
		printf("The second solution equals to: %f\n",x2);
	}
	else if (Distinctive == 0) {
		printf("The equation has 1 double solution.\n");
		x = -b/2*a;
		printf("The solution equals to %f\n",x);
	}
	else {
		printf("The distinctive is less than 0. None of solutions exist.\n");
	}
	system("PAUSE");
}
