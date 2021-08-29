#include "copy_file.h"
#include <stdio.h>
#include <string.h>
#define BUFFER_SIZE 1000

copy_file_result createResult(int result) {
    copy_file_result ret;
    ret.result = result;
    switch(result) {
        case FROM_FILE_INVALID:
            strcpy(ret.msg, "From file invalid!");
            break;
        case TO_FILE_INVALID:
            strcpy(ret.msg, "To file invalid!");
            break;
        case WRITE_ERROR:
            strcpy(ret.msg, "Write while write in output file!");
            break;
        case NO_ERROR:
            strcpy(ret.msg, "No error occurs");
            break;
        default:
            strcpy(ret.msg, "Unknow error occurs!");
            break;
    }
    return ret;
}

copy_file_result copyFromTo(char * from, char * to) {
    FILE * fromFile = NULL;
    FILE * toFile = NULL;
    unsigned char buffer[BUFFER_SIZE];
    if((fromFile = fopen(from, "r")) == NULL) {
        return createResult(FROM_FILE_INVALID);
    }
    if((toFile = fopen(to, "w")) == NULL) {
        fclose(fromFile);
        return createResult(TO_FILE_INVALID);
    }
    while(!feof(fromFile)) {
        int qtdRead = fread(buffer, sizeof(unsigned char), BUFFER_SIZE, fromFile);
        int qtdWrite = fwrite(buffer, sizeof(unsigned char), qtdRead, toFile);
        if (qtdWrite != qtdRead) {
            fclose(fromFile);
            fclose(toFile);
            return createResult(WRITE_ERROR);
        }
    }
    fclose(fromFile);
    fclose(toFile);
    return createResult(NO_ERROR);
}
