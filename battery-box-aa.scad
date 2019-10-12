
shell_thickness = 1;

battery_height = 50.5 + 0.5;
battery_diameter = 14.1 + 0.2;

translate([0,0,shell_thickness/2]){
    cube([battery_diameter*6+2*shell_thickness,battery_height+2*shell_thickness,shell_thickness], center=true);
}

translate([0,0,battery_diameter/2+shell_thickness]){   
    difference() {
        cube([battery_diameter*6+2*shell_thickness,battery_height+2*shell_thickness,battery_diameter], center=true);
        cube([battery_diameter*6,battery_height,battery_diameter+0.01], center=true);
    }
}

difference() {
    translate([0,0,1+shell_thickness])
    {
        for (y = [-0.25*battery_height,0.25*battery_height]) {
            translate([0,y,0]){
                cube([battery_diameter*6,shell_thickness,2],center=true);
            }
        }
    }

    translate([0,0,battery_diameter/2+shell_thickness])
    {
        rotate([90,0,0])
        {
            for (x = [-2.5*battery_diameter,-1.5*battery_diameter,-0.5*battery_diameter,0.5*battery_diameter,1.5*battery_diameter,2.5*battery_diameter]) {
                translate([x,0,0]) {
                    cylinder(h=battery_height,d=battery_diameter, $fn=64, center=true);
                }
            }
        }
    }
}
