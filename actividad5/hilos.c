#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("Thread created\n");
    pthread_exit(NULL);
}

int main() {
    pid_t pid;
    pthread_t thread;

    printf("Main process created\n");

    pid = fork();
    
    if (pid == 0) {
        printf("Child process 1 created\n");
        fork();
        
        if (pid == 0) {
            printf("Grandchild process created\n");
            pthread_create(&thread, NULL, thread_function, NULL);
        }
    }
    
    fork();

    sleep(1); // Esperar un momento para permitir que los procesos terminen antes de que se imprima el mensaje final

    printf("Exiting main process\n");

    return 0;
}
