/* SETTINGS */
$fn = 90;

/* VARIABLES */
cableWidth = 3.0;
clampWidthMultiplier = 3.0;
clampHeight = 2;
clampDiameter = cableWidth * clampWidthMultiplier;
clampRadius = clampDiameter * 0.5;

toothWidth = cableWidth * 0.25;
toothHeight = cableWidth * 0.1;

module tooth() {
    resize([toothWidth, toothHeight, 0], auto=[true, true, false]) rotate([0, 0, 45])
        cube([1, 1, clampHeight], center = true);
}

module teeth() {
    translate([clampRadius - toothWidth, 0, 0])
        tooth();
    translate([clampRadius - (toothWidth * 2), 0, 0])
        tooth();
    translate([clampRadius - (toothWidth * 3), 0, 0])
        tooth();
    translate([clampRadius - (toothWidth * 4), 0, 0])
        tooth();
    translate([clampRadius - (toothWidth * 5), 0, 0])
        tooth();
}

module clamp() {
    union(){
        difference() {
            cylinder(h = clampHeight, d = clampDiameter, center = true);
            cylinder(h = clampHeight * 2, d = cableWidth, center = true);
            
            translate([0, cableWidth * -0.5, -50])
                cube([100, cableWidth, 100]);
            
            translate([(cableWidth * (clampWidthMultiplier * 0.5)) - (cableWidth * 0.1), -50, -50])
                cube([100, 100, 100]);
        }
        
        translate([cableWidth * 0.025, cableWidth * 0.5, 0])
            teeth();
        
        translate([cableWidth * 0.025, cableWidth * -0.5, 0])
            teeth();
    }
}

module clampRoundedEdge() {
    minkowski() {
        cylinder(h = clampHeight - 0.2, d = clampDiameter - 0.2, center = true);
        sphere(r = 0.1);
    }
}

intersection() {
    clamp();
    clampRoundedEdge();
}
