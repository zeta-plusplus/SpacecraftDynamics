within SpacecraftDynamics.OrbitalDynamics.Examples.EngineeringStudies;

model SpeedOf3times_01
  extends Modelica.Icons.Example;
  
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}})));
  Components.GravitationalForce Fgravity1(m_a_ref = Earth.m, m_b_ref = MS06S_RedComet.m)  annotation(
    Placement(transformation(origin = {35, -23.5}, extent = {{-15, -5.5}, {15, 5.5}})));
  Components.Spacecraft00 MS06S_RedComet(r_0_start = {(6378.137 + 400)*10.0^3.0, 0.0, 0.0}, v_0_start = {0.0, 3*7600, 0.0}) annotation(
    Placement(transformation(origin = {70, -23}, extent = {{-10, -10}, {10, 10}})));
  AstronomicalObjects.Earth Earth annotation(
    Placement(transformation(origin = {-20, 10}, extent = {{-20, -20}, {20, 20}})));
  OrbitalDynamics.Components.GravitationalForce Fgravity2(m_a_ref = Earth.m, m_b_ref = WhiteBase.m)  annotation(
    Placement(transformation(origin = {19, 50.5}, extent = {{-15, -5.5}, {15, 5.5}})));
  OrbitalDynamics.Components.Spacecraft00 WhiteBase(r_0_start = {cos(10*Modelica.Constants.pi/180)*(6378.137 + 400)*10.0^3.0, sin(10*Modelica.Constants.pi/180)*(6378.137 + 400)*10.0^3.0, 0.0}, v_0_start = {-1*sin(10*Modelica.Constants.pi/180)*7600, cos(10*Modelica.Constants.pi/180)*7600, 0.0}) annotation(
    Placement(transformation(origin = {64, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeVelocity relativeVelocity annotation(
    Placement(transformation(origin = {42, 15}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Sensors.Distance distance annotation(
    Placement(transformation(origin = {60, 15}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Continuous.Der der_dist annotation(
    Placement(transformation(origin = {77, 15}, extent = {{-5, -5}, {5, 5}})));
equation
  connect(world.frame_b, Earth.frame_a) annotation(
    Line(points = {{-70, 10}, {-40, 10}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity1.frame_a, Earth.frame_a) annotation(
    Line(points = {{-40, 10}, {-40, -23.5}, {20, -23.5}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity1.frame_b, MS06S_RedComet.frame_a) annotation(
    Line(points = {{50, -23.5}, {55, -23.5}, {55, -23}, {60, -23}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity2.frame_b, WhiteBase.frame_a) annotation(
    Line(points = {{34, 50.5}, {34, 50}, {54, 50}}, color = {95, 95, 95}, thickness = 3));
  connect(WhiteBase.frame_a, relativeVelocity.frame_a) annotation(
    Line(points = {{54, 50}, {54, 33}, {42, 33}, {42, 20}}, color = {95, 95, 95}));
  connect(MS06S_RedComet.frame_a, relativeVelocity.frame_b) annotation(
    Line(points = {{60, -23}, {60, -6}, {42, -6}, {42, 10}}, color = {95, 95, 95}));
  connect(WhiteBase.frame_a, distance.frame_a) annotation(
    Line(points = {{54, 50}, {54, 33}, {60, 33}, {60, 20}}, color = {95, 95, 95}));
  connect(MS06S_RedComet.frame_a, distance.frame_b) annotation(
    Line(points = {{60, -23}, {60, 10}}, color = {95, 95, 95}));
  connect(Earth.frame_a, Fgravity2.frame_a) annotation(
    Line(points = {{-40, 10}, {-40, 51}, {4, 51}, {4, 50.5}}, color = {95, 95, 95}, thickness = 3));
  connect(Earth.frame_a, Fgravity1.frame_a) annotation(
    Line(points = {{-40, 10}, {14, 10}, {14, -22}}, color = {95, 95, 95}));
  connect(distance.distance, der_dist.u) annotation(
    Line(points = {{65.5, 15}, {71, 15}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 1));
end SpeedOf3times_01;
