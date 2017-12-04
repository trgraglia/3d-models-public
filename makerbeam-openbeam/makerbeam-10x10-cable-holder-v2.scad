$fn = 120;

height = 5;
boxOutside = 20;
boxInside = 15;
opening = true;

module cableHolder() {
    union() {
        // PEG
        hull() {
            translate([0, 0, 0.75])
                cube([height, 3, 1.5], center = true);
            translate([0, 0, 1.45])
                cube([height, 5, 0.1], center = true);
        }

        // STEM
        translate([0, 0, 3])
            cube([height, 3, 3], center = true);
        
        // BOX
        translate([0, 0, (boxOutside / 2) + 2.75])
            difference() {
                cube([height, boxOutside, boxOutside], center = true);
                cube([height + 1, boxInside, boxInside], center = true);
            }
    }
}

if(opening) {
    difference() {        
        cableHolder();
        translate([0, 0, (boxOutside * 2)])
            cube([height + 1, 3, (boxOutside * 2)], center = true);
    }
} else {
    cableHolder();
}