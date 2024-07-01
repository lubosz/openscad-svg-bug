// Produces "ERROR: The given mesh is not closed! Unable to convert to CGAL_Nef_Polyhedron. "
svg_path = "broken/a.svg";

// Works
// svg_path = "working/a.svg";

union() {
  // Commenting the cube line avoids the issue
  cube([50, 50, 1], center=true);

  linear_extrude(2) import(svg_path, center=true);
}


