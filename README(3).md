# ECE 366 Project 2 - Final Report

## Team & Contributions

- Rayees Ahmed (rahme41) - Implemented problem 1a and wrote Progress Report 1.
- Ryan Shiyang Chen (rchen68) - Implemented problem 1b and wrote Progress Report 2.
- Sophia Cole (scole30) - Integrated `IsFibonacciOdd(n)` (Part 1c) and prepared the Final Report submission.
- Sobenna Ezenekwe (sezen) - Assisted with planning, testing, and review.

## GitHub Repository

<https://github.com/Raye-A/ece366-project-2>

## How to Run in MARS

1. Open `IsFibonacciOdd.asm` in MARS.
2. In the `.data` section, change the `.word` value next to `n` to any positive integer. Note: because `division` uses repeated subtraction as required, keep `n` modest (e.g., `0` through `25`) for fast execution in MARS.
3. Select **Run > Assemble**, then **Run > Go**.
4. **Run I/O** prints `1 (True)` if $F(n)$ is odd, or `0 (False)` if $F(n)$ is even. **Data Segment** stores 1 or 0 at the `result` label.

The default input `n = 10` $F(10) = 55$, which is odd so `result` is set to `1` and Run I/O displays `1 (True)`.