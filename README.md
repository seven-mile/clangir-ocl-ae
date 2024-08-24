# OpenCL C support for ClangIR: Artifact Evaluation

### Prerequisites

* Make sure you can compile original polybenchGpu benchmarks in your environment. Depending on the situation, you may find OneAPI base toolkit helpful for a Intel-CPU-only evaluation.
* Build latest [ClangIR](https://github.com/llvm/clangir) from source, following the instructions from [ClangIR website](https://llvm.github.io/clangir/GettingStarted/build-install.html). Let's say you have the cmake build directory as `$CLANGIR_BUILD`.
* Build [`llvm-spirv` translator](https://github.com/KhronosGroup/SPIRV-LLVM-Translator) from source with your ClangIR repo as the base project (by setting `LLVM_DIR`). Make sure the executable `llvm-spirv` can be found in `PATH`. 
  * You can also try [prebuilt translator of LLVM v18.1](https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v18.1.2) for convenience. But the mismatch version may cause unexpected behaviors.

### Single test

```bash
# Optional env preparation.
. /opt/intel/oneapi/setvars.sh
# Make sure you can find llvm-spirv now.
which llvm-spirv

cd $THIS_REPO/OpenCL
# Compile OpenCL launching programs that interact with the OpenCL driver.
bash compileCodes.sh
# Compile *.cl files using ClangIR pipeline. The output is placed side by side
# with the source *.cl file with *.spv extension.
bash compileSPIRV.sh $CLANGIR_BUILD/bin/clang

# Go to the testcase you want to verify.
cd 2DCONV
# Run the executable.
./2DConvolution.exe
```

And hopefully, you can get a successful result verification log line:

```
number of platforms is 1
platform name is Intel(R) OpenCL
platform version is OpenCL 3.0 LINUX
number of devices is 1
device name is Intel(R) Xeon(R) Gold 6430
GPU Time in seconds:
0.008545
CPU Time in seconds:
0.011051
Non-Matching CPU-GPU Outputs Beyond Error Threshold of 1.05 Percent: 0
```

> [!NOTE]
> The so-called "GPU Time" and "GPU Outputs" here refer to the time and calc
> result of OpenCL kernel compiled by ClangIR. Although it may be actually run
> on a CPU.

### Run all OpenCL tests from polybenchGPU

After compiling code and SPIR-V binaries, you can also run all tests at once.

```bash
# Optional env preparation.
. /opt/intel/oneapi/setvars.sh
# Make sure you can find llvm-spirv now.
which llvm-spirv

cd $THIS_REPO/OpenCL
# Compile OpenCL launching programs that interact with the OpenCL driver.
bash compileCodes.sh
# Compile *.cl files using ClangIR pipeline. The output is placed side by side
# with the source *.cl file with *.spv extension.
bash compileSPIRV.sh $CLANGIR_BUILD/bin/clang

cd $THIS_REPO/OpenCL
bash runTests.sh
```

The testcases will be invoked one by one. If we detect the percentage of
non-matching result is `0`, the script will output a nice "PASS".

Note that some tests might take a while because polybenchGPU uses single-threaded CPU program to validate the results.

The output on my machine is:

```
❯ bash runTests.sh
2DConvolution: PASS
2mm: PASS
3DConvolution: PASS
3mm: PASS
adi: PASS
atax: PASS
bicg: PASS
correlation: PASS
covariance: PASS
fdtd2d: PASS
gemm: PASS
gemver: PASS
gesummv: PASS
gramschmidt: PASS
jacobi1D: PASS
jacobi2D: PASS
lu: PASS
mvt: PASS
syr2k: PASS
syrk: PASS
```
