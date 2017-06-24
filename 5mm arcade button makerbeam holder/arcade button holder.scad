$fn = 120;
thickness = 2;
height = 30;

// PLATE
difference() {   
    translate([0, 0, thickness / 2])
        cube([50, height, thickness], center = true);

    translate([-19, 0, 0])
        cylinder(d = 3, h = 100, center = true);

    translate([19, 0, 0])
        cylinder(d = 3, h = 100, center = true); 
 
    cylinder(d = 24, h = 100, center = true);
}

translate([25 - (thickness / 2), 0, 5]) rotate([0, 90, 0])
    side();

translate([-25 + (thickness / 2), 0, 5]) rotate([0, 90, 0])
    side();

translate([30, 0, 10 + (thickness / 2)])
    side();

translate([-30, 0, 10 + (thickness / 2)])
    side();

translate([25 - (thickness / 2), 0, 10 + (thickness / 2)])
    cube([thickness, height, thickness], center = true);

translate([-25 + (thickness / 2), 0, 10 + (thickness / 2)])
    cube([thickness, height, thickness], center = true);

module side() {
    difference() {
        cube([10, height, thickness], center = true);
        
        translate([0, 5, 0])
            cylinder(d = 3, h = 100, center = true);
        translate([0, -5, 0])
            cylinder(d = 3, h = 100, center = true);
    }
}