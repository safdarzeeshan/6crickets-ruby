# Ruby Project

## Problem

Suppose we want to construct a versatile software camera by combining many inflexible hardware cameras. Each hardware camera works well for a particular range of subject distances and for a particular range of light levels. The software camera will measure the light level and subject distance of each shot and choose an appropriate hardware camera to capture it. There are many hardware cameras on the market, and we are considering various proposals for which ones to include in our design. Write a function that takes the desired characteristics of the software camera (range of subject distances and range of light levels that it should support) and a list of hardware cameras with their respective characteristics, and tests whether that set of hardware cameras will suffice.

[The author of this story problem is neither a photographer nor a hardware engineer, so please forgive any implausibility.]

## Solution

In this project, I approached the problem by:

1. **Understanding Requirements**: We have a list of hardware camera where each hardware camera has two specifications which is the range of subject distance and range of light levels it supports.

We will build a function that takes the desired range of subject distance and light levels needed and checks if the combined list of cameras in the list of hardware cameras will support it. 

2. **Assumptions**: The ranges provided by the hardware cameras can be non-contigous. There might be a range skipped between two hardware camera. Such as camera A will have a light range 2-10 and camera B will have a light range 13-20. So in this case if the software camera requires a light value of 12 the hardware cameras can not support it.

3. **Implementation**: The main method will be used for each shot by the software camera. It will be provided 4 variables. This includes the hardware cameras light and distance ranges and the software camera's required light and distance range.

## How to run this
1. Copy the repository locally
2. Browse to the folder in the terminal
3. Pass the hardware camera light and distance ranges along with the desired range for the software camera like below.

`ruby camera_support_cli.rb "[hardware cameras distance ranges]" "[hardware cameras light ranges]" "software camera's desired distance range" "software camera's desired light range"`

example `ruby camera_support_cli.rb "1,5;6,10;10,15" "100,150;150,200;50,100" "1,11" "100,200"`


