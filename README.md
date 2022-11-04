# MATLAB Multiple Point Set Fitting Example

An attempt to implement the Least_Squares Fitting for multiple M-dimensional Point Sets algorithm from https://doi.org/10.1007/s00371-006-0022-6

I am hoping to use this algorithm to combine multiple point-sets which represent features of a 2D/3D scene observed from different perspectives and create a single map of points with improved accuracy by reducing the affects of equally distributed noise in the measured locations.

## Usage
* `git clone` this directory and open in MATLAB
* Run the `main1.m` script. This attempts to implement `Algorithm 1` from the paper with the example 2D sets of points from section 5 and produce something similar to Figure 3.b and Table 1.

## Notes
### R-Transpose Issue
It appears that equation (17) in `lemma1 ` which defines the optimal value of $x_{0}$

$$ x_{0}=\frac{\Sigma_{i=1}^k c_{i}R^i  (x_{i} - t_{i})}{\Sigma_{i=1}^k c_{i}^2}$$

Only works in this code when the *transpose* of the R matrix is used:

$$ x_{0}=\frac{\Sigma_{i=1}^k c_{i}[R^i]^{Transpose} (x_{i} - t_{i})}{\Sigma_{i=1}^k c_{i}^2}$$

This might be a typographical error in the paper or an error in the code based on some indexing issue.

This issue also applies to `lemma 2` although weighted sums are not tested in this code.

### "Free to Accesss" alternative paper
A similar paper to the one cited is avaliable on [research gate](https://www.researchgate.net/publication/225420764_Least-squares_fitting_of_multiple_M_-dimensional_point_sets) although the figure and equation numbering is different.



