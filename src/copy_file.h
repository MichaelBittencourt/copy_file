#ifndef COPY_FILE_H
#define COPY_FILE_H

#define NO_ERROR 0
#define FROM_FILE_INVALID 1
#define TO_FILE_INVALID 2
#define WRITE_ERROR 3

#define MSG_SIZE 100

typedef struct copy_file_result {
    int result;
    char msg[MSG_SIZE];
} copy_file_result;

copy_file_result copyFromTo(char * from, char * to);

#endif
