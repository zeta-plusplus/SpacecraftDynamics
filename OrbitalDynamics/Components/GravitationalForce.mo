within SpacecraftDynamics.OrbitalDynamics.Components;

model GravitationalForce
  
  import units=Modelica.Units.SI;
  
  /*************************
  *************************/
  replaceable Real m_a_ref;
  replaceable Real m_b_ref;
  
  /*************************
  *************************/
  Real mu;
  units.Length magR_a_b;
  units.Force magFg_a_b;
  units.Acceleration magA_a;
  units.Acceleration magA_b;
  
  units.Length r_a_b[3];
  units.Force Fg_a_b[3];
  
  /*************************
  *************************/
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}), iconTransformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}), iconTransformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}})));
  
equation

  mu = Modelica.Constants.G*(m_a_ref + m_b_ref);
  magR_a_b = (r_a_b[1]^2 + r_a_b[2]^2 + r_a_b[3]^2)^(0.5);
  magFg_a_b= (Fg_a_b[1]^2+Fg_a_b[2]^2+Fg_a_b[3]^2)^(0.5);
  magA_a= magFg_a_b/m_a_ref;
  magA_b= magFg_a_b/m_b_ref;
  
  for i in 1:3 loop
    r_a_b[i]= frame_b.r_0[i] - frame_a.r_0[i];
    
    Fg_a_b[i]= -1.0*Modelica.Constants.G*m_a_ref*m_b_ref/(magR_a_b^3.0)*r_a_b[i];
    
    frame_a.f[i]=Fg_a_b[i];
    frame_b.f[i]=-1.0*Fg_a_b[i];
    frame_a.t[i]=0.0;
    frame_b.t[i]=0.0;
  end for;
  
  
annotation(
    defaultComponentName = "Fgravity",
  Icon(graphics = {Text(origin = {0, -40}, extent = {{-100, 12}, {100, -12}}, textString = "%name"), Line(origin = {-61, 0}, points = {{-39, 0}, {41, 0}}, thickness = 12, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {11, 0}, points = {{85, 0}, {9, 0}}, thickness = 12, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {0, 38}, extent = {{-100, 12}, {100, -12}}, textString = "F=G*m*M/r^2")}, coordinateSystem(preserveAspectRatio=false, extent = {{-100, -60}, {100, 60}})),
  Diagram(graphics));
end GravitationalForce;
