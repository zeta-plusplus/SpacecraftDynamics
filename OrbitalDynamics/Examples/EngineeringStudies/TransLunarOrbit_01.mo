within SpacecraftDynamics.OrbitalDynamics.Examples.EngineeringStudies;

model TransLunarOrbit_01
  extends Modelica.Icons.Example;
  
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}})));
  Components.GravitationalForce Fgravity_Earth_Moon(m_a_ref = Earth.m, m_b_ref = Moon.m)  annotation(
    Placement(transformation(origin = {24, 59.5}, extent = {{-18, -8.5}, {18, 8.5}})));
  AstronomicalObjects.Earth Earth annotation(
    Placement(transformation(origin = {-30, 20}, extent = {{-30, -30}, {30, 30}})));
  AstronomicalObjects.Moon Moon(r_0_Phase_xyplane_start = -46)  annotation(
    Placement(transformation(origin = {70, 59}, extent = {{-10, -10}, {10, 10}})));
  Components.Spacecraft00 Spacecraft(v_0_abs_start = 10800, r_0_Phase_xyplane_start = 180)  annotation(
    Placement(transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}})));
  SpacecraftDynamics.OrbitalDynamics.Components.GravitationalForce Fgravity_Earth_Spacecraft(m_a_ref = Earth.m, m_b_ref = Spacecraft.m) annotation(
    Placement(transformation(origin = {-18, -29.5}, extent = {{-18, -8.5}, {18, 8.5}})));
  SpacecraftDynamics.OrbitalDynamics.Components.GravitationalForce Fgravity_Moon_Spacecraft(m_a_ref = Moon.m, m_b_ref = Spacecraft.m) annotation(
    Placement(transformation(origin = {51, 10.5}, extent = {{-18, -8.5}, {18, 8.5}}, rotation = -90)));
equation
  connect(world.frame_b, Earth.frame_a) annotation(
    Line(points = {{-70, 20}, {-60, 20}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity_Earth_Moon.frame_a, Earth.frame_a) annotation(
    Line(points = {{6, 59.5}, {6, 59}, {-60, 59}, {-60, 20}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity_Earth_Moon.frame_b, Moon.frame_a) annotation(
    Line(points = {{42, 59.5}, {51, 59.5}, {51, 59}, {60, 59}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity_Earth_Spacecraft.frame_a, Earth.frame_a) annotation(
    Line(points = {{-36, -30}, {-60, -30}, {-60, 20}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity_Earth_Spacecraft.frame_b, Spacecraft.frame_a) annotation(
    Line(points = {{0, -30}, {20, -30}}, color = {95, 95, 95}, thickness = 3));
  connect(Moon.frame_a, Fgravity_Moon_Spacecraft.frame_a) annotation(
    Line(points = {{60, 59}, {60, 60.5}, {58, 60.5}, {58, 59}, {51, 59}, {51, 28.5}}, color = {95, 95, 95}, thickness = 3));
  connect(Spacecraft.frame_a, Fgravity_Moon_Spacecraft.frame_b) annotation(
    Line(points = {{20, -30}, {20, -7.5}, {51, -7.5}}, color = {95, 95, 95}, thickness = 3));
  annotation(
    experiment(StartTime = 0, StopTime = 400000, Tolerance = 1e-06, Interval = 100));
end TransLunarOrbit_01;
