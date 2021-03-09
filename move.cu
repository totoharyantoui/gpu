#include<cuda.h>
#include<stdio.h>
#include <assert.h>

int main(void)
{
printf("Getting start CUDA excercise Now \n");
float *a_h, *b_h;    // variable declartion for host (CPU)
float *a_d, *b_d;    // variabel declaration for device (GPU)
int N = 14, nBytes, i,j ;

nBytes = N * sizeof(float);
//memory allocation for CPU
a_h = (float *)malloc(nBytes);
b_h = (float *)malloc(nBytes);

// memory allocation for GPU
cudaMalloc((void **) &a_d, nBytes);
cudaMalloc((void **) &b_d, nBytes);

printf("Value of a_h : \n");
for (i=0; i<N; i++) 
{
  a_h[i] = 100.f + i;
  printf("%f \n", a_h[i]);    // print value of a_h
}

// start using CUDA memory copy 

cudaMemcpy(a_d,a_h,nBytes,cudaMemcpyHostToDevice);    // CPU to GPU
cudaMemcpy(b_d,a_d,nBytes,cudaMemcpyDeviceToDevice);  // GPU to GPU
cudaMemcpy(b_h,b_d,nBytes,cudaMemcpyDeviceToHost);


// print value of b_h

printf ("Value of b_h : \n");
for (j=0; j<N; j++) 
{
  printf("%f \n", b_h[j]);    // print value of b_h
}

// we have not to show the values of a_h and b_h 

for(int i=0; i< N; i++) assert(a_h[i]==b_h[i]);


}
