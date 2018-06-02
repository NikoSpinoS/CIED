#include <stdlib.h>
#include <stdio.h>
#define N 10

int array[N], check;
int first = - 1;
int next = - 1;
int value_count =0;

int dequeue(void) {
	int x;
	if (value_count > 0) {
		x = array[first];
		if (first < N) {
			first += 1;
		} else {
			first = 0;
		}
		value_count -= 1;
		check = 0;
		return x;
	} else if (value_count == N) {
		x = array[first];
		first = 1;
		value_count -= 1;
		return x;
		check = 0;
	} else {
		check = 1;
	}
}

void enqueue(int x) {
	if (first == -1) {
		first = 0;
	}
	if (value_count < N) {
		if (next < N - 1) {
			next += 1;
		} else {
			next = 0;
		}
		array[next] = x;
		check = 0;
		value_count++;
	} else {
		check = 1;
	}
}

main() {
	int selection, num, cenqueue = 0, cdequeue = 0,i;

	printf("Press 1 to add number in queue (Enqueue)\n");
	printf("Press 2 to remove a number from dequeue (Dequeue)\n");
	printf("Press 3 to print the queue.\n");
	printf("Press 4 to exit\n");

	do {
		do {
			printf("Enter your option.\n");
			scanf("%d",&selection);
		} while (selection > 4 && selection < 1);
			switch (selection) {
				case 1: {
			 	    printf("Define the number you wish to enqueue.\n");
					scanf("%d",&num);
					enqueue(num);
					if (check == 0) {
						printf("Number %d is enqueued successfully.\n",num);
						cenqueue += 1;
						break;
					} else {
						printf("Queue is already full.\n");
						break;
					}
				}
				case 2: {
			 		num = dequeue(); 
					if (check == 0) {
						printf("Number %d is dequeued succesfully.\n",num);
						break;
					} else {
						printf("Queue is already empty.\n");
						break;
					}
				}
				case 3: {
					if (first > next) {
						for (i=first;i<=N-1;i++) {
							printf("array[%d] is %d.\n",i,array[i]);
						}
						for (i=0;i<=next;i++) {
							printf("array[%d] is %d.\n",i,array[i]);
						}
					} else {
						for (i=first;i<=next;i++) {
							printf("array[%d] is %d.\n",i,array[i]);
						}
					}
				}
			}
		
		} while (selection != 4);

	printf("Enqueue Counter: %d\n",cenqueue);
	printf("Dequeue Counter: %d\n",cdequeue);
	printf("\nShutting Down...\n");
	system("PAUSE");
}
