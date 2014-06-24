sacla-h5-tools
==============

Matlab function set for processing the .h5 data from SACLA


# h5data
## Syntax
```
data = h5data('filename')
data = h5data('filename', d)
data = h5data('filename', d, tags)
```

## Description
`data = h5data('filename')` returns a cell consistings two elements;
 `data{1}` contains all images with different tags from the first detector
 (HQ data); `data{2}`, from the second detector (LQ data).

`data = h5data('filename', d)` returns a 3-D array containing all imageg
with different tags from the `d`-th detector. In "dual" mode, `d` can be
`1` or `2`.

`data = h5data('filename', d, tags)` returns an array containing specific
`tags`-th tag(s) from the `d`-th detector. `tags` can be a number or a
vector; in later case, `data` will be a 3-D array.


# saveh5data
## Syntax
```
data = saveh5data('filename')
data = saveh5data('filename', d)
data = saveh5data('filename', d, tags)
```

## Description
`data = h5data('filename')` generates two MAT files: `filename_d1.mat` and
`filename_d2.dat`, where images from the 1st and 2nd detectors are 
sotred, respectively.

`data = h5data('filename', d)` generates a MAT file which contains all
images from the `d`-th detector. In the case `d = [1 2]`, the result
is identical as `data = h5data('filename')`.

`data = h5data('filename', d, tags)` generates a MAT file which contains
specific `tags`-th images from the `d`-th detector. Again, `tags` can be
a vector, implying multiple image tag numbers.

