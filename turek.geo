h = 0.03;
myhext=h;
//myhprecis=0.003;
myhprecis=myhext/5.;
Long=2.2;
Haut=0.41;
Circle_xc=0.2;
Circle_yc=0.2;
lgstruct=0.35101;
hstruct=0.02;
Circle_radius=0.05;
//Circle_r=;
Point(1) = {0., 0., 0., myhext};
Point(2) = {Long, 0., 0., myhext};
Point(3) = {Long, Haut, 0., myhext};
Point(4) = {0., Haut, 0., myhext};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Point(5) = {Circle_xc, Circle_yc, 0., myhprecis};
Point(6) = {Circle_xc-Circle_radius, Circle_yc, 0., myhprecis}; 
Point(7) = {Circle_xc+Circle_radius, Circle_yc, 0., myhprecis}; 

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 6};



// surface fluid
Line Loop(11) = {3, 4, 1, 2};
Line Loop(12) = {5, 6};
Plane Surface(1) = {11, 12};


Physical Line("FEELPP_GMSH_PHYSICALNAME_IGNORED") = {11};

Physical Line("inlet") = {4};
Physical Line("outlet") = {2};
Physical Line("wall1") = {1,3};
Physical Line("wall2") = {5,6};

Physical Surface("Fluid") = {1};



