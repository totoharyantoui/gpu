#include<cuda.h>
#include<stdio.h>

#define N 10

// id = blockIdx.x * blockDim.x + threadIdx.x 
// example blockId.x = 0,1,2; blokcDim.x = 5, threadIdx=0,1,2,3,4
// id 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14


ada type data pada CUDA

dim3 gridDim;
dim3 blockDim;
dim3 blockIdx:
dim3 threadIdx; 


__global__ void add(int *a, int *b, int *c ){

  int tid = blockIdx.x;
  if (tid < N)
    c[tid] = a[tid] + b[tid]; 

}
  



int main(void){

  int a[N],b[N],c[N];             // varieble Host 
  int *dev_a, *dev_b, *dev_c;     // variabel GPU
  
  // allocate the memory 
  (cudaMalloc)((void**)&dev_a, N * sizeof(int));
  (cudaMalloc)((void**)&dev_b, N * sizeof(int));
  (cudaMalloc)((void**)&dev_c, N * sizeof(int));
  
  // fill the array 'a' ad 'b' on CPU
  for (int i=0;i<N;i++){
    a[i] = -i;
    b[i] = i+1;  
      
  }
  
  // copy the array from host to device
  cudaMemcpy(dev_a,a,N*sizeof(int),cudaMemcpyHostToDevice);
  cudaMemcpy(dev_b,b,N*sizeof(int),cudaMemcpyHostToDevice);
  
  add<<<N,1>>>(dev_a,dev_b,dev_c);
  
  // copy the array c from device to host 
  cudaMemcpy(c,dev_c,N*sizeof(int),cudaMemcpyDeviceToHost);
  
  // display the result 
  for (int i=0;i<N;i++){
    printf("%d + %d = %d \n", a[i],b[i],c[i]);
  }
  
  // free the memory allocated on GPU 
  
  cudaFree(dev_a);
  cudaFree(dev_b);
  cudaFree(dev_c);
  
  
  return 0;
}
