// (79.5 - 72.5)/2
// (12.5 - 5.5)/2

shell_thickness = 1.0;

box_inside_width = 83.0;
box_inside_height = 16.0;
box_inside_depth = 15.0;

nut_inside_daimeter = 3.4; 
nut_outside_daimeter = 5.0;
nut_height = box_inside_depth - 9;

nut_x_distance = 76.0;
nux_y_distance = 9.0;

translate([0,0,0.5]){
    cube([box_inside_width + 2 * shell_thickness, box_inside_height + 2 * shell_thickness, shell_thickness], center=true);
}

translate([0,0,1]){
    translate([0,0,box_inside_depth/2]) {
        difference() {
            cube([box_inside_width + 2 * shell_thickness, box_inside_height + 2 * shell_thickness, box_inside_depth], center=true);
            cube([box_inside_width, box_inside_height, box_inside_depth+0.01], center=true);
        }
    }

    for(y = [-nux_y_distance/2,nux_y_distance/2]) {
        for (x = [-nut_x_distance/2, nut_x_distance/2]) {
            translate([x, y, nut_height/2]) {
                difference() {
                    cylinder(h=nut_height, d=nut_outside_daimeter, $fn=32, center=true);
                    cylinder(h=nut_height+0.01, d=nut_inside_daimeter, $fn=32, center=true);            }
            }
        }
    }    
}
