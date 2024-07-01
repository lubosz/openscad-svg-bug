# Unable to render a union with a SVG path when curve self-intersects.

For paths that contain self-intersections caused by an inverted handle direction, rendering a union with extruded path fails with:
```
ERROR: The given mesh is not closed! Unable to convert to CGAL_Nef_Polyhedron.
```

The error is produced in [cgautils](https://github.com/openscad/openscad/blob/d4c36aa2bb7c20d9e3dd847ce96ebe6011bae39b/src/geometry/cgal/cgalutils.cc#L73) when a `CGAL_Polyhedron` is not closed.

| A bezier path node with a handle directions that cause self-intersection. |
|:--| 
| ![Broken node](/screenshots/a-broken.png) | 

| Fixed bezier path node. |
|:--| 
| ![Working node](/screenshots/a-working.png) | 

| Preview works without errors. |
|:--| 
| ![Preview works](/screenshots/a-preview.png) | 

| Without creating a union the mesh can be rendered. |
|:--| 
| ![Mesh creation works](/screenshots/a-render-no-cube-working.png) | 

SVGs in the wild can contain this issue without being apparent due to the path's complexity. It would be nice for openscad to handle this or to have a way to analyse which nodes cause the issue.

The issue can be produced with OpenSCAD master at `d4c36aa2bb7c20d9e3dd847ce96ebe6011bae39b`.
