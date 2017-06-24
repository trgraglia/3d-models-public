$fn = 120;


rotate([90, 0, 0])
hull() {
    translate([0, 0.75, 0])
        cube([3, 1.5, 5], center = true);
    translate([0, 1.45, 0])
        cube([5, 0.1, 5], center = true);
}

cylinder(d = 3, h = 3);

translate([0, 0, 12.5])
rotate([90, 0, 0])
difference() {
    cube([20, 20, 5], center = true);
    cube([12, 12, 6], center = true);
}