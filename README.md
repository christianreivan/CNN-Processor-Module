# CNN-Processor-Module

## INTRO
This project is addressed to design an Eyeris-based AI processor module. Operation uses Convolutional Neural Network (CNN) concept with the illustration as following[^1][1]:

<p align="center"><img width="400px" height="auto" alt="CNN Illustration" src="https://user-images.githubusercontent.com/53311342/148110221-086c58b1-9de2-43b4-a96f-3122fe8cc157.png"></p>

Operation is done between 2x2 filter matrix and 2x2 input matrix as shown in the figure below:

<p align="center">
    <img width="448" alt="image" src="https://user-images.githubusercontent.com/53311342/148112930-ad12d052-b45e-4a1f-bf3e-8b9c98e12a9d.png">
</p>

To make the operation simpler, we first convert the 3x3 fmap input matrix to toeplitz matrix. By doing that, we translate the original convolutional operation and windowing shift into ordinary matrix multiplications as depicted below:

<p align="center">
    <img width="639" alt="image" src="https://user-images.githubusercontent.com/53311342/148114273-54c1bb24-8bd9-421d-9d69-a690cf097c58.png">
</p>


## Checklists

- Designed simple Convolutional Neural Network (CNN) operation for Eyeris-based AI processor module with pipelining and folding architecture
- Translated block diagrams into RTL codes.
- Created design was behaviorally simulated in Quartus and Modelsim.

## ALERT
Should you intend to use all the RTL codes, please do not forget to cite the author as:

    -- This project was originally created by Christian Reivan, Bandung Institute of Technology.   
    -- Created from October to November 2021.
    -- I, hereby, declare that this RTL code is not used for any illegal or prohibited use.   
    
### References
[1]: http://eyeriss.mit.edu/tutorial.html

