# MATLAB Multiple Point Set Fitting Example

An attempt to implement the Least_Squares Fitting for multiple M-dimensional Point Sets algorithm from https://doi.org/10.1007/s00371-006-0022-6 although not working at the moment. 

[Alternative copy from Research Gate](https://www.researchgate.net/publication/225420764_Least-squares_fitting_of_multiple_M_-dimensional_point_sets)

I am hoping to use this algorithm to combine multiple point-sets which represent features of a 2D/3D scene observed from different perspectives and provide a point-set which better represents the true position of said features.

Currently Algorithm 1 from the paper and this implementation provide different result for the basic example presented in section 5.1 but I am not sure why.

## Usage
* `git clone` this directory and open in MATLAB
* Run the `main1.m` script. This attempts to implement `Algorithm 1` from the paper with the example 2D sets of points from section 5 and produce something similar to Figure 3.b and Table 1.

## What Works
The estimation of the transformation between two point-sets performed by the`theorem1` function appears to be OK with the assumption that the initial `Y0` value is set to `Y1`

## What Doesn't Work
The second function - `lemma1` returns a value of `Z` which should be similar to the points in `Y1` but is different an the value of error2 is incorrect
