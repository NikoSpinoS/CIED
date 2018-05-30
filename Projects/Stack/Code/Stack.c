#include <stdio.h>
#include <stdlib.h>
#define N 10

int head = -1;
int check;
int arr[N];

void push(int x) {
	head++;
	arr[head] = x;
	if (head == N - 1) {
		check = 1;
	} else {
		check = 0;
	}
}

int pop(void) {
	int x;
	
	if (head >= 0) {
		x = arr[head];
		head -= 1;
		check = 0;
	} else {
		check = 1;
	}
	return x;
}

main() {
	int num,option,counterpop = 0,counterpush = 0,i;
	printf("Type 1 if you want to push a number in the stack.\n");
	printf("Type 2 if you want to pop a number from the stack.\n");
	printf("Type 3 if you are done.\n");
	do {
		do {
			printf("Enter your option\n");
			scanf("%d",&option);
		} while (option < 1 || option > 4);
		switch(option) {
			check = 0;
			case 1: {
				if (check == 0) {
					printf("Which number do you want to push?\n");
					scanf("%d",&num);
					push(num);
					counterpush++;
					printf("Number %d is pushed successfully in the stack.\n",num);
				} else {
					printf("Stack is already full.\n");
				}
				break;
			}
			case 2: {
				if (check == 0) {
					printf("Number %d is popped successfully from the stack.\n",pop());
					counterpop++;
				} else {
					printf("Stack is already empty.\n");
				}
				break;
			}
			case 3: {
				if (head >= 0) {
					for (i=0; i<=head; i++) {
						printf("arr[%d]: %d\n",i,arr[i]);
					}
				} else {
					printf("The stack is empty.\n");
				}
				break;
			}
		}
	} while (option != 4);
	if (option == 4) {
		printf("Function push has been called %d times.\n",counterpush);
		printf("Function pop has been called %d times.\n",counterpop);
	}
	system("PAUSE");
}
