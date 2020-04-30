#include <stdio.h>

main() {
	int sum = 0;
	int i;

	for (i = 0; i < 5; i++) {
		sum += i;
	}
	printf("%d\n", sum);
}