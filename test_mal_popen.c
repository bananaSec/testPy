#include <stdio.h>
...


FILE *fp;
int status;
char path[PATH_MAX];

scanf("%d", &testIn);  
fp = popen(testIn, "r");
if (fp == NULL)
    /* Handle error */;


while (fgets(path, PATH_MAX, fp) != NULL)
    printf("%s", path);


status = pclose(fp);
if (status == -1) {
    /* Error reported by pclose() */
    ...
} else {
    /* Use macros described under wait() to inspect `status' in order
       to determine success/failure of command executed by popen() */
    ...
}