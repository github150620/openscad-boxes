width = 43.2;
length = 21.1;
height = 12.2;
hole_diameter = 2.8;

translate([0,0,0.5]){
    cube([width+2.4,length+2.4,1],center=true);
}

for(y=[-8,8]){
    for(x=[-15,15]){
        translate([x,y,1]){
            difference(){
                cylinder(h=4,d=4.4,$fn=8);
                cylinder(h=4.01,d=2.2,$fn=8);
            }
        }
    }
}

translate([0,0,10]){
    difference(){
        cube([width+2.4,length+2.4,18], center=true);
        cube([width+0.4,length+0.4,18.2], center=true);
    }
}
