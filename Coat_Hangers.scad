// Author:      Cosimo Orlando
// Release:     .1
// Date:        20/09/2019
// Description: A Turin FabLab Project (WIP)
// License:     Creative Commons Attribution-ShareAlike 4.0 International License (Non Commercial)


//***variables***//

wood_thickness = 15;
long           = wood_thickness*5;
s_multi        = 6;


//***object***//

color("yellow")
for(i=[-s_multi/2:s_multi/2]) translate([4*wood_thickness*i, 0, 0]) hook();

plate_one();
plate_two();


//***modules***//

module hook()
{
    cube([wood_thickness, long, wood_thickness], center=true);
        
//    color("red")
    translate([0, -long/2+wood_thickness/2, wood_thickness/2])
        cube([wood_thickness, wood_thickness, 2*wood_thickness], center=true);
        
//    translate([0, -long/2+wood_thickness*1.5, wood_thickness/2])
//        color("green")
//            cube([wood_thickness, wood_thickness, 30], center=true);
    
//    color("blue")    
    translate([0, -long/2+wood_thickness*2.5, -wood_thickness/2])
        cube([wood_thickness, wood_thickness, 2*wood_thickness], center=true);

//    color("green")        
    translate([-wood_thickness/2, -long/2+wood_thickness*4.2928, wood_thickness/4.828])
        rotate([-45, 0, 0])
        {
            cube([wood_thickness, wood_thickness, 2*wood_thickness]);
            
            translate([wood_thickness/2, wood_thickness/2, 2*wood_thickness])
                rotate([0, 90, 0])
                    cylinder(r=wood_thickness/2, h=wood_thickness, center=true, $fn=90);
        }
}

module plate_one()
{
    difference()
    {
        translate([0, -wood_thickness, 0]) rotate([90, 0, 0]) minkowski()
        {
            cube([s_multi*5*wood_thickness, long, wood_thickness], center=true);
            
            cylinder(r=wood_thickness/2, center=true, $fn=90);
        }
        
        for(i=[-s_multi/2:s_multi/2])
            translate([4*wood_thickness*i, -(3/2)*wood_thickness, (wood_thickness*0.4)/2])
                cube([wood_thickness, 3*wood_thickness, wood_thickness*1.4], center=true);
    }
}

module plate_two()
{
    color("red") difference()
    {
        translate([0, -2*wood_thickness-1, 0]) rotate([90, 0, 0]) minkowski()
        {
            cube([s_multi*5*wood_thickness, long, wood_thickness], center=true);
            
            cylinder(r=wood_thickness/2, center=true, $fn=90);
        }
        
        translate([0, -2*wood_thickness-1, 0]) rotate([90, 0, 0]) minkowski()
        {
            cube([s_multi*5*wood_thickness-2*wood_thickness,
                  long-2*wood_thickness,
                  wood_thickness+1], center=true);
            
            cylinder(r=(wood_thickness*0.5)/2, center=true, $fn=90);
        }
    }
}

