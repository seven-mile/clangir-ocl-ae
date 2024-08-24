# OpenCL C Support for ClangIR

## Project Description

This project focuses on integrating OpenCL C language support into ClangIR, the new high-level IR of Clang. Additionally, it lays the groundwork for supporting future languages such as SYCL and CUDA.

## Details and Deliverables

All patches for this project have been merged into the [main repository of ClangIR](https://github.com/llvm/clangir).

We have been consistently maintaining [overview issue #689](https://github.com/llvm/clangir/issues/689), which serves as a rough development documentation. It includes sub-goals, the rationale behind decisions, implementation details, and future works.

The primary deliverables of the project include the overview issue and this artifact evaluation repository. We have successfully compiled and passed all OpenCL C test cases from the polybenchGpu repository. Please refer to the [README](./README.md) for detailed instructions.

## Lessons Learned

Collaborating with a world-renowned, high-quality open-source project has been an invaluable experience. From my first patch to the last, I have seen significant improvement in various areas.

I learned how to break down large patches into a series of smaller, more manageable patches, ensuring the quality of each submission. I was taught the importance of testing every code path thoroughly with robust test cases. Over time, I adapted to the collaborative workflow, closely aligning my contributions with the ongoing changes made by other community members.

Most importantly, I learned how to design common abstractions for real-world problems. For instance, working on the RFC for unified address spaces in ClangIR was the most challenging and interesting aspect of the project. Initially, I planned to simply replicate the address space from LLVM, overlooking the upstream abstraction that represents the source code. However, my mentors quickly pointed out the flaws in my design. Through our weekly meetings, we collaboratively devised a clean and efficient design, which was incredibly rewarding!

## Acknowledgements

I would like to express my gratitude to the entire community for their support and guidance. In particular, I am deeply thankful to my mentors Julian Oppermann, Victor Lomüller, and Bruno Cardoso Lopes for their unwavering assistance, guidance, and encouragement. They have been my greatest motivation throughout this journey. I would also like to thank Vinicius Couto Espindola for our close collaboration on ABI-related work.

## Appendix

* [Overview issue of OpenCL C support](https://github.com/llvm/clangir/issues/689)
* [Artifact Evaluation Instructions](./README.md)
