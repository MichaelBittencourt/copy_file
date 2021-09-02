#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<copy_file.h>

/* #define VERBOSE */

int main(int argc, char * argv[]) {
#ifdef VERBOSE
    printf("Start Program\n");
#endif
    if (argc == 3) {
        char * fromFile = argv[1];
        char * toFile = argv[2];
        copy_file_result result;
#ifdef VERBOSE
        printf("From file: %s\n", fromFile);
        printf("To file: %s\n", toFile);
        printf("Starting Copy\n");
#endif
        result = copyFromTo(fromFile, toFile);
        if (result.result) {
            fprintf(stderr, "Erro: %s\n", result.msg);
            return result.result;
        }
#ifdef VERBOSE
        printf("Copy Finish\n");
#endif
    }
    return 0;
}
