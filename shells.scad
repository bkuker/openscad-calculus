$fn = 50;

module shell(h, ir, th) {
    difference(){
        cylinder(h,ir+th,ir+th,false);
        cylinder(3*h,ir,ir,true);
    }
}

function f(x) = 4 - x * x;
dx = .25;

module shells(){
    for(x=[0:dx:2]){
        shell(f(x),x,dx-.05);
    }
}

module post(){
    translate([0,0,-.15]){
        shell(f(0)+.15, 0, dx-.05);
        cube([5,5,.3],true);
    }
}

disks();
//solid();

function g(y) = sqrt(4 - y);
dy = .4;

module disk(x,r,th) {
    translate([x,0,0]){
        rotate(90, [0, 1, 0]){
            cylinder(th,r,r,false);
        }
    }
}

module disks(){
    difference(){
        rotate(-90, [0,1,0]){
            for(y=[0:dy:4]){
                disk(1.1*y, g(y+dy), dy);
            }
        }
        cylinder(10,dx,dx,true);
    }
}



module solid(){
    dy=.05;
    rotate(-90, [0,1,0]){
        for(y=[0:dy:4]){
            translate([y,0,0]){
                rotate(90, [0, 1, 0]){
                    cylinder(dy,g(y),g(y+dy),false);
                }
            }
        }
    }
}
